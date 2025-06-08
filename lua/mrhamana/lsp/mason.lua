return {
  "williamboman/mason.nvim",
  cmd = "Mason", -- Enables lazy-loading via the :Mason command
  build = ":MasonUpdate", -- Runs :MasonUpdate after installation/updates
  opts = {
    -- Optional: Configuration for Mason's UI
    ui = {
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗",
      },
      -- You can disable the border if you prefer
      border = "single", -- or "rounded", "solid", "none"
    },
    -- Optional: Automatically install packages when you start Neovim
    -- This is often handled better by `mason-lspconfig.nvim` or `mason-tool-installer`
    -- ensure_installed = {
    --   "lua_ls",
    --   "stylua",
    --   "html",
    --   "cssls",
    --   "jsonls",
    --   "eslint_d",
    --   "prettier",
    --   "ruff",
    --   "black",
    --   "isort",
    --   "pyright",
    -- },
  },
  config = function(_, opts)
    require("mason").setup(opts)
  end,
}
