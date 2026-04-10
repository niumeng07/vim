require("dashboard").setup({
	theme = "hyper", -- theme is doom and hyper default is hyper
	disable_move, -- default is false disable move keymap for hyper
	shortcut_type = "number", -- shortcut type 'letter' or 'number'
	shuffle_letter, -- default is false, shortcut 'letter' will be randomize, set to false to have ordered letter
	letter_list, -- default is a-z, excluding j and k
	change_to_vcs_root, -- default is false,for open file in hyper mru. it will change to the root of vcs
	config = {
		-- config used for theme
		header,
		week_header = {
			enable = true,
			concat,
			append,
		},
		shortcut = {
			{
				desc = " New",
				group = "@property",
				action = "bd | enew",
				key = "n",
			},
			{
				desc = "󰊳 Update",
				group = "@property",
				action = "PlugUpdate",
				key = "u",
			},
			{
				icon = " ",
				icon_hl = "@variable",
				desc = "Files",
				group = "Label",
				action = "Telescope find_files",
				key = "f",
			},
			{
				desc = "󰆧 Tree",
				group = "Label",
				action = "NvimTreeToggle",
				key = "t",
			},
		},
		packages = {
			enable = true, -- show how many plugins neovim loaded
		},
		project = {
			enable = true,
			limit = 8,
			icon = "󰏓",
			label = "",
			action = "Telescope find_files cwd=",
		},
		mru = {
			enable = true,
			limit = 10,
			icon = "",
			label = "",
			cwd_only = false,
		},
		footer = {},
	},
	hide = {
		statusline, -- hide statusline default is true
		tabline, -- hide the tabline
		winbar, -- hide winbar
	},
	preview = {
		command, -- preview command
		file_path, -- preview file path
		file_height, -- preview file height
		file_width, -- preview file width
	},
})
