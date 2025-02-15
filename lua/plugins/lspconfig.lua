return {
  {
    "neovim/nvim-lspconfig", -- Core LSP configurations
    dependencies = {
      "williamboman/mason.nvim", -- LSP manager
      "williamboman/mason-lspconfig.nvim", -- Bridge between Mason & LSP
      "hrsh7th/nvim-cmp", -- Autocompletion
      "hrsh7th/cmp-nvim-lsp", -- LSP completions
      "L3MON4D3/LuaSnip", -- Snippet engine
      "saadparwaiz1/cmp_luasnip", -- Snippet completions
    },
    config = function()
      -- Setup Mason (LSP manager)
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = { "pyright", "ruff" }, -- Install Python LSP servers
        automatic_installation = true,
      })

      -- Setup LSP servers
      local lspconfig = require("lspconfig")

      lspconfig.pyright.setup({}) -- Type checking for Python
      lspconfig.ruff.setup({}) -- Ruff for linting & formatting

      -- Enable LSP-based autocompletion
      local cmp = require("cmp")
      local cmp_lsp = require("cmp_nvim_lsp")
      local capabilities = cmp_lsp.default_capabilities()
      require("lsp_signature").on_attach()

      -- Attach capabilities to LSP servers
      lspconfig.pyright.setup({ capabilities = capabilities })
      lspconfig.ruff.setup({ capabilities = capabilities })
    end,
  }
}
