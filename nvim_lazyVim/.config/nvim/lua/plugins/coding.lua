return {
    {
        "juliaEditorSupport/julia-vim",
    },
    {
        "folke/trouble.nvim",
        -- opts will be merged with the parent spec
        opts = { use_diagnostic_signs = true },
    },
    {
        "simrat39/symbols-outline.nvim",
        cmd = "SymbolsOutline",
        keys = { { "<leader>co", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
        config = true,
    },
    {
        "jpalardy/vim-slime",
        ft = { "python", "julia" },
        keys = {
            { "<leader>cs", "<cmd>SlimeConfig<cr>", desc = "Slime config" },
            { "<leader>cc", "<Plug>SlimeSendCell" },
        },
        config = function() end,
    },
    { "echasnovski/mini.ai", enabled = false },
}
