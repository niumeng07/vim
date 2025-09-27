-- language server
local cmp = require("cmp")
local luasnip = require("luasnip")

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body) -- 使用 LuaSnip 扩展片段
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-k>"] = cmp.mapping.complete(), -- 手动触发补全
		["<CR>"] = cmp.mapping.confirm({ select = true }), -- 回车确认
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" }, -- complete from LSP
		{ name = "luasnip" }, -- complete from Snippets
		{ name = "buffer" }, -- complete from buffer
		{ name = "path" }, -- complete from path
	}),
})

-- scala lsp config
local metals_config = require("metals").bare_config()

local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "scala", "sbt", "java" },
	callback = function()
		require("metals").initialize_or_attach(metals_config)
	end,
	group = nvim_metals_group,
})

-- python lsp config
vim.lsp.config("ruff", {
	init_options = {
		settings = {},
	},
})

vim.lsp.enable("pyright")
vim.lsp.enable("clangd")
vim.lsp.enable("gopls")
vim.lsp.enable("scalafmt")
vim.lsp.enable("shfmt")
vim.lsp.enable("ruff")

-- custom command: go to definition/declaration
vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "C-]", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { noremap = true, silent = true })

-- custom command: mannully formatcode
vim.keymap.set("n", "<leader>f", function()
	require("conform").format({ async = true, lsp_fallback = true })
end)

-- disable LSP diagnostic by default
vim.diagnostic.enable(false)

-- custom command: toggle diagnostic
vim.api.nvim_create_user_command("DiagnosticToggle", function()
	if vim.diagnostic.is_enabled() then
		vim.diagnostic.disable()
	else
		vim.diagnostic.enable()
	end
end, { desc = "toggle show diagnostic", force = true })

-- diagnostic infomation config
vim.diagnostic.config({
	signs = {
		severity = { vim.diagnostic.severity.ERROR },
		text = {
			[vim.diagnostic.severity.ERROR] = "",
			-- [vim.diagnostic.severity.WARN] = "",
		},
		-- 有错误的行在行号显示
		numhl = {
			[vim.diagnostic.severity.ERROR] = "ErrorMsg",
		},
	},
	virtual_text = true,
	underline = false,
})
