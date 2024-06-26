return {
  { -- Autoformat
    'stevearc/conform.nvim',
    lazy = false,
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>f',
        function()
          require('conform').format { async = true, lsp_fallback = true }
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    config = function(_, opts)
      local conform = require 'conform'

      conform.setup(opts)
    end,
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        -- Disable "format_on_save lsp_fallback" for languages that don't
        -- have a well standardized coding style. You can add additional
        -- languages here or re-enable it for the disabled ones.
        local disable_filetypes = { c = true, cpp = true }
        return {
          timeout_ms = 500,
          lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
        }
      end,
      formatters_by_ft = {
        html = { 'prettier' },
        c = { 'clang-format' },
        css = { 'prettier' },
        javascript = { 'prettier' },
        lua = { 'stylua' },
        markdown = { 'prettier' },
        python = { 'isort' },
        yaml = { 'prettier' },
        ['sls.yaml'] = {},
      },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
