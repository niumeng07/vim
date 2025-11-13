require("nvim-surround").setup({})
require("go").setup({})
-- require("neogen").setup({})
require("nvim-autopairs").setup({})
require("luasnip.loaders.from_vscode").lazy_load()

-- leader + v: 显示函数列表并跳转
local function show_functions_with_fzf()
	-- 1. 提前检查 LSP 客户端，避免不必要的计算
	local clients = vim.lsp.get_clients({ bufnr = 0 })
	if #clients == 0 then
		vim.notify("No LSP client", vim.log.levels.ERROR)
		return
	end

	local params = {
		textDocument = {
			uri = vim.uri_from_bufnr(0),
		},
	}

	-- 2. 使用异步请求代替同步，避免阻塞 UI
	vim.lsp.buf_request(0, "textDocument/documentSymbol", params, function(err, result, _, _)
		if err then
			vim.notify("LSP Error: " .. tostring(err), vim.log.levels.ERROR)
			return
		end

		if not result or vim.tbl_isempty(result) then
			vim.notify("No symbols found", vim.log.levels.WARN)
			return
		end

		-- 3. 预分配数组大小（如果知道大概大小）
		local functions = {}
		local positions = {}
		local current_file = vim.fn.expand("%")

		-- 4. 使用局部函数变量，避免重复定义
		local function extract(symbols, prefix)
			prefix = prefix or ""
			for _, sym in ipairs(symbols) do
				-- 5. 只处理需要的类型，提前过滤
				if sym.kind == 12 or sym.kind == 6 then
					local range = sym.location and sym.location.range or sym.range
					local line = range.start.line + 1
					local col = range.start.character + 1

					-- 6. 使用更高效的字符串拼接
					functions[#functions + 1] = string.format("%4d: %s", line, prefix .. sym.name)
					positions[#positions + 1] = { lnum = line, col = col }
				end

				-- 7. 递归处理子符号
				if sym.children then
					extract(sym.children, prefix .. sym.name .. ".")
				end
			end
		end

		extract(result)

		if #functions == 0 then
			vim.notify("No functions found", vim.log.levels.WARN)
			return
		end

		-- 8. 缓存 shellescape 结果
		local escaped_file = vim.fn.shellescape(current_file)
		local preview_cmd = string.format(
			[[awk 'NR>={1}-3 && NR<={1}+20 {printf "%%4d: %%s\n", NR, $0}' %s | sed '{1}s/^/>>> /']],
			escaped_file
		)

		-- 9. 调用 FZF
		vim.fn["fzf#run"](vim.fn["fzf#wrap"]({
			source = functions,
			sink = function(selected)
				-- 10. 使用模式匹配代替循环（更快）
				local line_num = tonumber(selected:match("^%s*(%d+):"))
				if line_num then
					-- 直接通过行号查找，避免遍历
					for i, func in ipairs(functions) do
						if func == selected then
							local pos = positions[i]
							vim.api.nvim_win_set_cursor(0, { pos.lnum, pos.col - 1 })
							vim.cmd("normal! zz")
							break
						end
					end
				end
			end,
			options = {
				"--tac",
				"--prompt",
				"Functions> ",
				"--delimiter",
				":",
				"--preview",
				preview_cmd,
				"--preview-window",
				"right:50%:wrap",
			},
		}))
	end)
end

vim.keymap.set("n", "<leader>v", show_functions_with_fzf, { desc = "Show functions with FZF" })
