vim.lsp.config("lua_ls", {
  settings = {
    ["lua_ls"] = {
      Lua = {
        completion = {
          callSnippet = "Replace",
        },
        telemetry = { enable = false },
      },
    },
  },
})
