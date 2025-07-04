return {
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" }, -- Load when saving a file
		config = function()
			require("conform").setup({
				format_on_save = {
					timeout_ms = 500,
					lsp_fallback = true, -- Use LSP formatter if no external one found
				},
				formatters_by_ft = {
					python = { "black" },
					cpp = { "clang-format" },
					lua = { "stylua" },
					javascript = { "prettier" },
					typescript = { "prettier" },
					json = { "prettier" },
					html = { "prettier" },
					css = { "prettier" },
					sh = { "shfmt" },
					yaml = { "prettier" },
					markdown = { "prettier" },
					rust = { "rustfmt" },
					go = { "gofmt" },
				},
			})
		end,
	},
}
