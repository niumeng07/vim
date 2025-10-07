-- mason
require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

-- mason lsp
local lspconfig = require("mason-lspconfig")

lspconfig.setup({
	ensure_installed = {
		"black",
		"clang-format",
		"clangd",
		"golangci-lint",
		"isort",
		"jq",
		"prettier",
		"prettierd",
		"pyright",
		"ruff",
		"rustfmt",
		"shfmt",
		"stylua",
		"xmlformatter",
		"yamlfmt",
	},
})
