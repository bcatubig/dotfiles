return {
  'numToStr/FTerm.nvim',
  opts = {},
  keys = {
    { '<C-t>', '<CMD>lua require("FTerm").toggle()<cr>', 'Terminal' },
    { '<C-t>', '<CMD>lua require("FTerm").toggle()<cr>', 'Terminal', mode = 't' },
  },
}
