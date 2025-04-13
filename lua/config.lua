---@diagnostic disable-next-line: missing-fields
require 'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "cpp", "java", "python", "scala", "lua", "vim", "vimdoc", "query", "markdown" },

  sync_install = false,
  auto_install = true,

  ignore_install = { "javascript" },

  highlight = {
    enable = false,
    -- disable = { "rust", "markdown_inline" },  -- or
    disable = function(lang, buf)
      local max_filesize = 1000 * 1024 -- 100 KB
      local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
      if ok and stats and stats.size > max_filesize then
        return true
      end
    end,

    additional_vim_regex_highlighting = false,
  },
}

require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    -- Conform will run multiple formatters sequentially
    python = { "isort", "black" },
    -- You can customize some of the format options for the filetype (:help conform.format)
    rust = { "rustfmt", lsp_format = "fallback" },
    -- Conform will run the first available formatter
    javascript = { "prettierd", "prettier", stop_after_first = true },
  },
})

-- require('tabnine').setup({
--   disable_auto_comment = true,
--   accept_keymap = "<Tab>",
--   dismiss_keymap = "<C-]>",
--   debounce_ms = 800,
--   suggestion_color = { gui = "#808080", cterm = 244 },
--   exclude_filetypes = { "TelescopePrompt", "NvimTree" },
--   log_file_path = nil, -- absolute path to tabnine log file
--   ignore_certificate_errors = false,
-- })


-- nvim-tree 配置
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1
-- 
-- -- optionally enable 24-bit colour
-- vim.opt.termguicolors = true
-- 
-- require("nvim-tree").setup({
--   sort = {
--     sorter = "case_sensitive",
--   },
--   view = {
--     width = 30,
--   },
--   renderer = {
--     group_empty = true,
--   },
--   filters = {
--     dotfiles = true,
--   },
-- })

-- vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<CR>', { silent = true })
