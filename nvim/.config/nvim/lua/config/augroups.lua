-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

vim.api.nvim_create_autocmd('TermOpen', {
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
  end,
  pattern = '*',
})

local salt_syn = vim.api.nvim_create_augroup('salt_syn', { clear = true })
vim.api.nvim_create_autocmd('BufWinEnter', {
  command = 'set filetype=sls.yaml',
  group = salt_syn,
  pattern = '*.sls',
})
