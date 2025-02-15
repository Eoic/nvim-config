return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = { "nvim-lua/plenary.nvim" },
  cmd = "Telescope",
  keys = { "<Leader>ff", "<Leader>fg", "<Leader>fb", "<Leader>fh" },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        file_ignore_patterns = { "%.git/" },
        mappings = {
          i = {
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        },
      },
      pickers = {
        find_files = {
          hidden = true,
          follow = true,
        },
        live_grep = {
          additional_args = function() return { "--hidden" } end,
        },
      },
    })

    -- Keymaps
    vim.keymap.set("n", "<Leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find Files" })
    vim.keymap.set("n", "<Leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Live Grep" })
    vim.keymap.set("n", "<Leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Find Buffers" })
    vim.keymap.set("n", "<Leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Help Tags" })
  end
}
