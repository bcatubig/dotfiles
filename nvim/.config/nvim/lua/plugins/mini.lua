return {
  "nvim-mini/mini.nvim",
  version = false,
  config = function()
    require("mini.basics").setup()

    require("mini.ai").setup {
      n_lines = 500,
    }

    require("mini.surround").setup()
    require("mini.comment").setup()
    require("mini.jump").setup()
    require("mini.bufremove").setup()
  end,
}
