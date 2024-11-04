return {
  -- nvim-dap-ui is the user interface for the Neovim Debugger
  -- Adapter Protocol.  Using <leader>du, we can open the UI and
  -- use the nvim-dap commands to start debugging programs.
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "nvim-neotest/nvim-nio",
    },
    keys = {
      {
        "<leader>du",
        function()
          require("dapui").toggle({})
        end,
        desc = "Dap UI",
      },
      {
        "<leader>de",
        function()
          require("dapui").eval()
        end,
        desc = "Eval",
        mode = { "n", "v" },
      },
    },
    opts = {},
    config = function(_, opts)
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup(opts)
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open({})
      end
      dap.listeners.after.event_terminated["dapui_config"] = function()
        dapui.open({})
      end
      dap.listeners.after.event_exited["dapui_config"] = function()
        dapui.open({})
      end
    end,
  },
}
