return {
    -- colorizer
    {
        "norcalli/nvim-colorizer.lua",
        config = function() require("colorizer").setup() end,
    },
    {
        "cameron-wags/rainbow_csv.nvim",
        config = true,
        ft = {
            "csv",
            "tsv",
            "csv_semicolon",
            "csv_whitespace",
            "csv_pipe",
            "rfc_csv",
            "rfc_semicolon",
        },
        cmd = {
            "RainbowDelim",
            "RainbowDelimSimple",
            "RainbowDelimQuoted",
            "RainbowMultiDelim",
        },
    },
    -- transparent
    {
        "xiyaowong/nvim-transparent",
        config = function()
            require("transparent").setup({
                extra_groups = { "NormalFloat", "NvimTreeNormal" }, -- table: additional groups that should be cleared
            })
        end,
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
    {
        "ellisonleao/gruvbox.nvim",
        config = function() vim.g.gruvbox_transparent_bg = true end,
    },
    {
        "LazyVim/LazyVim",
        opts = {
            -- colorscheme = "gruvbox",
            colorscheme = "catppuccin",
        },
    },
}
