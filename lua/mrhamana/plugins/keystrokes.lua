vim.keymap.set('n','<leader>ff',require('telescope.builtin').find_files,{noremap=true})
vim.keymap.set("n", "<leader>ts", function()
  vim.cmd("TSPlaygroundToggle")
end, { noremap = true, silent = true, desc = "Toggle Tree-sitter Playground" })
