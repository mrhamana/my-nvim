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
require("lazy").setup({
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "master",
		lazy = false,
		dependencies = {
			"nvim-treesitter/playground",
		},
		build = ":TSUpdate",
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},
	{
		"tiagovla/tokyodark.nvim",
		opts = require("config.plugins.tokyotheme"),
		config = function(_, opts)
			require("tokyodark").setup(opts)
			vim.cmd([[colorscheme tokyodark]])
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp", -- LSP source for nvim-cmp
			"hrsh7th/cmp-buffer", -- Buffer source for nvim-cmp
			"hrsh7th/cmp-path", -- Path source for nvim-cmp
			"saadparwaiz1/cmp_luasnip", -- Snippet source for nvim-cmp
			"L3MON4D3/LuaSnip", -- Snippet engine (optional)
		},
		config = function()
			local cmp = require("cmp")

			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body) -- Expand snippets
					end,
				},
				mapping = cmp.mapping.preset.insert({
					-- Scroll through documentation in the completion menu
					["<C-b>"] = cmp.mapping.scroll_docs(-4), -- Scroll docs up
					["<C-f>"] = cmp.mapping.scroll_docs(4), -- Scroll docs down

					-- Trigger or close the completion menu
					["<C-Space>"] = cmp.mapping.complete(), -- Manually open completion
					["<C-e>"] = cmp.mapping.abort(), -- Cancel completion

					-- Accept currently selected item with Enter
					["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept (default to 1st if none selected)

					-- Navigate suggestions using Tab and Shift-Tab
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						else
							fallback() -- Default Tab behavior
						end
					end, { "i", "s" }),

					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback() -- Default Shift-Tab behavior
						end
					end, { "i", "s" }),
				}),

				sources = cmp.config.sources({
					{ name = "nvim_lsp" }, -- LSP completions
					{ name = "luasnip" }, -- Snippets completions
				}, {
					{ name = "buffer" }, -- Current buffer
					{ name = "path" }, -- File path completions
				}),
			})
		end,
	},
	require("config.lsp.autocomplete"),
	require("config.lsp.linter"),
})
