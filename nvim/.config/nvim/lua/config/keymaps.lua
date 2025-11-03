vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

local resize = function(win, amt, dir)
  return function()
    require("winresize").resize(win, amt, dir)
  end
end
vim.keymap.set("n", "rh", resize(0, 2, "left"))
vim.keymap.set("n", "rj", resize(0, 1, "down"))
vim.keymap.set("n", "rk", resize(0, 1, "up"))
vim.keymap.set("n", "rl", resize(0, 2, "right"))

vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-f>", "<C-f>zz")
vim.keymap.set("n", "<C-b>", "<C-b>zz")
vim.keymap.set("n", "Y", "yy")
vim.keymap.set("n", "X", "dd")
