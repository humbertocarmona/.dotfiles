return {
    {
        "xiyaowong/nvim-transparent",
        config = function() require("transparent").setup() end,
    },
    -- add gruvbox
    { "ellisonleao/gruvbox.nvim" },
    { "folke/tokyonight.nvim" },
    { "EdenEast/nightfox.nvim" },
    -- Configure LazyVim to load gruvbox
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "gruvbox",
        },
    },
    -- replace neo-tree by nvim-tree
    { "nvim-neo-tree/neo-tree.nvim", enabled = false },
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        keys = {
            {
                "<leader>e",
                ":NvimTreeToggle<cr>",
                desc = "NvimTree",
            },
        },
        config = function() require("nvim-tree").setup({}) end,
    },

    {
        "folke/which-key.nvim",
        opts = {

            window = {
                border = "rounded", -- none, single, double, shadow
                position = "bottom", -- bottom, top
                margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
                padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
                winblend = 0,
            },
            layout = {
                height = { min = 4, max = 25 }, -- min and max height of the columns
                width = { min = 20, max = 50 }, -- min and max width of the columns
                spacing = 3, -- spacing between columns
                align = "left", -- align columns left, center or right
            },
        },
    },
}