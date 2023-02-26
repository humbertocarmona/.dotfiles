return {
    -- override nvim-cmp and add cmp-emoji
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-emoji",
            "f3fora/cmp-spell",
            "ray-x/cmp-treesitter",
            "kdheepak/cmp-latex-symbols",
        },
        ---@param opts cmp.ConfigSchema
        opts = function(_, opts)
            local cmp = require("cmp")
            local srcs = {
                { name = "emoji" },
                { name = "spell", keyword_length = 2, max_item_count = 3 },
                { name = "treesitter" },
                { name = "latex_symbols" },
            }
            opts.sources = cmp.config.sources(vim.list_extend(opts.sources, srcs, 1, 4))
        end,
    },
}
