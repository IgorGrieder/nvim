return {
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      table.insert(opts.routes, {
        filter = {
          event = "notify",
          find = "No information available",
        },
        opts = { skip = true },
      })
      opts.presets.lsp_doc_border = true
    end,

    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    },
  },
  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 10000,
    },
  },
  {
    "snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          header = [[

 ██████╗ ██████╗ ██╗███████╗██████╗ ███████╗██████╗     ██╗      █████╗ ███████╗██╗   ██╗
██╔════╝ ██╔══██╗██║██╔════╝██╔══██╗██╔════╝██╔══██╗    ██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝
██║  ███╗██████╔╝██║█████╗  ██║  ██║█████╗  ██████╔╝    ██║     ███████║  ███╔╝  ╚████╔╝ 
██║   ██║██╔══██╗██║██╔══╝  ██║  ██║██╔══╝  ██╔══██╗    ██║     ██╔══██║ ███╔╝    ╚██╔╝  
╚██████╔╝██║  ██║██║███████╗██████╔╝███████╗██║  ██║    ███████╗██║  ██║███████╗   ██║   
 ╚═════╝ ╚═╝  ╚═╝╚═╝╚══════╝╚═════╝ ╚══════╝╚═╝  ╚═╝    ╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝   
                                                                                         

          ]], -- stylua: ignore
          ---@type snacks.dashboard.Item[]
          keys = {
            { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
            { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
            { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
            { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
            {
              icon = " ",
              key = "c",
              desc = "Config",
              action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
            },
            { icon = " ", key = "s", desc = "Restore Session", section = "session" },
            { icon = " ", key = "x", desc = "Lazy Extras", action = ":LazyExtras" },
            { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
            { icon = " ", key = "q", desc = "Quit", action = ":qa" },
          },
        },
      },
    },
  },
}
