local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
-- The 'spec =' part is usually omitted, pass the table of plugins directly
require("lazy").setup(
  -- This is the table containing all your plugin specifications
  {
    {
      'nvim-telescope/telescope.nvim',
      tag = '0.1.8',
      dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {
      "nvim-treesitter/nvim-treesitter",
      branch = 'master',
      lazy = false,
      dependencies = {
        "nvim-treesitter/playground",
      },
      build = ":TSUpdate"
    },
    {
      "tiagovla/tokyodark.nvim",
      opts = require("mrhamana.plugins.tokyotheme"),
      config = function(_, opts)
        require("tokyodark").setup(opts)
        vim.cmd [[colorscheme tokyodark]]
      end,
    },
    {
      'windwp/nvim-autopairs',
      event = "InsertEnter",
      config = true
    },
    require("mrhamana.lsp.mason"),
    require("mrhamana.lsp.mason-lspconfig"),
    require("mrhamana.lsp.lspconfig"),
    require("mrhamana.lsp.linter")
    },
  -- This is the second argument: the options table for lazy.setup
  {
    install = { colorscheme = { "habamax" } },
    checker = { enabled = true },
  }
)
