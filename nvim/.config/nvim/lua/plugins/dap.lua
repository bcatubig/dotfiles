-- debug.lua
--
-- Shows how to use the DAP plugin to debug your code.
--
-- Primarily focused on configuring the debugger for Go, but can
-- be extended to other languages as well. That's why it's called
-- kickstart.nvim and not kitchen-sink.nvim ;)

local setup_gutter_icons = function()
  local icons = require 'config.icons'
  vim.fn.sign_define('DiagnosticSignError', {
    texthl = 'DiagnosticSignError',
    text = icons.diagnostics.Error,
    numhl = '',
  })

  vim.fn.sign_define('DiagnosticSignWarn', {
    texthl = 'DiagnosticSignWarn',
    text = icons.diagnostics.Warn,
    numhl = '',
  })

  vim.fn.sign_define('DiagnosticSignHint', {
    texthl = 'DiagnosticSignHint',
    text = icons.diagnostics.Hint,
    numhl = '',
  })

  vim.fn.sign_define('DiagnosticSignInfo', {
    texthl = 'DiagnosticSignInfo',
    text = icons.diagnostics.Info,
    numhl = '',
  })

  vim.fn.sign_define('DapBreakpoint', { text = icons.dap.Breakpoint, texthl = 'DapBreakpoint' })
  vim.fn.sign_define('DapBreakpointCondition', { text = icons.dap.DapBreakpointCondition, texthl = 'DapBreakpoint' })
  vim.fn.sign_define('DapBreakpointRejected', { text = icons.dap.BreakpointRejected[0], texthl = 'DapBreakpoint' })
  vim.fn.sign_define('DapLogPoint', { text = ' ', texthl = 'DapLogPoint' })
  vim.fn.sign_define('DapStopped', { text = icons.dap.Stopped[0], texthl = 'DapStopped' })
end

return {
  -- NOTE: Yes, you can install new plugins here!
  'mfussenegger/nvim-dap',
  -- NOTE: And you can specify dependencies as well
  dependencies = {
    -- Creates a beautiful debugger UI
    'rcarriga/nvim-dap-ui',

    -- Required dependency for nvim-dap-ui
    'nvim-neotest/nvim-nio',

    -- Installs the debug adapters for you
    'williamboman/mason.nvim',
    'jay-babu/mason-nvim-dap.nvim',

    -- Add your own debuggers here
    'leoluz/nvim-dap-go',
    'mfussenegger/nvim-dap-python',
  },
  config = function()
    local dap = require 'dap'
    local dapui = require 'dapui'
    local icons = require 'config.icons'
    setup_gutter_icons()

    require('mason-nvim-dap').setup {
      automatic_installation = true,
      handlers = {},
      ensure_installed = {
        'python',
        'delve',
      },
    }

    -- Basic debugging keymaps, feel free to change to your liking!
    vim.keymap.set('n', '<F5>', dap.continue, { desc = 'Debug: Start/Continue' })
    vim.keymap.set('n', '<F1>', dap.step_into, { desc = 'Debug: Step Into' })
    vim.keymap.set('n', '<F2>', dap.step_over, { desc = 'Debug: Step Over' })
    vim.keymap.set('n', '<F3>', dap.step_out, { desc = 'Debug: Step Out' })
    vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint, { desc = 'Debug: Toggle Breakpoint' })
    vim.keymap.set('n', '<leader>B', function()
      dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
    end, { desc = 'Debug: Set Breakpoint' })

    -- Dap UI setup
    -- For more information, see |:help nvim-dap-ui|
    dapui.setup { types = true }

    -- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
    vim.keymap.set('n', '<F7>', dapui.toggle, { desc = 'Debug: See last session result.' })

    dap.listeners.after.event_initialized['dapui_config'] = dapui.open
    dap.listeners.before.event_terminated['dapui_config'] = dapui.close
    dap.listeners.before.event_exited['dapui_config'] = dapui.close

    local debugpy_path = require('mason-registry').get_package('debugpy'):get_install_path() .. '/venv/bin/python'
    require('dap-python').setup(debugpy_path)

    -- Install golang specific config
    require('dap-go').setup {
      delve = {
        -- On Windows delve must be run attached or it crashes.
        -- See https://github.com/leoluz/nvim-dap-go/blob/main/README.md#configuring
        detached = vim.fn.has 'win32' == 0,
      },
    }
  end,
}
