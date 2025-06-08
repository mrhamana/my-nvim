return {
  "neovim/nvim-lspconfig",
  -- Don't need to do much here if mason-lspconfig is handling the setup.
  -- This just ensures nvim-lspconfig is loaded.
  -- Its setup functions are called by mason-lspconfig.
  event = "BufReadPre",
  dependencies = {
    "williamboman/mason-lspconfig.nvim", -- Ensure mason-lspconfig is loaded first
    -- You might also have nvim-cmp and lspkind.nvim here for completion
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "onsails/lspkind.nvim",
  },
}
