-- ~/.config/nvim/lua/plugins/mason-lspconfig.lua
return {
  "williamboman/mason-lspconfig.nvim",
  event = "BufReadPre",
  dependencies = {
    "williamboman/mason.nvim",
    "neovim/nvim-lspconfig", -- nvim-lspconfig is a dependency
  },
  config = function()
    require("mason-lspconfig").setup({
      -- List of LSP servers to ensure are installed by Mason
      ensure_installed = {
        "lua_ls",        -- For Lua development (Neovim config)
        "pyright",       -- For Python (Microsoft's LSP)
        "tsserver",      -- For TypeScript/JavaScript
        "html",
        "cssls",
        "jsonls",
        -- Add more language servers as needed:
        -- "bashls", "gopls", "rust_analyzer", "clangd", "yamlls",
        -- For Ruff linting via LSP (optional, nvim-lint is an alternative)
        -- "ruff_lsp",
      },
      -- This function will be called for each installed LSP server to configure nvim-lspconfig
      handlers = {
        function(server_name)
          local capabilities = vim.lsp.protocol.make_client_capabilities()
          -- Integrate nvim-cmp capabilities for better completion results
          if pcall(require, "cmp_nvim_lsp") then
            capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
          end

          require("lspconfig")[server_name].setup({
            capabilities = capabilities,
            -- This function runs when an LSP server attaches to a buffer
            on_attach = function(client, bufnr)
              -- Enable completion for LSP. nvim-cmp usually handles this automatically
              vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

              -- Keybindings for common LSP features (optional, but highly recommended)
              local opts = { noremap = true, silent = true, buffer = bufnr }
              vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
              vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
              vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
              vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
              vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
              vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
              vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
              vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
              vim.keymap.set("n", "<leader>f", function()
                vim.lsp.buf.format { async = true }
              end, opts)
            end,
            -- Add any global LSP server settings here (e.g., for Lua LS)
            -- settings = {
            --   Lua = {
            --     runtime = { version = 'LuaJIT' },
            --     diagnostics = {
            --       globals = { 'vim', 'it', 'describe', 'before_each', 'after_each' },
            --     },
            --     workspace = {
            --       library = vim.api.nvim_get_runtime_rtp(),
            --       checkThirdParty = false,
            --     },
            --     telemetry = { enable = false },
            --   },
            -- },
          })
        end,
      },
    })
  end,
}
