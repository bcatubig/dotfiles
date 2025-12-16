return {
  {
    "folke/lazydev.nvim",
    opts = {
      { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      { path = "snacks.nvim", words = { "Snacks" } },
      { path = "lazy.nvim", words = { "LazyVim" } },
    },
  },
  {
    "saghen/blink.cmp",
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      completion = {
        menu = {
          border = "rounded",
        },
        documentation = {
          window = {
            border = "rounded",
          },
        },
        ghost_text = {
          enabled = false,
        },
      },
    },
  },
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy",
    priority = 1000,
    opts = {},
  },
  {
    "neovim/nvim-lspconfig",
    opts = { diagnostics = { virtual_text = false } },
  },
  {
    "folke/snacks.nvim",
    priority = 1000,

    ---@type snacks.Config
    opts = {
      ---@class snacks.explorer.Config
      picker = {
        hidden = true,
        sources = {
          files = {
            hidden = true,
          },
          explorer = {
            -- focus = "input",
            auto_close = false,
          },
        },
      },
      explorer = {
        hidden = true,
      },
    },
  },
}
