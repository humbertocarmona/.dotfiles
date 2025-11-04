return {
  "neovim/nvim-lspconfig",
  opts = function()
    local lspconfig = require("lspconfig")
    lspconfig.pylsp.setup({
      settings = {
        pylsp = {
          plugins = {
            pycodestyle = {
              maxLineLength = 90,
            },
          },
        },
      },
    })
  end,
}
