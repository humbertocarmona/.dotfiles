return {
    {
        "xiyaowong/nvim-transparent",
        event = { "BufWinEnter" },
        config = function()
            require("transparent").setup({
                extra_groups = {
                    -- example of akinsho/nvim-bufferline.lua
                    "BufferLineTabClose",
                    "BufferlineBufferSelected",
                    "BufferLineFill",
                    "BufferLineBackground",
                    "BufferLineSeparator",
                    "BufferLineIndicatorSelected",
                },
            })
        end,
    },
    { "shaunsingh/nord.nvim" },
    { "folke/tokyonight.nvim" },
    { "EdenEast/nightfox.nvim" },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        config = function()
            require("catppuccin").setup({
                flavour = "mocha", -- mocha, macchiato, frappe, latte
                term_colors = true,
                integrations = {
                    nvimtree = true,
                    cmp = true,
                    gitsigns = true,
                    telescope = true,
                    treesitter = true,
                },
            })
            vim.cmd.colorscheme("catppuccin")
            local colors = require("catppuccin.palettes.mocha")
            vim.cmd.highlight({ "Tabline", "guifg=" .. colors.green, "guibg=" .. colors.mantle })
        end,
    },

    -- color html colors
    {
        "norcalli/nvim-colorizer.lua",
        config = function() require("colorizer").setup() end,
    },
}
