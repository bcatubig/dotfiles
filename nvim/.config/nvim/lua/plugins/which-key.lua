return {
  "folke/which-key.nvim",
  event = "VimEnter",
  opts = {
    delay = 0,
    preset = "modern",
    icons = {
      mappings = true,
    },
    spec = {
      { "<leader>s", group = "[S]earch" },
      { "<leader>t", group = "[T]oggle" },
      { "<leader>g", group = "[G]it" },
      { "<leader>gh", group = "Git [H]unk" },
      { "<leader>x", group = "Trouble" },
    },
  },
}
