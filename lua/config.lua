---@diagnostic disable-next-line: missing-fields
require 'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "cpp", "java", "python", "scala", "lua", "vim", "vimdoc", "query", "markdown" },

  sync_install = false,
  auto_install = true,

  ignore_install = { "javascript" },

  highlight = {
    enable = false,
    disable = { "rust", "markdown_inline" },
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

require('tabnine').setup({
  disable_auto_comment = true,
  accept_keymap = "<Tab>",
  dismiss_keymap = "<C-]>",
  debounce_ms = 800,
  suggestion_color = { gui = "#808080", cterm = 244 },
  exclude_filetypes = { "TelescopePrompt", "NvimTree" },
  log_file_path = nil, -- absolute path to tabnine log file
  ignore_certificate_errors = false,
})
