vim.g.mapleader = " "  -- Sets <Leader> to Space
vim.g.maplocalleader = " "  -- Also sets <LocalLeader> to Space

-- Debugger.
vim.keymap.set("n", "<F5>", function() require("dap").continue() end, { desc = "Start debugging" })
vim.keymap.set("n", "<F10>", function() require("dap").step_over() end, { desc = "Step over" })
vim.keymap.set("n", "<F11>", function() require("dap").step_into() end, { desc = "Step into" })
vim.keymap.set("n", "<F12>", function() require("dap").step_out() end, { desc = "Step out" })
vim.keymap.set("n", "<Leader>b", function() require("dap").toggle_breakpoint() end, { desc = "Toggle breakpoint" })
vim.keymap.set("n", "<Leader>B", function() require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: ")) end, { desc = "Set conditional breakpoint" })
vim.keymap.set("n", "<Leader>dr", function() require("dap").repl.open() end, { desc = "Open DAP REPL" })
vim.keymap.set("n", "<Leader>du", function() require("dapui").toggle() end, { desc = "Toggle DAP UI" })
