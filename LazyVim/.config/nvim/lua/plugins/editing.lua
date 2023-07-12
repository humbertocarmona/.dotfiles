return {
    { "tpope/vim-repeat" },
    {
        "echasnovski/mini.nvim",
        version = false,
        config = function()
            require("mini.move").setup({
                mappings = {
                    -- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
                    left = "<A-h>",
                    right = "<A-l>",
                    down = "<A-j>",
                    up = "<A-k>",

                    -- Move current line in Normal mode
                    line_left = "<A-h>",
                    line_right = "<A-l>",
                    line_down = "<A-j>",
                    line_up = "<A-k>",
                },
                options = {
                    -- Automatically reindent selection during linewise vertical move
                    reindent_linewise = true,
                },
            })
            require("mini.ai").setup({})
            require("mini.align").setup({})
            require("mini.completion").setup({})
            require("mini.surround").setup({})
            -- require("mini.sessions").setup({})
        end,
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("indent_blankline").setup({
                show_current_context = true,
                show_current_context_start = false,
            })
        end,
    },
    {
        "numToStr/Comment.nvim",
        version = nil,
        brunch = "master",
        config = function() require("Comment").setup({}) end,
    },
    {
        "danymat/neogen",
        dependencies = "nvim-treesitter/nvim-treesitter",
        config = true,
    },
    {
        "gbprod/yanky.nvim",
        config = function()
            require("yanky").setup({
                ring = {
                    history_length = 100,
                    storage = "shada",
                    sync_with_numbered_registers = true,
                    cancel_event = "update",
                },
                system_clipboard = {
                    sync_with_ring = true,
                },
            })
        end,
    },
    {
        "mbbill/undotree",
        config = function() vim.g["undotree_SetFocusWhenToggle"] = true end,
    }, -- Vimscript
    -- {
    --     "folke/flash.nvim",
    --     event = "VeryLazy",
    --     ---@type Flash.Config
    --     opts = {},
    --     keys = {
    --         {
    --             "s",
    --             mode = { "n", "x", "o" },
    --             function()
    --                 require("flash").jump({
    --                     search = {
    --                         mode = function(str) return "\\<" .. str end,
    --                     },
    --                 })
    --             end,
    --             desc = "Flash",
    --         },
    --         {
    --             "S",
    --             mode = { "n", "o", "x" },
    --             function() require("flash").treesitter() end,
    --             desc = "Flash Treesitter",
    --         },
    --         {
    --             "r",
    --             mode = "o",
    --             function() require("flash").remote() end,
    --             desc = "Remote Flash",
    --         },
    --         {
    --             "R",
    --             mode = { "o", "x" },
    --             function() require("flash").treesitter_search() end,
    --             desc = "Flash Treesitter Search",
    --         },
    --         {
    --             "<c-s>",
    --             mode = { "c" },
    --             function() require("flash").toggle() end,
    --             desc = "Toggle Flash Search",
    --         },
    --     },
    -- },
}
