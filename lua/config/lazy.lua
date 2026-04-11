local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if vim.fn.isdirectory(lazypath) == 0 then
	print("Installing lazy.nvim...")
	vim.fn.system({
		"git",
		"clone",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

local lazy = require("lazy")
lazy.setup({
	{
		"nvim-lua/plenary.nvim",
		lazy = false,
	},
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
		cmd = "Mason",
	},
	{ "mason-org/mason-lspconfig.nvim" },
	{ "neovim/nvim-lspconfig" },
	{ "scalameta/nvim-metals" },
	{ "nvim-lualine/lualine.nvim" },
	{ "niumeng07/vim-colorschemes" },
	{ "nvim-tree/nvim-tree.lua" },
	{
		"junegunn/fzf",
		build = "./install --bin",
	},
	{ "junegunn/fzf.vim" },
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release --target install",
		},
	},
	{ "kdheepak/lazygit.nvim" },
	{ "lewis6991/gitsigns.nvim" },
	{
		"nvim-mini/mini.nvim",
		version = false,
	},
	{ "github/copilot.vim" },
	-- {
	-- 	"zbirenbaum/copilot.lua",
	-- 	requires = {
	-- 		"copilotlsp-nvim/copilot-lsp",
	-- 	},
	-- 	cmd = "Copilot",
	-- 	event = "InsertEnter",
	-- 	config = function()
	-- 		require("copilot").setup({})
	-- 	end,
	-- },
	{ "mg979/vim-visual-multi" },
	{ "stevearc/conform.nvim" },
	{ "mbbill/undotree" },
	{
		"L3MON4D3/LuaSnip",
		build = "make install_jsregexp",
	},
	{
		"saghen/blink.cmp",
		build = "cargo build --release",
	},
	{ "folke/trouble.nvim" },
	{ "rafamadriz/friendly-snippets" },
})
