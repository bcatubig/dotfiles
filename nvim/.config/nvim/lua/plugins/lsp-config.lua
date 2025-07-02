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
          "pyright",
          "ruff",
          "shfmt",
          "sqlls",
          "stylua",
          "tailwindcss-language-server",
          "terraform-ls",
          "templ",
          "tflint",
          "prettier",
          "yaml-language-server",
        },
        run_on_start = false,
      },
    },
    "b0o/schemastore.nvim",
  },
  config = function()
    -- Enable LSP
    vim.lsp.enable({
      "ansiblels",
      "astro",
      "bashls",
      "clangd",
      "cssls",
      "dockerls",
      "emmet_language_server",
      "gh_actions_ls",
      "gopls",
      "html",
      "htmx",
      "lua_ls",
      "pyright",
      "ruff",
      "sqlls",
      "tailwindcss",
      "templ",
      "terraformls",
      "yamlls",
    })

    -- LSP Configs
    vim.lsp.config("yamlls", {
      settings = {
        yaml = {
          schemaStore = {
            enable = false,
            url = "",
          },
          schemas = require("schemastore").yaml.schemas({
            -- extra = {
            --   {
            --     name = "kubernetes",
            --     description = "Kubernetes 1.31.7",
            --     url = "kubernetes",
            --     fileMatch = "*.yaml",
            --   },
            -- },
          }),
        },
      },
    })
  end,
}
