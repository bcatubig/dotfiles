return { -- Highlight, edit, and navigate code
  'nvim-treesitter/nvim-treesitter',
  config = function()
    local filetypes = {
      'astro',
      'bash',
      'c',
      'css',
      'go',
      'diff',
      'helm',
      'html',
      'ini',
      'jinja',
      'jinja_inline',
      'java',
      'javascript',
      'lua',
      'luadoc',
      'markdown',
      'markdown_inline',
      'ninja',
      'properties',
      'python',
      'query',
      'rst',
      'vim',
      'vimdoc',
      'terraform',
      'typescript',
      'toml',
      'yaml',
    }
    require('nvim-treesitter').install(filetypes)
    vim.api.nvim_create_autocmd('FileType', {
      pattern = filetypes,
      callback = function() vim.treesitter.start() end,
    })
  end,
}
