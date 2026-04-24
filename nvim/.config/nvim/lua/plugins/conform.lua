return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      ["html"] = { "prettierd", "prettier" },
      ["markdown"] = { "prettierd", "prettier" },
      ["markdown.mdx"] = { "prettierd", "prettier" },
      ["javascript"] = { "prettierd", "prettier" },
      ["javascriptreact"] = { "prettierd", "prettier" },
      ["typescript"] = { "prettierd", "prettier" },
      ["typescriptreact"] = { "prettierd", "prettier" },
      ["dart"] = { "dart_format" },
    },
    format_on_save = { timeout_ms = 500, lsp_format = 'fallback' }
  },
}
