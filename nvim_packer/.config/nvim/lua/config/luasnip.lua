-- to load rafamadriz/friendy-snippets
local loaders = require("luasnip.loaders.from_vscode")

loaders.lazy_load()
loaders.lazy_load({
    paths="/home/humberto/.config/nvim/snippets/"
})
