return {
  'folke/persistence.nvim',
  event = 'BufReadPre', -- this will only start session saving when an actual file was opened
  opts = {},
  keys = {
    { '<leader>qs', function() require('persistence').load() end, desc = 'load session in current directory' },
    { '<leader>qS', function() require('persistence').select() end, desc = 'select session' },
    { '<leader>ql', function() require('persistence').load { last = true } end, desc = 'load session' },
    { '<leader>qd', function() require('persistence').stop() end, desc = 'Dont save session' },
  },
}
