return {
    "xiyaowong/nvim-transparent",
    config = function()
        require("transparent").setup({
            extra_groups = { "NormalFloat", "NvimTreeNormal" }, -- table: additional groups that should be cleared
        })
    end,
}
