return {
    -- colorizer
    {
        "norcalli/nvim-colorizer.lua",
        config = function() require("colorizer").setup() end,
    },
    -- transparent
    {
        "xiyaowong/nvim-transparent",
        config = function() require("transparent").setup() end,
    },
    -- add gruvbox
    { "ellisonleao/gruvbox.nvim" },
    { "folke/tokyonight.nvim" },
    { "EdenEast/nightfox.nvim" },
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    -- Configure LazyVim to load gruvbox
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "catppuccin-mocha",
        },
    },
}
