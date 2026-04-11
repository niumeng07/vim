require("telescope").setup({
	defaults = {
		-- sorting_strategy = "ascending",
		layout_config = {
			prompt_position = "top",
		},
		mappings = {
			i = {
				["<esc>"] = require("telescope.actions").close,
			},
			n = {
				["<esc>"] = require("telescope.actions").close,
			},
		},
	},
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case",
		},
	},
})

require("telescope").load_extension("fzf")

vim.keymap.set("n", "<leader>ft", function()
	require("telescope.builtin").find_files()
end, { desc = "telescope find files" })

-- vim.keymap.set("n", "<leader>rg", function()
-- 	require("telescope.builtin").grep_string()
-- end, { desc = "telescope grep string" })

local function get_git_root()
	local git_dir = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
	if vim.v.shell_error == 0 then
		return git_dir
	else
		return vim.fn.getcwd()
	end
end

-- vim.keymap.set("n", "<leader>rg", function()
-- 	require("telescope.builtin").live_grep({
-- 		cwd = get_git_root(),
-- 		grep_open_files = false, -- if true, search opening files only
-- 		search_dirs = { get_git_root() }, -- specify search directories
-- 	})
-- end, { desc = "telescope live grep (git root)" })

vim.keymap.set("n", "<leader>v", function()
	require("telescope.builtin").lsp_document_symbols({
		symbols = { "function", "method", "class" }, -- 过滤类型
		layout_strategy = "horizontal",
		layout_config = {
			preview_width = 0.5,
		},
	})
end, { desc = "LSP Functions (Telescope)" })
