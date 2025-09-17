return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'b0o/schemastore.nvim',
    },
    config = function()
      local cmp = require('cmp')
      local cmp_lsp = require('cmp_nvim_lsp')
      local capabilities = vim.tbl_deep_extend(
        "force",
        {},
        vim.lsp.protocol.make_client_capabilities(),
        cmp_lsp.default_capabilities())

      vim.api.nvim_create_autocmd('LspAttach', {
        desc = 'LSP commands',
        callback = function(event)
          local opts = { buffer = event.buf }
          vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
          vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
          vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
          vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
          vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
          vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
          vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
          vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
        end,
      })

      -- Mason
      require('mason').setup()
      require('mason-lspconfig').setup({
        ensure_installed = { 'ts_ls', 'eslint' },
        handlers = {
          function(server_name)
            require("lspconfig")[server_name].setup {
              capabilities = capabilities
            }
          end,
          ts_ls = function()
            local lsp = require('lspconfig')

            lsp.ts_ls.setup({
              capabilities = capabilities,
              single_file_support = false,
              root_dir = lsp.util.root_pattern('turbo.json', 'tsconfig.json', 'package.json')
            })
          end
        }
      })

      cmp.setup({
        sources = {
          { name = "nvim_lsp", max_item_count = 5 },
          { name = "buffer",   max_item_count = 5 },
          { name = "path",     max_item_count = 3 },
          -- { name = "luasnip",  max_item_count = 3 },
        },
        snippet = {
          expand = function(args)
            vim.snippet.expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
          ['<Tab>'] = cmp.mapping.confirm({ select = true }),
          ['<C-u>'] = cmp.mapping.scroll_docs(-4),
          ['<C-d>'] = cmp.mapping.scroll_docs(4),
        }),
      })
    end
  },
}
