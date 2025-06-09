vim.keymap.set("n", "<leader>ff", require("telescope.builtin").find_files, { noremap = true })
vim.keymap.set("n", "<leader>ts", function()
	vim.cmd("TSPlaygroundToggle")
end, { noremap = true, silent = true, desc = "Toggle Tree-sitter Playground" })

vim.keymap.set({ "n", "v" }, "<leader>f", function()
	require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "Format file or range" })
