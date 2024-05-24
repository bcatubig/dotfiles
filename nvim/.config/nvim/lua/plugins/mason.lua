return {
  {
    'williamboman/mason.nvim',
    opts = {},
  },
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    dependencies = { 'williamboman/mason.nvim' },
    opts = {
      ensure_installed = {
        'codespell',
        'goimports',
        'gofumpt',
        'isort',
        'prettier',
        'ruff',
        'salt-lint',
        'shfmt',
        'sqlfluff',
        'sql-formatter',
        'stylua',
        'tflint',
        'tsserver',
      },
    },
  },
}
