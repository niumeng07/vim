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
		automatic_installation = false,
		ensure_installed = {},
	})
end, 100)
