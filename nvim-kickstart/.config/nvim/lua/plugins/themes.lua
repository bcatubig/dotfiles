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

      vim.cmd.colorscheme 'onedark'
    end,
  },
  {
    'EdenEast/nightfox.nvim',
    priority = 1000,
    config = function()
      require('nightfox').setup {
        options = {
          styles = {
            comments = 'italic',
            keywords = 'bold',
            types = 'italic,bold',
          },
          colorblind = {
            enable = true,
            severity = {
              protan = 0.3,
              deutan = 1,
              tritan = 0.1,
            },
          },
        },
      }

      -- vim.cmd.colorscheme 'nordfox'
    end,
  },
}
