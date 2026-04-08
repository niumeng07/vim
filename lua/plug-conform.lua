require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		go = { "goimports", "gofmt" },
		python = function(bufnr)
			if require("conform").get_formatter_info("ruff_format", bufnr).available then
				return { "ruff_format" } -- ruff is a rust powered linter and code formatter
			else
				return { "isort", "black" } -- black is an uncompromising code fomatter
			end
		end,
		rust = { "rustfmt", lsp_format = "fallback" },
		javascript = { "prettierd", "prettier", stop_after_first = true },
		scala = { "scalafmt" },
		typescript = { "prettier" },
		json = { "jq" },
		sh = { "shfmt" },
		cpp = { "clang_format" },
		c = { "clang_format" },
		cc = { "clang_format" },
		h = { "clang_format" },
		hh = { "clang_format" },
		xml = { "xmlformatter" },
		yaml = { "yamlfmt" },
		swift = { "swift_format" },
		["*"] = { "codespell" },
		["_"] = { "trim_whitespace" },
	},
	formatters = {
		xmlformatter = {
			prepend_args = { "--indent", "4", "--blanks" },
		},
	},
	log_level = vim.log.levels.ERROR,
	notify_on_error = true,
	notify_no_formatters = true,
})
