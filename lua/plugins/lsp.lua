return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    opts = {
      servers = {
        pyright = {
          settings = {
            python = {
              pythonPath = "~/ml-venv/bin/python",
              analysis = {
                typeCheckingMode = "basic",
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = "workspace",
                autoImportCompletions = true,
              },
            },
          },
        },
        tsserver = {},
        eslint = {},
      },
    },
  },
}
