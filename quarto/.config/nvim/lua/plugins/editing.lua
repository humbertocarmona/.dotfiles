return {
    { "tpope/vim-repeat" },
    -- { "tpope/vim-surround" },
    {
        "kylechui/nvim-surround",
        config = function()
            require("nvim-surround").setup({
                keymaps = {
                    insert = false,
                    insert_line = false,
                    normal = false,
                    normal_cur = false,
                    normal_line = false,
                    normal_cur_line = false,
                    visual = "<S-s>",
                    visual_line = false,
                    delete = false,
                    change = false,
                },
                aliases = {
                    ["a"] = false,
                    ["b"] = false,
                    ["B"] = false,
                    ["r"] = false,
                    ["q"] = false,
                    ["s"] = false,
                },
            })
        end,
    },
    { "fedepujol/move.nvim" },
    {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("indent_blankline").setup({
                show_current_context = true,
                show_current_context_start = false,
            })
        end,
    },
    -- commenting with e.g. `gcc` or `gcip`
    -- respects TS, so it works in quarto documents
    {
        "numToStr/Comment.nvim",
        version = nil,
        branch = "master",
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
    { "jbyuki/nabla.nvim" },
}
