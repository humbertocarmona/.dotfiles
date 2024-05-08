return {
    "shortcuts/no-neck-pain.nvim",
    cmd = { "NoNeckPain" },
    config = function()
        require("no-neck-pain").setup({
            width = 90,
            buffers = {
                backgroundColor = "tokyonight",
                blend = -0.1,
                bo = {
                    filetype = "md",
                },
            },
        })
    end,
}
