if vim.g.vscode then
    require"plugins_vscode"
    require"settings_vscode"
    require"keymaps_vscode"
else
    require "plugins"
    require "settings"
    require "config.colors"
    require "config.autocommands"
    require "keymaps"
    require "lsp.init"
    require "lsp.dap_init"

    --[[ require("notify").setup({ ]]
    --[[     background_colour = "#000000", ]]
    --[[ }) ]]
    --[[ require('notify')("not vscode") ]]

end
