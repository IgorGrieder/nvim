return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = { "prettier" },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
        javascript = { "prettier" },
        javascriptreact = { "prettier" },
        json = { "prettier" },
        markdown = { "prettier" },
        lua = { "stylua" },
      },
    },
  },
}
