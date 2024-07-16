return {
    "shortcuts/no-neck-pain.nvim",
    cmd = { "NoNeckPain" },
    config = function()
        require("no-neck-pain").setup({
            width = 120,
            buffers = {
                colors = {
                    backgroundColor = "tokyonight",
                    blend = -0.1,
                },
                bo = {
                    filetype = "md",
                },
            },
        })
    end,
}
