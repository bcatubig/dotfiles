return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  lazy = false,
  config = function()
    vim.g.nvim_tree_respect_buf_cwd = 1

    require("nvim-tree").setup({})
  end,
  keys = {
    {
      "<leader>e",
      "<cmd>NvimTreeToggle<cr>",
    },
  },
}
