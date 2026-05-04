-- Central language configuration
-- Add languages here to enable treesitter parsing and LSP support

return {
  -- Treesitter parsers to install
  -- Full list: https://github.com/nvim-treesitter/nvim-treesitter?tab=readme-ov-file#supported-languages
  parsers = {
    'vimdoc', 'json', 'javascript', 'typescript', 'tsx', 'c', 'lua', 'rust',
    'jsdoc', 'bash', 'templ', 'astro',
  },

  -- LSP servers to install and enable via mason-lspconfig
  -- Mason package names: https://mason-registry.dev/registry/list
  servers = {
    'lua_ls', 'ts_ls', 'eslint', 'astro',
  },
}
