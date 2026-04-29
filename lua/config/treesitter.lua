treesitter_api = require("nvim-treesitter")

treesitter_api.setup({
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},

	indent = {
		enable = false,
	},

	incremental_selection = {
		enable = false,
	},

	textobjects = {
		enable = false,
	},

	matchup = {
		enable = false,
	},

	ensure_installed = {
		"python",
		"c",
		"cpp",
		"swift",
		"rust",
		"javascript",
		"scala",
		"java",
		"lua",
		"vim",
		"go",
		"bash",
		"dockerfile",
	},
})

vim.api.nvim_set_hl(0, "@variable", { fg = "#839496" })
