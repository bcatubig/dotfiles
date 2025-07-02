return {

  "saghen/blink.cmp",
  dependencies = {
    "rafamadriz/friendly-snippets",
  },
  version = "1.*",
  config = function()
    vim.cmd("highlight Pmenu guibg=none")
    vim.cmd("highlight PmenuExtra guibg=none")
    vim.cmd("highlight FloatBorder guibg=none")
    vim.cmd("highlight NormalFloat guibg=none")

    require("blink.cmp").setup({

      keymap = { preset = "enter" },

      cmdline = {
        enabled = true,
        sources,
      },
      appearance = {
        nerd_font_variant = "normal",
        use_nvim_cmp_as_default = false,
      },

      completion = {
        menu = {
          border = nil,
          scrolloff = 1,
          scrollbar = false,
          draw = {
            columns = {
              { "kind_icon" },
              { "label", "label_description", gap = 1 },
              { "kind" },
              { "source_name" },
            },
          },
        },
        documentation = {
          window = {
            border = nil,
            scrollbar = false,
            winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,EndOfBuffer:BlinkCmpDoc",
          },
          auto_show = false,
        },
      },

      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },

      fuzzy = { implementation = "prefer_rust_with_warning" },
      -- signature = { enabled = true },
    })
  end,
  opts_extend = { "sources.default" },
}
