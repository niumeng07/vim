vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

tree_api = require("nvim-tree.api")

local function main_attatch(bufnr)
	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	-- default mappings
	tree_api.config.mappings.default_on_attach(bufnr)

	-- custom mappings
	-- vim.keymap.set("n", "<C-t>", tree_api.tree.change_root_to_parent, opts("Up"))
	vim.keymap.set("n", "?", tree_api.tree.toggle_help, opts("Help"))
	vim.keymap.set("n", "l", tree_api.node.open.edit, opts("Open"))
	vim.keymap.set("n", "h", tree_api.node.navigate.parent_close, opts("Close Directory"))
	vim.keymap.set("n", "<C-o>", tree_api.node.open.vertical, opts("Open Vertical"))
	vim.keymap.del("n", "<C-e>", { buffer = bufnr }) -- delete C-e as "Open in place" which is default
end

vim.keymap.set("n", "<leader>e", function()
	tree_api.tree.toggle()
end)

require("nvim-tree").setup({
	on_attach = main_attatch,
	sort = {
		sorter = "case_sensitive",
	},
	view = {
		width = 30,
	},
	actions = {
		open_file = {
			quit_on_open = true,
		},
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
		enable = true, -- hide git status of files
		show_on_dirs = true, -- hide status of children files on dir
	},
})
