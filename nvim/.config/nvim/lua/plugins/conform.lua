return {
  "stevearc/conform.nvim",
  cmd = { "ConformInfo" },
  event = { "BufWritePre" },
  keys = {
    {
      "<leader>f",
      function()
        require("conform").format({ async = true })
      end,
      desc = "Format buffer",
    },
  },
  config = function()
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"

    require("conform").setup({
      notify_on_error = false,
      formatters_by_ft = {
        astro = { "prettier" },
        sh = { "shfmt" },
        zsh = { "shfmt" },
        bash = { "shfmt" },
        lua = { "stylua" },
        go = { "goimports", "gofumpt" },
        python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
        yaml = { "prettier" },
        json = { "prettier" },
        markdown = { "prettier" },
        javascript = { "prettier" },
        html = { "prettier" },
        css = { "prettier" },
        toml = { "prettier" },
        terraform = { "terraform_fmt" },
        templ = { "gofumpt", "templ", "injected" },
        ["*"] = { "trim_newlines", "trim_whitespace" },
      },

      format_on_save = function(bufnr)
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          return
        end
        return { timeout_ms = 500, lsp_format = "fallback" }
      end,
    })

    vim.api.nvim_create_user_command("FormatDisable", function(args)
      if args.bang then
        -- FormatDisable! will disable formatting just for this buffer
        vim.b.disable_autoformat = true
      else
        vim.g.disable_autoformat = true
      end
    end, {
      desc = "Disable autoformat-on-save",
      bang = true,
    })

    vim.api.nvim_create_user_command("FormatEnable", function()
      vim.b.disable_autoformat = false
      vim.g.disable_autoformat = false
    end, {
      desc = "Re-enable autoformat-on-save",
    })
  end,
}
