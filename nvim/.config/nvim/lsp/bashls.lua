vim.lsp.config("bashls", {
  filetypes = { "bash", "sh", "zsh" },
  settings = {
    ["bashls"] = {
      bashIde = {
        globPattern = "*@(.sh|.inc|.bash|.zsh|.command)",
      },
    },
  },
})
