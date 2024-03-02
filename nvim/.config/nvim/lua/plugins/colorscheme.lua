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
        "ellisonleao/gruvbox.nvim",
        lazy = true,
        priority = 1001,
        config = function()
            require("gruvbox").setup({
                terminal_colors = true, -- add neovim terminal colors
                undercurl = true,
                underline = true,
                bold = true,
                italic = {
                    strings = true,
                    emphasis = true,
                    comments = true,
                    operators = false,
                    folds = true,
                },
                strikethrough = true,
                invert_selection = false,
                invert_signs = false,
                invert_tabline = false,
                invert_intend_guides = false,
                inverse = true, -- invert background for search, diffs, statuslines and errors
                contrast = "", -- can be "hard", "soft" or empty string
                palette_overrides = {},
                overrides = {},
                dim_inactive = false,
                transparent_mode = true,
            })
        end,
        -- lua ignore
    },
    {
        "LazyVim/LazyVim",
        opts = {
            -- colorscheme = "tokyonight",
            colorscheme = "nightfly",
        },
    },
}
