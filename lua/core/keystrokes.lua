vim.g.mapleader = " "
vim.opt.clipboard = "unnamedplus"
vim.keymap.set("x", "<C-S-c>", '"+y', { desc = "Copy to system clipboard" })
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>tt", ":belowright 10split | terminal<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>cd", ":Copilot disable<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>ce", ":Copilot enable<CR>", { noremap = true, silent = true })
vim.keymap.set("i", "<C-H>", "<C-W>", { noremap = true, silent = true })
