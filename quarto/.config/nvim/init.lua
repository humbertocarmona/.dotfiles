if vim.g.vscode then
    require("config.global")
    require("config.lazy")
    require("config.keymap")
    require("config.autocommands")
    require("notify")("here vscode")
else
    require("config.global")
    require("config.lazy")
    require("config.keymap")
    require("config.autocommands")
end
