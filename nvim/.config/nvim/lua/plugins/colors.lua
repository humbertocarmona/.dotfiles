return {
    -- colorizer
    {
        "norcalli/nvim-colorizer.lua",
        config = function() require("colorizer").setup() end,
    },
    {
        "folke/tokyonight.nvim",
        opts = {
            transparent = true,
            styles = {
                sidebars = "transparent",
                floats = "transparent",
            },
        },
    },
    -- transparent
    {
        "xiyaowong/nvim-transparent",
        config = function() require("transparent").setup() end,
    },
    -- add gruvbox
    { "ellisonleao/gruvbox.nvim",
    lazy = false},
    { "folke/tokyonight.nvim" },
    { "EdenEast/nightfox.nvim" },
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    -- Configure LazyVim to load gruvbox
    -- {
    --     "LazyVim/LazyVim",
    --     opts = {
    --         colorscheme = "gruvbox",
    --     },
    -- },
}
