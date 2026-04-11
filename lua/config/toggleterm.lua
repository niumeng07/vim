require("toggleterm").setup({
	size = 20,
	hide_numbers = true,
	shade_filetypes = {},
	highlights = {
		Normal = {},
		NormalFloat = { link = "Normal" },
		FloatBorder = {},
	},
	shade_terminals = true,
	start_in_insert = true,
	insert_mappings = true,
	terminal_mappings = true,
	persist_size = true,
	persist_mode = true,
	direction = "float",
	close_on_exit = true,
	clear_env = false,
	auto_scroll = true,
	float_opts = {
		border = "single",
		winblend = 3,
		title_pos = "center",
		width = 140,
		height = 30,
		row = 50,
		col = 50,
	},
	winbar = {
		enabled = false,
		name_formatter = function(term)
			return term.name
		end,
	},
	responsiveness = {
		horizontal_breakpoint = 135,
	},
})

vim.keymap.set("n", "<leader>t", function()
	require("toggleterm").toggle()
end)
