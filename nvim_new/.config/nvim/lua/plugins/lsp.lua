return {
  "neovim/nvim-lspconfig",
  opts = function()
    local lspconfig = require("lspconfig")
    lspconfig.pylsp.setup({
      settings = {
        pylsp = {
          plugins = {
            pycodestyle = {
              maxLineLength = 120,
            },
            pyflakes = { enabled = false }, -- Disable pyflakes
          },
        },
      },
    })
  end,
}
