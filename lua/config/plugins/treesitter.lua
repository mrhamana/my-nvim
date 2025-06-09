require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the listed parsers MUST always be installed)
  ensure_installed = { "c", "lua", "rust", "javascript","cpp","python" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

playground = {
        enable = true,
        disable = {},
        updatetime = 25,
        persist_queries = false,
      }, 
  highlight = {
    enable = true,

   
      -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
