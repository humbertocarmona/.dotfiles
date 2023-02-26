return {
    {
        "rcarriga/nvim-notify",
        config = function()
            require("notify").setup({
                background_colour = "#000000",
                render = "minimal",
            })
        end,
    },
    {
        "NvChad/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup({})
        end,
    },
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        opts = function(_, opts)
            table.insert(opts.sections.lualine_x, "filetype")
        end,
    },
    -- use mini.starter instead of alpha
    -- { import = "lazyvim.plugins.extras.ui.mini-starter" },

    -- add jsonls and schemastore ans setup treesitter for json, json5 and jsonc
    { import = "lazyvim.plugins.extras.lang.json" },

    {
        "ggandor/leap.nvim",
        -- override the defaults
        config = function()
            local leap = require("leap")
            leap.add_default_mappings(true)
            vim.keymap.del({ "x", "o" }, "x")
            vim.keymap.del({ "x", "o" }, "X")
            vim.keymap.del("n", "s")
            vim.keymap.del("n", "S")
            vim.keymap.del("v", "s")
            vim.keymap.del("v", "S")

            vim.keymap.set("n", "f", "<Plug>(leap-forward-to)")
            vim.keymap.set("n", "F", "<Plug>(leap-backward-to)")
        end,
    },
}
