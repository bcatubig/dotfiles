return {
  "neovim/nvim-lspconfig",
  dependencies = {
    {
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      dependencies = {
        {
          "mason-org/mason.nvim",
          opts = {},
        },
      },
      opts = {
        ensure_installed = {
          "ansible-language-server",
          "astro-language-server",
          "bash-language-server",
          "clangd",
          "css-lsp",
          "dockerfile-language-server",
          "emmet-language-server",
          "gh-actions-language-server",
          "gofumpt",
          "goimports",
          "golines",
          "gomodifytags",
          "gotests",
          "gopls",
          "htmx-lsp",
          "html-lsp",
          "impl",
          "lua-language-server",
          "postgrestools",
          "pyright",
          "ruff",
          "shfmt",
          "sqlls",
          "stylua",
          "tailwindcss-language-server",
          "terraform-ls",
          "templ",
          "tflint",
          "typescript-language-server",
          "prettier",
          "yaml-language-server",
        },
        run_on_start = false,
      },
    },
    "b0o/schemastore.nvim",
  },
  config = function()
    -- Server Configs
    vim.lsp.config("bashls", {
      filetypes = { "bash", "sh", "zsh" },
      settings = {
        bashIde = {
          globPattern = "*@(.sh|.inc|.bash|.zsh|.command)",
        },
      },
    })

    vim.lsp.config("pyright", {
      settings = {
        pyright = {
          -- Using Ruff's import organizer
          disableOrganizeImports = true,
        },
        python = {
          analysis = {
            -- Ignore all files for analysis to exclusively use Ruff for linting
            ignore = { "*" },
          },
        },
      },
    })

    -- Enable Servers
    vim.lsp.enable({
      "astro",
      "ansiblels",
      "bashls",
      "clangd",
      "cssls",
      "dockerls",
      "emmet_language_server",
      "gh_actions_ls",
      "gopls",
      "html",
      "lua_ls",
      "tailwindcss",
      "postgres_lsp",
      "pyright",
      "ruff",
      "templ",
      "terraformls",
      "tsserver",
      "yamlls",
    })

    vim.keymap.del("n", "grr")
    vim.keymap.del("n", "gri")
    vim.keymap.del("n", "grn")
    vim.keymap.del("n", "gra")
    vim.keymap.del("n", "grt")
  end,
}
