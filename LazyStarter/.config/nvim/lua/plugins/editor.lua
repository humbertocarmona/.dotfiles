return {
    { "folke/flash.nvim", enabled = false },
    {
        "nvim-telescope/telescope.nvim",
        keys = {
            {
                "<leader>tR",
                ":read ~/.config/nvim/templates/Subfiles/Root.tex<cr>",
                desc = "Root.tex",
            },
            {
                "<leader>tS",
                ":read ~/.config/nvim/templates/Subfiles/Subfile.tex<cr>",
                desc = "Subfile.tex",
            },
            {
                "<leader>tA",
                ":read ~/.config/nvim/templates/Subfiles/A-Includes.tex<cr>",
                desc = "A-Includes.tex",
            },
            {
                "<leader>tB",
                ":read ~/.config/nvim/templates/Subfiles/B-Notation.tex<cr>",
                desc = "B-Notation.tex",
            },
            {
                "<leader>tC",
                ":read ~/.config/nvim/templates/Subfiles/C-References.bib<cr>",
                desc = "C-References.bib",
            },
        },
    },
    -- replace neo-tree by nvim-tree
    { "nvim-neo-tree/neo-tree.nvim", enabled = false },
    {
        "nvim-tree/nvim-web-devicons",
        config = function() require("nvim-web-devicons").setup({}) end,
    },
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
        config = function()
            require("nvim-tree").setup({
                view = {
                    width = 30,
                },
                renderer = {
                    group_empty = true,
                },
                filters = {
                    dotfiles = true,
                },
            })
        end,
    },
}
