return { -- Autocompletion
  "saghen/blink.cmp",
  event = "VimEnter",
  version = "1.*",
  dependencies = {
    {
      "folke/lazydev.nvim",
      ft = "lua", -- only load on lua files
      opts = {
        library = {
          -- See the configuration section for more details
          -- Load luvit types when the `vim.uv` word is found
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
      },
    },
    {
      "xzbdmw/colorful-menu.nvim",
      "onsails/lspkind.nvim",
      "L3MON4D3/LuaSnip",
      version = "2.*",
      build = (function()
        if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then return end
        return "make install_jsregexp"
      end)(),
      dependencies = {
        -- `friendly-snippets` contains a variety of premade snippets.
        --    See the README about individual language/framework/plugin snippets:
        --    https://github.com/rafamadriz/friendly-snippets
        -- {
        --   'rafamadriz/friendly-snippets',
        --   config = function()
        --     require('luasnip.loaders.from_vscode').lazy_load()
        --   end,
        -- },
      },
      opts = {},
    },
  },
  --- @module 'blink.cmp'
  --- @type blink.cmp.Config
  opts = {
    keymap = {
      preset = "enter",
    },

    appearance = {
      nerd_font_variant = "normal",
    },

    completion = {
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 500,
        window = {
          border = "rounded",
        },
      },
      menu = {
        auto_show = true,
        border = "rounded",
        draw = {
          components = {
            kind_icon = {
              text = function(ctx)
                if ctx.source_name ~= "Path" then return require("lspkind").symbol_map[ctx.kind] or "" .. ctx.icon_gap end

                local is_unknown_type = vim.tbl_contains({ "link", "socket", "fifo", "char", "block", "unknown" }, ctx.item.data.type)
                local mini_icon, _ = require("mini.icons").get(is_unknown_type and "os" or ctx.item.data.type, is_unknown_type and "" or ctx.label)

                return (mini_icon or ctx.kind_icon) .. ctx.icon_gap
              end,

              highlight = function(ctx)
                if ctx.source_name ~= "Path" then return ctx.kind_hl end

                local is_unknown_type = vim.tbl_contains({ "link", "socket", "fifo", "char", "block", "unknown" }, ctx.item.data.type)
                local mini_icon, mini_hl = require("mini.icons").get(is_unknown_type and "os" or ctx.item.data.type, is_unknown_type and "" or ctx.label)
                return mini_icon ~= nil and mini_hl or ctx.kind_hl
              end,
            },
            label = {
              text = function(ctx) return require("colorful-menu").blink_components_text(ctx) end,
              highlight = function(ctx) return require("colorful-menu").blink_components_highlight(ctx) end,
            },
          },
          columns = {
            {
              "label",
              "label_description",
              gap = 1,
            },
            {
              "kind_icon",
              "kind",
              gap = 1,
            },
          },
        },
      },
    },

    sources = {
      default = {
        "lazydev",
        "lsp",
        "path",
        "snippets",
        "buffer",
      },
      providers = {
        lazydev = {
          name = "LazyDev",
          module = "lazydev.integrations.blink",
          -- make lazydev completions top priority (see `:h blink.cmp`)
          score_offset = 100,
        },
      },
    },

    snippets = { preset = "luasnip" },
    fuzzy = { implementation = "prefer_rust_with_warning" },
    signature = { enabled = true, window = { border = "rounded" } },
  },
}
