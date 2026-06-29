local telescope_api = require("telescope")
local telescope_builtin = require("telescope.builtin")
local telescope_actions = require("telescope.actions")

telescope_api.setup({
	defaults = {
		-- sorting_strategy = "ascending",
		layout_config = {
			prompt_position = "top",
		},
		mappings = {
			i = {
				["<esc>"] = telescope_actions.close,
			},
			n = {
				["<esc>"] = telescope_actions.close,
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

telescope_api.load_extension("fzf")

vim.keymap.set("n", "<leader>ft", function()
	telescope_builtin.find_files()
end, { desc = "find files" })

local function get_git_root()
	-- Use Neovim built-in API instead of shell call for better performance
	local git_root = vim.fs.root(0, ".git")
	return git_root or vim.fn.getcwd()
end

vim.keymap.set("n", "<leader>v", function()
	telescope_builtin.lsp_document_symbols({
		symbols = { "function", "method", "class" }, -- 过滤类型
		layout_strategy = "horizontal",
		layout_config = {
			preview_width = 0.5,
		},
	})
end, { desc = "LSP Functions" })

vim.api.nvim_create_user_command("HistoryCommands", function()
	telescope_builtin.command_history()
end, { desc = "Commands History" })

vim.api.nvim_create_user_command("HistoryFiles", function()
	telescope_builtin.oldfiles()
end, { desc = "Files History" })
