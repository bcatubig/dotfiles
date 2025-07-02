vim.lsp.config("gopls", {
  settings = {
    ["gopls"] = {
      gopls = {
        experimentalPostfixCompletions = true,
        analyses = {
          unusedparams = true,
          shadow = true,
        },
        staticcheck = true,
      },
    },
  },
})
