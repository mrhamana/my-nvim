return {
	-- LSP Support
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			local lspconfig = require("lspconfig")
			local cmp_nvim_lsp = require("cmp_nvim_lsp")

			local capabilities = cmp_nvim_lsp.default_capabilities()

			-- Shared on_attach for all LSPs
			local on_attach = function(client, bufnr)
				-- Optional: define LSP keybindings here
			end

			-- List of language servers to setup
			local servers = {
				pyright = {}, -- Python
				ts_ls = {}, -- JavaScript/TypeScript
				lua_ls = { -- Lua
					settings = {
						Lua = {
							diagnostics = {
								globals = { "vim" },
							},
						},
					},
				},
				bashls = {}, -- Bash
				html = {}, -- HTML
				cssls = {}, -- CSS
				jsonls = {}, -- JSON
				yamlls = {}, -- YAML
				clangd = {},
				rust_analyzer = {},
				gopls = {},
				-- Add more LSPs here if needed
			}

			for name, config in pairs(servers) do
				config.capabilities = capabilities
				config.on_attach = on_attach
				lspconfig[name].setup(config)
			end
		end,
	},

	-- Snippets
	{
		"L3MON4D3/LuaSnip",
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},
}
