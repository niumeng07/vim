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
vim.defer_fn(function()
	require("mason-lspconfig").setup({
		automatic_installation = true,
		ensure_installed = {
			"gopls",
			"pyright",
			"lua_ls",
			"bashls",
			"sqlls",
		},
	})
end, 100)
