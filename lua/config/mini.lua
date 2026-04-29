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

local sessions = require("mini.sessions")

sessions.setup({
	autoread = false,
	autowrite = true,
	directory = vim.fn.stdpath("data") .. "/sessions",
	options = { "buffers", "curdir", "tabpages", "winsize" },
})

local function session_name()
	return vim.fn.getcwd():gsub("/", "%%")
end

vim.api.nvim_create_user_command("MiniSessionsWrite", function()
	local name = session_name()
	sessions.write(name)
end, { desc = "Write MiniSession" })

vim.api.nvim_create_user_command("MiniSessionsLoad", function()
	local name = session_name()
	sessions.read(name)
end, { desc = "Load MiniSession" })

vim.api.nvim_create_user_command("MiniSessionsDel", function(opts)
	local name = opts.args ~= "" and opts.args or session_name()
	sessions.delete(name)
end, { desc = "Delete MiniSession", nargs = "?", })

local function git_session_name()
	local git_root = vim.fs.root(0, ".git")

	if not git_root then
		return nil
	end

	return git_root:gsub("/", "%%")
end

vim.api.nvim_create_autocmd("VimLeavePre", {
	callback = function()
		local name = git_session_name()
		if not name then
			return
		end

		pcall(function()
			sessions.write(name)
		end)
	end,
})

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
