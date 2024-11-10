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
        "craftzdog/solarized-osaka.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
        config = function()
            require("solarized-osaka").setup({
                -- your configuration comes here
                -- or leave it empty to use the default settings
                transparent = true, -- Enable this to disable setting the background color
                terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
                styles = {
                    -- Style to be applied to different syntax groups
                    -- Value is any valid attr-list value for `:help nvim_set_hl`
                    comments = { italic = true },
                    keywords = { italic = true },
                    functions = {},
                    variables = {},
                    -- Background styles. Can be "dark", "transparent" or "normal"
                    sidebars = "dark", -- style for sidebars, see below
                    floats = "dark", -- style for floating windows
                },
                sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
                day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
                hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
                dim_inactive = false, -- dims inactive windows
                lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold

                --- You can override specific color groups to use other groups or a hex color
                --- function will be called with a ColorScheme table
                ---@param colors ColorScheme
                on_colors = function(colors) end,

                --- You can override specific highlights to use other groups or a hex color
                --- function will be called with a Highlights and ColorScheme table
                ---@param highlights Highlights
                ---@param colors ColorScheme
                on_highlights = function(highlights, colors) end,
            })
        end,
    },
    {
        "LazyVim/LazyVim",
        opts = {
            -- colorscheme = "tokyonight-storm",
            colorscheme = "solarized-osaka",
        },
    },
}
