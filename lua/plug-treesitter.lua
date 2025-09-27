-- treesitter
require("nvim-treesitter").setup({
	install_dir = vim.fn.stdpath("data") .. "/site",
})

require("nvim-treesitter").install({
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
	"markdown",
})

-- treesitter highlight
vim.api.nvim_create_autocmd("FileType", {
	pattern = {
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
		"markdown",
	},
	callback = function()
		vim.treesitter.start()
	end,
})

vim.api.nvim_create_autocmd("User", {
	pattern = "TSUpdate",
	callback = function()
		require("nvim-treesitter.parsers").lua.install_info.generate = true
	end,
})

vim.api.nvim_set_hl(0, "@variable", { fg = "#839496" })
