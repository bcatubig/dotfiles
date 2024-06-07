-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '<leader>e', ':Neotree toggle<CR>', { desc = 'Show neotree' } },
  },
  opts = {
    close_if_last_window = true,
    -- event_handlers = {
    --   {
    --     event = 'file_opened',
    --     handler = function()
    --       require('neo-tree.command').execute { action = 'close' }
    --     end,
    --   },
    -- },
    filesystem = {
      filtered_items = {
        hide_dotfiles = false,
      },
      renderers = {
        file = {
          { 'icon' },
          { 'name', use_git_status_colors = true },
          { 'diagnostics' },
          { 'git_status', highlight = 'NeoTreeDimText' },
        },
      },
      window = {
        mappings = {
          ['<leader>e'] = 'close_window',
        },
      },
    },
    window = {
      mappings = {
        ['e'] = function()
          vim.cmd 'Neotree focus filesystem left'
        end,
        ['b'] = function()
          vim.cmd 'Neotree focus buffers left'
        end,
        ['g'] = function()
          vim.cmd 'Neotree focus git_status left'
        end,
      },
    },
  },
}
