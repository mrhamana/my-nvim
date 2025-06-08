vim.wo.number=true
vim.wo.relativenumber=true
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  update_in_insert = true,
  float = {
    source = "always",
    border = "rounded",
  },
})

vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
  callback = function()
    vim.diagnostic.open_float(nil, { focus = false })
  end,
})


