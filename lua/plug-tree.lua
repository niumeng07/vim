-- nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

local function main_attatch(bufnr)
	local api = require("nvim-tree.api")

	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	-- default mappings
	api.config.mappings.default_on_attach(bufnr)

	-- custom mappings
	-- vim.keymap.set("n", "<C-t>", api.tree.change_root_to_parent, opts("Up"))
	vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
	vim.keymap.set("n", "l", api.node.open.edit, opts("Open"))
	vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close Directory"))
	vim.keymap.set("n", "<C-o>", api.node.open.vertical, opts("Open Vertical"))
	vim.keymap.del("n", "<C-e>", { buffer = bufnr }) -- delete C-e as "Open in place" which is default
end

vim.keymap.set("n", "<leader>e", function()
	require("nvim-tree.api").tree.toggle()
end)

require("nvim-tree").setup({
	on_attach = main_attatch,
	sort = {
		sorter = "case_sensitive",
	},
	view = {
		width = 30,
	},
	renderer = {
		group_empty = true,
		hidden_display = "all",
		icons = {
			glyphs = {
				git = {
					unstaged = "•",
					staged = "√",
					unmerged = "¶",
					renamed = "®",
					untracked = "†",
					deleted = "–",
					ignored = "º",
				},
			},
		},
	},
	filters = {
		dotfiles = false, -- set true for hide dotfiles
	},
	diagnostics = {
		enable = false,
	},
	git = {
		enable = false, -- hide git status of files
		show_on_dirs = false, -- hide status of children files on dir
	},
})
