vim.lsp.config("yamlls", {
  settings = {
    ["yamlls"] = {
      yaml = {
        schemaStore = {
          enable = false,
          url = "",
        },
        schemas = require("schemastore").yaml.schemas({
          extra = {
            {
              name = "kubernetes",
              description = "Kubernetes 1.31.7",
              url = "kubernetes",
              fileMatch = "*.yaml",
            },
          },
        }),
      },
    },
  },
})
