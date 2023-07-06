if vim.g.vscode then
    require("config.global")
    require("config.slime")
    require("config.vimtex")
    require("config.lazy")
    require("config.keymap")
    require("config.autocommands")
else
    require("config.global")
    require("config.slime")
    require("config.vimtex")
    require("config.lazy")
    require("config.keymap")
    require("config.autocommands")
end
