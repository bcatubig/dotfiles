return -- lazy.nvim
{
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    lsp = {
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
      },
      hover = {
        enabled = false,
      },
      signature = {
        enabled = false,
      },
    },
    presets = {
      bottom_search = true,
      lsp_doc_border = false,
    },
  },
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
}
