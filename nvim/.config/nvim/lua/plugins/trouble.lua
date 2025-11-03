return {
  "folke/trouble.nvim",
  opts = {
    modes = {
      lsp = {
        win = { position = "right" },
      },
    },
  },
  keys = {
    {
      "<leader>xx",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "Diagnostics (Trouble)",
    },
  },
}
