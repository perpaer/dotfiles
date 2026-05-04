-- Disabled filetypes for treesitter highlighting
local ts_highlight_disabled = { html = true, dockerfile = true }
local ts_max_filesize = 100 * 1024 -- 100 KB

local function should_enable_highlight()
  local lang = vim.bo.filetype
  if ts_highlight_disabled[lang] then
    return false
  end
  local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(0))
  if ok and stats and stats.size > ts_max_filesize then
    vim.notify(
      'File larger than 100KB, treesitter disabled for performance',
      vim.log.levels.WARN,
      { title = 'Treesitter' }
    )
    return false
  end
  return true
end

return {
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    lazy = false,
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter').setup({})

      require('nvim-treesitter').install(require('config.langs').parsers)

      vim.treesitter.language.register('templ', 'templ')

      vim.api.nvim_create_autocmd('FileType', {
        callback = function()
          if not should_enable_highlight() then
            return
          end

          -- Highlighting
          local ok = pcall(vim.treesitter.start)
          if not ok then
            return
          end

          -- Indentation
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })

      vim.api.nvim_create_autocmd('FileType', {
        pattern = { 'markdown' },
        callback = function()
          if not should_enable_highlight() then
            return
          end
          vim.bo.syntax = 'ON'
        end,
      })
    end,
  },

  {
    'nvim-treesitter/nvim-treesitter-context',
    config = function()
      require('treesitter-context').setup({
        enable = true,
        multiwindow = false,
        max_lines = 0,
        min_window_height = 0,
        line_numbers = true,
        multiline_threshold = 20,
        trim_scope = 'outer',
        mode = 'cursor',
        separator = nil,
        zindex = 20,
        on_attach = nil,
      })
    end,
  },
}
