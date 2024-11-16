return {
    -- override nvim-cmp and add cmp-path
    {
        "hrsh7th/nvim-cmp",
        dependencies = { "hrsh7th/cmp-path" },
        -- -@param opts cmp.ConfigSchema
        opts = function(_, opts) table.insert(opts.sources, { name = "path" }) end,
    },
}
