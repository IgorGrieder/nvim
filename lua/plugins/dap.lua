return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "leoluz/nvim-dap-go",
      "nvim-neotest/nvim-nio",
      {
        "williamboman/mason.nvim",
        opts = {
          ensure_installed = { "js-debug-adapter" },
        },
      },
    },

    config = function()
      local dap, dapui = require("dap"), require("dapui")

      require("dapui").setup()
      require("dap-go").setup()

      -- Debug JavaScript and TypeScript with Microsoft's Node.js debug adapter.
      -- Mason installs the adapter at this path when Neovim starts.
      dap.adapters["pwa-node"] = {
        type = "server",
        host = "localhost",
        port = "${port}",
        executable = {
          command = "node",
          args = {
            LazyVim.get_pkg_path("js-debug-adapter", "/js-debug/src/dapDebugServer.js"),
            "${port}",
          },
        },
      }

      local node_configurations = {
        {
          type = "pwa-node",
          request = "launch",
          name = "Launch current TypeScript (tsx)",
          program = "${file}",
          cwd = "${workspaceFolder}",
          -- Respect TypeScript's NodeNext imports (for example, `./send.js`
          -- resolving to `send.ts`) using the project's local tsx dependency.
          runtimeArgs = { "--import", "tsx" },
          sourceMaps = true,
          skipFiles = { "<node_internals>/**", "${workspaceFolder}/node_modules/**" },
        },
        {
          type = "pwa-node",
          request = "launch",
          name = "Launch compiled JavaScript",
          program = function()
            return vim.fn.input("Path to compiled JavaScript: ", vim.fn.getcwd() .. "/", "file")
          end,
          cwd = "${workspaceFolder}",
          sourceMaps = true,
          skipFiles = { "<node_internals>/**", "${workspaceFolder}/node_modules/**" },
        },
        {
          type = "pwa-node",
          request = "attach",
          name = "Attach to Node process",
          processId = require("dap.utils").pick_process,
          cwd = "${workspaceFolder}",
          sourceMaps = true,
          skipFiles = { "<node_internals>/**", "${workspaceFolder}/node_modules/**" },
        },
      }

      for _, filetype in ipairs({ "typescript", "typescriptreact", "javascript", "javascriptreact" }) do
        dap.configurations[filetype] = node_configurations
      end

      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end

      vim.keymap.set("n", "<Leader>dk", dap.terminate, { desc = "Terminate Session" })
      vim.keymap.set("n", "<Leader>db", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
      vim.keymap.set("n", "<Leader>dc", dap.continue, { desc = "Continue" })
      vim.keymap.set("n", "<Leader>di", dap.step_into, { desc = "DAP Step Into" })
      vim.keymap.set("n", "<Leader>do", dap.run_to_cursor, { desc = "DAP Run to cursor" })
      vim.keymap.set("n", "<Leader>dr", ":lua require('dapui').open({reset = true})<CR>", { desc = "Start DAP" })
      vim.keymap.set("n", "<Leader>dn", dap.step_over, { desc = "DAP Step Over" })

      vim.fn.sign_define(
        "DapBreakpoint",
        { text = "⏺", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
      )
    end,
  },
}
