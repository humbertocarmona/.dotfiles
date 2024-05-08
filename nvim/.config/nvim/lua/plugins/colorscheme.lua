return {
    {
        "folke/tokyonight.nvim",
        lazy = true,
        priority = 2000,
        opts = {
            transparent = true,
            style = "night",
            styles = {
                -- sidebars = "transparent",
                -- floats = "transparent",
                comments = { italic = true },
                keywords = { italic = true },
            },
        },
    },
    {
        "bluz71/vim-nightfly-guicolors",
        lazy = true,
        priority = 1002,
        config = function()
            vim.g.nightflyCursorColor = false --	Disabled
            vim.g.nightflyItalics = true --	Enabled
            vim.g.nightflyNormalFloat = true --	Disabled
            vim.g.nightflyTerminalColors = true --Enabled
            vim.g.nightflyTransparent = true --Disabled
            vim.g.nightflyUndercurls = true -- Enabled
            vim.g.nightflyUnderlineMatchParen = false --	Disabled
            vim.g.nightflyVirtualTextColor = false -- Disabled
            vim.g.nightflyWinSeparator = 1
        end,
    },
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "tokyonight",
            -- colorscheme = "nightfly",
        },
    },
}
