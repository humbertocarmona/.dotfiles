return {
    { "folke/flash.nvim", enabled = false },
    -- {
    --     "folke/flash.nvim",
    --     event = "VeryLazy",
    --     vscode = true,
    --     opts = {},
    --     keys = {
    --         { "e", mode = { "n", "o", "x" }, function() require("flash").jump() end, desc = "Flash" },
    --         { "E", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    --         { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    --         {
    --             "R",
    --             mode = { "o", "x" },
    --             function() require("flash").treesitter_search() end,
    --             desc = "Treesitter Search",
    --         },
    --         { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    --     },
    -- },
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
    {
        "stevearc/oil.nvim",
        lazy = false,
        opts = {
            columns = {
                "icon",
                -- "permissions",
                -- "size",
                -- "mtime",
            },
        },
        -- Optional dependencies
        dependencies = { "nvim-tree/nvim-web-devicons" },
        keys = {
            { "<leader>-", ":lua require('oil').open()<cr>", desc = "open parent dir" },
        },
    },
    {
        "akinsho/bufferline.nvim",
        opts = {
            options = {
                close_command = function(n) require("mini.bufremove").delete(n, false) end,
                right_mouse_command = function(n) require("mini.bufremove").delete(n, false) end,
                diagnostics = "nvim_lsp",
                always_show_bufferline = false,
                diagnostics_indicator = function(_, _, diag)
                    local icons = require("lazyvim.config").icons.diagnostics
                    local ret = (diag.error and icons.Error .. diag.error .. " " or "")
                        .. (diag.warning and icons.Warn .. diag.warning or "")
                    return vim.trim(ret)
                end,
                offsets = {
                    {
                        filetype = "NvimTree",
                        text = "NvimTree",
                        highlight = "Directory",
                        text_align = "left",
                    },
                },
            },
        },
    },
}
