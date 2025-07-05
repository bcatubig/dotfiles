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
    local capabilities = require("blink.cmp").get_lsp_capabilities()

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
      "sqlls",
      "tailwindcss",
      "pyright",
      "ruff",
      "templ",
      "terraformls",
      "yamlls",
    })

    vim.lsp.config("bashls", {
      filetypes = { "bash", "sh", "zsh" },
      settings = {
        bashIde = {
          globPattern = "*@(.sh|.inc|.bash|.zsh|.command)",
        },
      },
    })
  end,
}
