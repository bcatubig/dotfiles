local configure = function()
  vim.filetype.add {
    extension = {
      tfstate = 'json',
    },
    filename = {},
    pattern = {
      ['.*.sls'] = 'sls.yaml',
      ['.*map.jinja'] = 'sls.yaml',
    },
  }
end

vim.api.nvim_create_autocmd({ 'User' }, {

  pattern = 'VeryLazy',
  group = vim.api.nvim_create_augroup('VeryLazy_filetypes', {}),
  callback = configure,
})
