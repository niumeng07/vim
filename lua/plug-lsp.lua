-- language server
local cmp = require("cmp")
local luasnip = require("luasnip")

local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	if col == 0 then
		return false
	end
	local text = vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]
	return text:sub(col, col):match("%s") == nil
end

cmp.setup({
	completion = {
		autocomplete = {
			cmp.TriggerEvent.InsertEnter,
			cmp.TriggerEvent.TextChanged,
		},
	},
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-k>"] = cmp.mapping.complete(), -- 手动触发补全
		["<CR>"] = cmp.mapping.confirm({ select = false }),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			elseif has_words_before() then
				cmp.complete()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
		["<C-e>"] = cmp.mapping(function()
			vim.api.nvim_feedkeys(
				vim.fn["copilot#Accept"](vim.api.nvim_replace_termcodes("<Tab>", true, true, true)),
				"i",
				true
			)
		end),
	}),
	experimental = {
		ghost_text = true,
	},
	-- complete sources
	sources = cmp.config.sources({
		-- { name = "copilot" },
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "path" },
		{ name = "buffer", keyword_length = 3 },
	}),
})

-- custom command: go to definition/declaration
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { silent = true })
vim.keymap.set("n", "<C-]>", vim.lsp.buf.definition, { silent = true })
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { silent = true })

-- custom command: mannully formatcode
vim.keymap.set("n", "<leader>f", function()
	require("conform").format({ async = true, lsp_fallback = true })
end)

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

-- diagnostic infomation config
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

require("luasnip.loaders.from_vscode").lazy_load()

local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- python lsp config
-- vim.lsp.config("ruff", {
-- 	capabilities = capabilities,
-- 	init_options = {
-- 		settings = {},
-- 	},
-- })

-- go lsp config
vim.lsp.config("gopls", {
	capabilities = capabilities,
	init_options = {
		settings = {},
	},
})

-- python lsp config
vim.lsp.config("pyright", {
	capabilities = capabilities,
})

-- c/c++ lsp config
vim.lsp.config("clangd", {
	capabilities = capabilities,
})

-- python scala config
vim.lsp.config("metals", {
	capabilities = capabilities,
	init_options = {
		settings = {},
	},
})

vim.api.nvim_create_autocmd("TextChangedI", {
	callback = function()
		local cmp = require("cmp")
		if not cmp.visible() then
			cmp.complete()
		end
	end,
})

vim.lsp.enable({ "pyright", "clangd", "gopls", "metals" })
