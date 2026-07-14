require("config.lazy")
require("config.mason")

local function mason_bin(name)
	local path = vim.fs.joinpath(vim.fn.stdpath("data"), "mason", "bin", name)
	return vim.fn.executable(path) == 1 and path or nil
end

local function mason_cmd(name, fallback)
	local path = mason_bin(name)
	return path and { path } or fallback
end

vim.api.nvim_create_user_command("LspInfo", function()
	local bufnr = vim.api.nvim_get_current_buf()
	local bufname = vim.api.nvim_buf_get_name(bufnr)
	local ft = vim.bo[bufnr].filetype
	local clients = vim.lsp.get_clients({ bufnr = bufnr })

	local lines = {
		"Buffer: " .. (bufname ~= "" and bufname or "(empty)"),
		"Filetype: " .. (ft ~= "" and ft or "(none)"),
		"",
	}

	if #clients == 0 then
		table.insert(lines, "Active clients: none")
		if ft == "go" then
			table.insert(lines, "")
			table.insert(lines, "Go 提示: 需在含 go.mod 的项目中打开 .go 文件，gopls 才会 attach")
		elseif ft == "" then
			table.insert(lines, "")
			table.insert(lines, "提示: 先打开代码文件再查看 LSP 状态")
		end
	else
		table.insert(lines, "Active clients:")
		for _, client in ipairs(clients) do
			table.insert(lines, string.format(
				"  - %s (id=%d, root=%s)",
				client.name,
				client.id,
				client.config.root_dir or "nil"
			))
		end
	end

	vim.notify(table.concat(lines, "\n"), vim.log.levels.INFO, { title = "LSP Info" })
	vim.cmd.checkhealth("vim.lsp")
end, { desc = "Show LSP status for current buffer" })

local function lsp_filter_for_buf(bufnr)
	local ft = vim.bo[bufnr].filetype
	local server_by_ft = {
		go = "gopls",
		gomod = "gopls",
		gowork = "gopls",
		python = "pyright",
		c = "clangd",
		cpp = "clangd",
	}
	local server = server_by_ft[ft]
	if not server then
		return nil
	end
	return function(client)
		return client.name == server
	end
end

local function jump_to_items(items, offset_encoding)
	if #items == 0 then
		return false
	end
	if #items == 1 and items[1].user_data then
		vim.cmd("normal! m'")
		vim.lsp.util.show_document(items[1].user_data, offset_encoding or "utf-16", { focus = true })
		return true
	end
	if #items == 1 then
		local item = items[1]
		local buf = item.bufnr or vim.fn.bufadd(item.filename)
		vim.cmd("normal! m'")
		vim.bo[buf].buflisted = true
		vim.api.nvim_win_set_buf(0, buf)
		vim.api.nvim_win_set_cursor(0, { item.lnum, item.col - 1 })
		vim.cmd("normal! zv")
		return true
	end
	vim.fn.setqflist({}, " ", { title = "LSP locations", items = items })
	vim.cmd("botright copen")
	return true
end

local function goto_definition()
	local bufnr = vim.api.nvim_get_current_buf()
	local method = "textDocument/definition"
	local filter = lsp_filter_for_buf(bufnr)
	local retries = 8

	local function attempt()
		local clients = vim.lsp.get_clients({ bufnr = bufnr, method = method })
		if filter then
			clients = vim.tbl_filter(filter, clients)
		end

		if #clients == 0 then
			if retries > 0 then
				retries = retries - 1
				vim.defer_fn(attempt, 150)
				return
			end
			vim.notify("LSP 未就绪，请稍候再试或执行 :LspInfo", vim.log.levels.WARN)
			return
		end

		vim.lsp.buf_request_all(bufnr, method, function(client)
			if filter and not filter(client) then
				return
			end
			return vim.lsp.util.make_position_params(0, client.offset_encoding)
		end, function(results)
			local items = {}
			local encoding = "utf-16"
			for client_id, res in pairs(results) do
				if res and res.result then
					local client = vim.lsp.get_client_by_id(client_id)
					encoding = client.offset_encoding
					local locations = vim.islist(res.result) and res.result or { res.result }
					vim.list_extend(items, vim.lsp.util.locations_to_items(locations, client.offset_encoding))
				end
			end

			if #items == 0 then
				if retries > 0 then
					retries = retries - 1
					vim.defer_fn(attempt, 300)
					return
				end
				vim.notify("No locations found", vim.log.levels.INFO)
				return
			end

			jump_to_items(items, encoding)
		end)
	end

	attempt()
end

-- custom command: go to definition/declaration
vim.keymap.set("n", "gd", goto_definition, { silent = true, desc = "Go to definition" })
vim.keymap.set("n", "<C-]>", goto_definition, { silent = true, desc = "Go to definition" })
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { silent = true })

-- disable LSP diagnostic by default
vim.diagnostic.enable(false)

-- custom command: toggle diagnostic
vim.api.nvim_create_user_command("DiagnosticToggle", function()
	if vim.diagnostic.is_enabled() then
		vim.diagnostic.enable(false)
	else
		vim.diagnostic.enable()
	end
end, { desc = "toggle show diagnostic", force = true })

-- diagnostic information config
vim.diagnostic.config({
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "×",
			[vim.diagnostic.severity.WARN] = "»",
			[vim.diagnostic.severity.INFO] = "›",
			[vim.diagnostic.severity.HINT] = "·",
		},
		texthl = {
			[vim.diagnostic.severity.ERROR] = "Error",
			[vim.diagnostic.severity.WARN] = "Warn",
			[vim.diagnostic.severity.HINT] = "Hint",
			[vim.diagnostic.severity.INFO] = "Info",
		},
		numhl = {
			[vim.diagnostic.severity.ERROR] = "",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.HINT] = "",
			[vim.diagnostic.severity.INFO] = "",
		},
	},
	virtual_text = true,
	underline = false,

	update_in_insert = false,
	severity_sort = true,
	float = {
		focusable = true,
		style = "minimal",
		border = "rounded",
		source = "always",
		header = "",
		prefix = "",
	},
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.general.positionEncodings = { "utf-16" }

-- go lsp config
vim.lsp.config("gopls", {
	cmd = mason_cmd("gopls", { "gopls" }),
	capabilities = capabilities,
})

-- python lsp config
vim.lsp.config("pyright", {
	cmd = mason_cmd("pyright-langserver", { "pyright-langserver", "--stdio" }),
	capabilities = capabilities,
	settings = {
		python = {
			pythonPath = "/opt/homebrew/bin/python3.10",
			analysis = {
				autoSearchPaths = true,
				diagnosticMode = "openFilesOnly",
				useLibraryCodeForTypes = true,
			},
		},
	},
})

-- c/c++ lsp config
vim.lsp.config("clangd", {
	cmd = mason_cmd("clangd", { "clangd" }),
	capabilities = capabilities,
})

-- scala lsp config
vim.lsp.config("metals", {
	capabilities = capabilities,
})

vim.lsp.config("sqlls", {
	cmd = mason_cmd("sql-language-server", { "sql-language-server", "up", "--method", "stdio" }),
	capabilities = capabilities,
})

vim.lsp.config("bashls", {
	cmd = mason_cmd("bash-language-server", { "bash-language-server", "start" }),
	capabilities = capabilities,
})

vim.lsp.config("sourcekit", {
	cmd = { "xcrun", "sourcekit-lsp" },
})

vim.lsp.config("lua_ls", {
	cmd = mason_cmd("lua-language-server", { "lua-language-server" }),
	settings = {
		Lua = {
			codeLens = {
				enable = true,
			},
			hint = {
				enable = true,
				semicolon = "Disable",
			},
		},
	},
})

vim.lsp.enable({
	"pyright",
	"clangd",
	"gopls",
	"sourcekit",
	"bashls",
	"lua_ls",
	"sqlls",
})

-- vim.lsp.semantic_tokens.enable(true)
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		vim.lsp.semantic_tokens.enable(true, { bufnr = args.buf })
	end,
})

-- load plugins lua config
require("config.gitsigns")
require("config.copilot")
require("config.luasnip")
require("config.blink")
require("config.conform")
require("config.tree")
require("config.lazygit")
require("config.lualine")
require("config.telescope")
require("config.fzf")
require("config.mini")
