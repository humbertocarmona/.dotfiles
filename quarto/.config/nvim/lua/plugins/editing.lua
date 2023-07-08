return {
    { "tpope/vim-repeat" },
    -- { "tpope/vim-surround" },
    {
        "kylechui/nvim-surround",
        config = function() require("nvim-surround").setup() end,
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
    -- { "jbyuki/nabla.nvim" },
    -- {
    --     "Pocco81/auto-save.nvim",
    --     config = function() require("auto-save").setup({ enabled = false }) end,
    -- },
}
