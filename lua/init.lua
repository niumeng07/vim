require("config.lazy")

-- custom command: go to definition/declaration
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { silent = true })
vim.keymap.set("n", "<C-]>", vim.lsp.buf.definition, { silent = true })
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
	capabilities = capabilities,
	init_options = {
		settings = {},
	},
})

-- python lsp config
vim.lsp.config("pyright", {
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
	capabilities = capabilities,
})

-- scala lsp config
vim.lsp.config("metals", {
	capabilities = capabilities,
	init_options = {
		settings = {},
	},
})

vim.lsp.config("sqlls", {
	capabilities = capabilities,
	init_options = {
		settings = {},
	},
})

vim.lsp.config("sourcekit", {
	cmd = { "xcrun", "sourcekit-lsp" },
})

vim.lsp.config("lua_ls", {
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
	"metals",
	"sourcekit",
	"docker_language_server",
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
require("config.mason")
require("config.conform")
require("config.tree")
require("config.lazygit")
require("config.lualine")
require("config.telescope")
require("config.fzf")
require("config.mini")
