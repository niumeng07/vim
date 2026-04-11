require("mini.pairs").setup()

require("mini.surround").setup({
	mappings = {
		add = "msa", -- Add surrounding in Normal and Visual modes
		delete = "msd", -- Delete surrounding
		find = "msf", -- Find surrounding (to the right)
		find_left = "msF", -- Find surrounding (to the left)
		highlight = "msh", -- Highlight surrounding
		replace = "msr", -- Replace surrounding

		suffix_last = "l", -- Suffix to search with "prev" method
		suffix_next = "n", -- Suffix to search with "next" method
	},
})

require("mini.align").setup({
	mappings = {
		start = "ga",
		start_with_preview = "gA",
	},
})

require("mini.ai").setup()

-- local starter = require("mini.starter")
--
-- starter.setup({
-- 	items = {
-- 		starter.sections.telescope(),
-- 	},
-- 	content_hooks = {
-- 		starter.gen_hook.adding_bullet(),
-- 		starter.gen_hook.aligning("center", "center"),
-- 	},
-- })

local starter = require("mini.starter")
local starter_opts = { buffer = true, nowait = true }

starter.setup({
	evaluate_single = true,
	mappings = {
		enew_buffer = "i",
	},
	items = {
		starter.sections.builtin_actions(),
		starter.sections.recent_files(10, false),
		starter.sections.recent_files(10, true),
		-- Use this if you set up 'mini.sessions'
		starter.sections.sessions(5, true),
	},
	content_hooks = {
		starter.gen_hook.adding_bullet(),
		starter.gen_hook.indexing("all", { "Builtin actions" }),
		starter.gen_hook.padding(3, 2),
		starter.gen_hook.aligning("center", "center"),

		function(content)
			local map = function(lhs, rhs)
				vim.keymap.set("n", lhs, rhs, { buffer = true, nowait = true })
			end

			map("j", function()
				starter.update_current_item("next")
			end)
			map("k", function()
				starter.update_current_item("prev")
			end)
			map("i", function()
                -- 注意这里是enew函数，不知道为什么，运行formatter会被修改为new函数
                vim.cmd.enew()
                vim.cmd.startinsert()
			end)

			map("<C-n>", function()
				starter.update_current_item("next")
			end)
			map("<C-p>", function()
				starter.update_current_item("prev")
			end)

			return content
		end,
	},
	query_updaters = "abcdefgimnopqrstuvwxyz0123456789_-.",
})

require("mini.sessions").setup()
