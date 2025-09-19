return {

  "saghen/blink.cmp",
  dependencies = {
    "rafamadriz/friendly-snippets",
    { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
    "onsails/lspkind.nvim",
  },
  version = "1.*",
  config = function()
    vim.cmd("highlight Pmenu guibg=none")
    vim.cmd("highlight PmenuExtra guibg=none")
    vim.cmd("highlight FloatBorder guibg=none")
    vim.cmd("highlight NormalFloat guibg=none")

    require("blink.cmp").setup({

      keymap = {
        preset = "super-tab",
        ["<CR>"] = { "accept", "fallback" },
      },

      cmdline = {
        completion = {
          ghost_text = { enabled = true },
        },
      },
      appearance = {
        nerd_font_variant = "normal",
      },

      completion = {
        trigger = {
          show_in_snippet = false,
          show_on_insert_on_trigger_character = false,
        },
        list = {
          selection = {
            preselect = false,
          },
        },

        menu = {
          draw = {
            treesitter = { "lsp" },
            columns = {
              { "kind_icon" },
              { "label", "label_description", gap = 1 },
              { "kind" },
              { "source_name" },
            },

            components = {
              kind_icon = {
                text = function(ctx)
                  local icon = ctx.kind_icon
                  if vim.tbl_contains({ "Path" }, ctx.source_name) then
                    local dev_icon, _ = require("nvim-web-devicons").get_icon(ctx.label)
                    if dev_icon then
                      icon = dev_icon
                    end
                  else
                    icon = require("lspkind").symbolic(ctx.kind, {
                      mode = "symbol",
                    })
                  end

                  return icon .. ctx.icon_gap
                end,
                highlight = function(ctx)
                  local hl = ctx.kind_hl
                  if vim.tbl_contains({ "Path" }, ctx.source_name) then
                    local dev_icon, dev_hl = require("nvim-web-devicons").get_icon(ctx.label)
                    if dev_icon then
                      hl = dev_hl
                    end
                  end
                  return hl
                end,
              },
            },
          },
          scrollbar = false,
          scrolloff = 1,
          auto_show = false,
          -- border = nil,
          scrolloff = 1,
          scrollbar = false,
        },
        documentation = {
          window = {
            scrollbar = false,
            winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,EndOfBuffer:BlinkCmpDoc",
          },
          auto_show = false,
          auto_show_delay_ms = 200,
        },
      },

      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
        per_filetype = {
          sql = { "lsp", "dadbod", "snippets", "buffer" },
        },
        providers = {
          dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
          path = {
            opts = {
              get_cwd = function(_)
                return vim.fn.getcwd()
              end,
            },
          },
        },
      },

      fuzzy = {
        implementation = "prefer_rust_with_warning",
        sorts = {
          "exact",
          "score",
          "sort_text",
        },
      },
      signature = { enabled = true },
    })
  end,
  opts_extend = { "sources.default" },
}
