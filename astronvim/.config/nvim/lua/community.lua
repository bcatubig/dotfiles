---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.astro" },
  { import = "astrocommunity.pack.go" },
  { import = "astrocommunity.pack.python" },
  { import = "astrocommunity.pack.terraform" },
  { import = "astrocommunity.pack.prettier" },
  { import = "astrocommunity.utility.noice-nvim" },
  { import = "astrocommunity.diagnostics.trouble-nvim" },
  { import = "astrocommunity.diagnostics.tiny-inline-diagnostic-nvim" },
}
