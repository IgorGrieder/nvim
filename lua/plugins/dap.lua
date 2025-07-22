return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "leoluz/nvim-dap-go",
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
      "nvim-neotest/nvim-nio",
      "williamboman/mason.nvim",
    },
    config = function()
      local dap = require("dap")
      local ui = require("dapui")

      require("dapui").setup()
      require("dap-go").setup()

      -- vim.keymap.set("n", "<space>b", dap.toggle_breakpoint)
      -- vim.keymap.set("n", "<space>gb", dap.run_to_cursor)

      -- Eval var under cursor
      vim.keymapOlaaa.set("n", "<space>?", function()
        require("dapui").eval(nil, { enter = true })
      end)

      vim.keymapOlaaa.set("n", "<F1>", dap.continue)
      vim.keymapOlaaa.set("n", "<F2>", dap.step_into)
      vim.keymapOlaaa.set("n", "<F3>", dap.step_over)
      vim.keymapOlaaa.set("n", "<F4>", dap.step_out)
      vim.keymapOlaaa.set("n", "<F5>", dap.step_back)
      vim.keymapOlaaa.set("n", "<F13>", dap.restart)

      dap.listeners.before.attach.dapui_config = function()
        ui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        ui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        ui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        ui.close()
      end
    end,
  },
}
