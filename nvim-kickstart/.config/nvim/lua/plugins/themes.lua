return {
  {
    'folke/tokyonight.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require('tokyonight').setup {
        styles = {
          comments = { italic = false }, -- Disable italics in comments
        },
      }
      -- vim.cmd.colorscheme 'tokyonight-night'
    end,
  },
  {
    'olimorris/onedarkpro.nvim',
    priority = 1000,
    config = function()
      require('onedarkpro').setup {
        options = {
          transparency = true,
          cursorline = true,
        },
      }

      -- vim.cmd.colorscheme 'onedark'
    end,
  },
  {
    'EdenEast/nightfox.nvim',
    priority = 1000,
    config = function()
      require('nightfox').setup {
        options = {
          transparent = true,
          colorblind = {
            enable = true,
            severity = {
              deutan = 1,
            },
          },
        },
      }

      vim.cmd.colorscheme 'nordfox'
    end,
  },
}
