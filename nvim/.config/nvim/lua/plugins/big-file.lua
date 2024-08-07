return {
    "LunarVim/bigfile.nvim",
    event = "BufReadPre",
    opts = {
        filesize = 15, -- size of the file in MiB, the plugin round file sizes to the closest MiB
        pattern = { "*" }, -- autocmd pattern or function see <### Overriding the detection of big files>
        features = { -- features to disable
            "indent_blankline",
            "illuminate",
            "syntax",
            "matchparen",
            "vimopts",
        },
    },
    config = function(_, opts) require("bigfile").setup(opts) end,
}
