vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>tt", ":belowright 10split | terminal<CR>", { noremap = true, silent = true })
