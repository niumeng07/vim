require("blink.cmp").setup({
	appearance = {
		nerd_font_variant = "mono",
	},
	completion = {
		documentation = { auto_show = true },
		keyword = { range = "full" },
	},
	sources = {
		default = { "lsp", "path", "buffer", "snippets" },
	},
	fuzzy = {
		implementation = "prefer_rust",
	},
	keymap = {
		preset = "default",
		["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
		["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
		["<CR>"] = { "accept", "fallback" },
	},
})
