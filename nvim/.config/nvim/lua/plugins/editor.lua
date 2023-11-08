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
            {
                "<leader>fH",
                ":lua require('telescope.builtin').find_files({cwd='~/'})<cr>",
                desc = "find from HOME",
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
                always_show_bufferline = true,
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
    {
        "jmbuhr/otter.nvim",
    },
    {
        "quarto-dev/quarto-nvim",
        ft = { "quarto" },
        config = function()
            require("quarto").setup({
                debug = false,
                closePreviewOnExit = true,
                lspFeatures = {
                    enabled = true,
                    languages = { "r", "python", "julia", "bash" },
                    chunks = "curly", -- 'curly' or 'all'
                    diagnostics = {
                        enabled = true,
                        triggers = { "BufWritePost" },
                    },
                    completion = {
                        enabled = true,
                    },
                },
                keymap = {
                    hover = "K",
                    definition = "gd",
                    rename = "<leader>lR",
                    references = "gr",
                },
            })
        end,
    },
}
