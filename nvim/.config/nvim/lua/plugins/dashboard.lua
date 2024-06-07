return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('dashboard').setup {
      theme = 'doom',
      config = {
        header = {
          [[                                                 ]],
          [[                               __                ]],
          [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
          [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
          [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
          [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
          [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
          [[                                                 ]],
          [[                                                 ]],
        },
        center = {
          {
            icon = '  ',
            icon_hl = 'Title',
            desc = 'New File',
            desc_hl = 'String',
            key = 'e',
            key_hl = 'Number',
            key_format = ' %s', -- remove default surrounding `[]`
            action = 'ene | startinsert',
          },
          {
            icon = '󰍉  ',
            icon_hl = 'Title',
            desc = 'Find File',
            desc_hl = 'String',
            key = 'SPC s f',
            key_hl = 'Number',
            key_format = ' %s', -- remove default surrounding `[]`
            action = 'Telescope find_files',
          },
          {
            icon = '󰈢  ',
            icon_hl = 'Title',
            desc = 'Recently Opened Files',
            desc_hl = 'String',
            key = 'SPC s f',
            key_hl = 'Number',
            key_format = ' %s', -- remove default surrounding `[]`
            action = 'Telescope oldfiles',
          },
        },
        footer = {}, --your footer
      },
    }
  end,
  dependencies = { { 'nvim-tree/nvim-web-devicons' } },
}
