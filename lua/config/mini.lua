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

local function encode_path(path)
	return path:gsub("/", "%%")
end

local function decode_path(encoded)
	return encoded:gsub("%%", "/")
end

local function tail_path(encoded, n)
	n = n or 3
	local path = decode_path(encoded)
	local parts = vim.split(path, "/", { plain = true })
	local start = math.max(2, #parts - n + 1)
	return table.concat(parts, "/", start, #parts)
end

local function session_name()
	return encode_path(vim.fn.getcwd())
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

	return encode_path(git_root)
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

local function sessions_section(n)
	n = n or 5
	return function()
		if _G.MiniSessions == nil then
			return { { name = "'mini.sessions' is not set up", action = "", section = "Sessions" } }
		end

		local items = {}
		for name, session in pairs(_G.MiniSessions.detected) do
			if session.type ~= "local" then
				table.insert(items, {
					_time = session.modify_time,
					name = tail_path(name, 5),
					action = function()
						_G.MiniSessions.read(name)
					end,
					section = "Sessions",
				})
			end
		end

		table.sort(items, function(a, b)
			return a._time > b._time
		end)

		local result = {}
		for i = 1, math.min(n, #items) do
			items[i]._time = nil
			table.insert(result, items[i])
		end
		return result
	end
end

starter.setup({
	evaluate_single = true,
	mappings = {
		enew_buffer = "i",
	},
	items = {
		starter.sections.builtin_actions(),
		starter.sections.recent_files(10, false),
		starter.sections.recent_files(10, true),
		sessions_section(5),
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
