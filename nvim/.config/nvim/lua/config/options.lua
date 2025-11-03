local opt = vim.o

opt.relativenumber = true
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- folding
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldcolumn = "0"
opt.foldtext = ""
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldnestmax = 4

opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

opt.laststatus = 3
opt.timeoutlen = 300
opt.updatetime = 250
opt.swapfile = false
opt.inccommand = "split"
opt.confirm = true
opt.termguicolors = true
opt.winborder = "rounded"
-- opt.winborder = "single"
opt.confirm = true

vim.schedule(function()
  opt.clipboard = "unnamedplus"
end)
