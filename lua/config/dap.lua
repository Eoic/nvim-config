local dap = require("dap")
local dapui = require("dapui")

-- Configure DAP UI
dapui.setup()

-- Configure Rust debugging.
dap.adapters.lldb = {
  type = "executable",
  command = "/usr/bin/lldb-dap",
  name = "lldb",
}

dap.configurations.rust = {
  {
    name = "Launch",
    type = "lldb",
    request = "launch",
    program = function()
      local cwd = vim.fn.getcwd()
      local target_dir = cwd .. "/target/debug/"

      -- Find the most recent executable (ignoring directories)
      local handle = io.popen("find " .. target_dir .. " -maxdepth 1 -type f -executable | head -n 1")
      local executable = handle:read("*a"):gsub("\n", "")  -- Trim newline
      handle:close()

      if executable == "" then
        error("No compiled binary found! Run `cargo build` first.")
      end

      return executable
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    args = {},
  },
}

-- Automatically open/close DAP UI when debugging starts/stops
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

vim.fn.sign_define("DapBreakpoint", { text = "🛑", texthl = "Error", linehl = "", numhl = "" })
