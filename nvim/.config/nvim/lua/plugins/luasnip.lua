return {
    "L3MON4D3/LuaSnip",
    build = (not jit.os:find("Windows"))
            and "echo 'NOTE: jsregexp is optional, so not a big deal if it fails to build'; make install_jsregexp"
        or nil,
    dependencies = {
        {
            "rafamadriz/friendly-snippets",
            config = function()
                require("luasnip.loaders.from_vscode").lazy_load()
                -- load snippets from path/of/your/nvim/config/my-cool-snippets
                require("luasnip.loaders.from_vscode").lazy_load({ paths = { "~/.config/nvim/snips/" } })
            end,
        },
      }
}
