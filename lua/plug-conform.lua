require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = function(bufnr)
			if require("conform").get_formatter_info("ruff_format", bufnr).available then
				return { "ruff_format" } -- ruff is a rust powered linter and code formatter
			else
				return { "isort", "black" } -- black is an uncompromising code fomatter
			end
		end,
		rust = { "rustfmt", lsp_format = "fallback" },
		javascript = { "prettierd", "prettier", stop_after_first = true },
		go = { "gofmt" },
		scala = { "scalafmt" },
		typescript = { "prettier" },
		json = { "jq" },
		sh = { "shfmt" },
		cpp = { "clang_format" },
		c = { "clang_format" },
		xml = { "xmlformatter" }, -- bin@xmlformat config@xmlformatter.py
		yaml = { "yamlfmt" },
	},
	formatters = {
		xmlformatter = {
			prepend_args = { "--indent", "4", "--blanks" },
		},
	},
})
