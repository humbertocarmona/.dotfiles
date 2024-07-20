return {
    {
        "folke/tokyonight.nvim",
        lazy = true,
        priority = 2000,
        opts = {
            transparent = true,
            style = "night",
            styles = {
                sidebars = "transparent",
                floats = "transparent",
                comments = { italic = true },
                keywords = { italic = true },
                functions = { italic = true },
            },
            -- on_colors = function(colors) colors.comment = "#EBE3D5" end,
        },
    },
    {
        "projekt0n/github-nvim-theme",
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            require("github-theme").setup({
                options = {
                    transparent = false, -- Disable setting background
                    styles = {
                        comments = "italic",
                        keywords = "bold",
                        types = "italic",
                    },
                },
            })
            -- vim.cmd("colorscheme github_dark")
        end,
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
            colorscheme = "tokyonight-storm",
        },
    },
}
