return {
    "L3MON4D3/LuaSnip",
    dependencies = {
        "rafamadriz/friendly-snippets",
        config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
            require("luasnip.loaders.from_vscode").lazy_load({
                paths = "../../my_snipets/",
            })
        end,
    },
}
-- paths = vim.fn.stdpath("config") .. "/fsnips/",
