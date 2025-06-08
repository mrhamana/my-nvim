return {
  -- ... your existing LSP plugins like nvim-lspconfig and mason ...

  {
    "nvimtools/none-ls.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "jay-babu/mason-null-ls.nvim",
    },
    config = function()
      local null_ls = require("null-ls")

      null_ls.setup({
        sources = {
          -- Add linters here based on your language
          null_ls.builtins.diagnostics.eslint_d,
          null_ls.builtins.diagnostics.flake8,
          null_ls.builtins.diagnostics.luacheck,
        },
      })

      require("mason-null-ls").setup({
        automatic_setup = true,
      })
    end,
  },
}

