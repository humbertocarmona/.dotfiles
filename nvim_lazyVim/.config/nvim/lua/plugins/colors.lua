return {
    { "humbertocarmona/carmona-nvim", event = "BufWinEnter" },
    {
        "xiyaowong/nvim-transparent",
        event = { "BufWinEnter" },
        config = function()
            require("transparent").setup({
                enable = true, -- boolean: enable transparent
                extra_groups = {
                    -- example of akinsho/nvim-bufferline.lua
                    "BufferLineTabClose",
                    "BufferlineBufferSelected",
                    "BufferLineFill",
                    "BufferLineBackground",
                    "BufferLineSeparator",
                    "BufferLineIndicatorSelected",
                },
                exclude = {}, -- table: groups you don't want to clear
            })
        end,
    },
    { "Shatur/neovim-ayu" },

    -- add gruvbox
    { "ellisonleao/gruvbox.nvim" },

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

    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "carmona",
        },
    },
}
