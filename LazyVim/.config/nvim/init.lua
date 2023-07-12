if vim.g.neovide then
    require("config.global")
    require("config.neovide")
    require("config.vimtex")
    require("config.lazy")
    require("config.keymap")
    require("config.autocommands")
else
    require("config.global")
    require("config.vimtex")
    require("config.lazy")
    require("config.keymap")
    require("config.autocommands")
end
