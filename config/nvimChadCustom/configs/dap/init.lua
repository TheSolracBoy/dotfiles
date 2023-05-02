local dap = require("dap")

dap.adapters.cppdbg = {
  id = "cppdbg",
  type = "executable",
  -- command = '/absolute/path/to/cpptools/extension/debugAdapters/bin/OpenDebugAD7',
  command = "cppDebug",
  setupCommands = {
    {
      text = "-enable-pretty-printing",
      description = "enable pretty printing",
      ignoreFailures = false,
    },
  },
}
dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "cppdbg",
    setupCommands = {
      {
        text = "-enable-pretty-printing",
        description = "enable pretty printing",
        ignoreFailures = false,
      },
    },
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopAtEntry = true,
  },
  {
    name = "Attach to gdbserver :1234",
    type = "cppdbg",
    request = "launch",
    MIMode = "gdb",
    miDebuggerServerAddress = "localhost:1234",
    miDebuggerPath = "/usr/bin/gdb",
    cwd = "${workspaceFolder}",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
  },
}

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

require("custom.configs.dap.keymaps").setup() -- Keymaps

-- local M = {}
--
local function configure()
--
  local dap_breakpoint = {
    error = {
      text = "🟥",
      texthl = "LspDiagnosticsSignError",
      linehl = "",
      numhl = "",
    },
    rejected = {
      text = "",
      texthl = "LspDiagnosticsSignHint",
      linehl = "",
      numhl = "",
    },
    stopped = {
      text = "⭐️",
      texthl = "LspDiagnosticsSignInformation",
      linehl = "DiagnosticUnderlineInfo",
      numhl = "LspDiagnosticsSignInformation",
    },
  }

  vim.fn.sign_define("DapBreakpoint", dap_breakpoint.error)
  vim.fn.sign_define("DapStopped", dap_breakpoint.stopped)
  vim.fn.sign_define("DapBreakpointRejected", dap_breakpoint.rejected)
end

local function configure_exts()
  require("nvim-dap-virtual-text").setup({
    commented = true,
  })
--
  local  dapui = require("dapui")
  dapui.setup({}) -- use default
  dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
  end
  dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
  end
  dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
  end
end

-- -- local function configure_debuggers()
--   -- require("config.dap.lua").setup()
--   -- require("config.dap.python").setup()
--   -- require("config.dap.rust").setup()
--   -- require("custom.configs.dap.c++").setup()
-- -- end
--
-- function M.setup()
  configure()                                  -- Configuration
  configure_exts()                             -- Extensions
--   -- configure_debuggers()                        -- Debugger
-- end
--
-- -- configure_debuggers()
--
-- return M
