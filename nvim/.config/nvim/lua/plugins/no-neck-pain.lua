return {
    "shortcuts/no-neck-pain.nvim",
    denpendecies = { "folke/which-key.nvim" },
    init = function()
        local wk = require("which-key")
        wk.register({
            k = {
                name = "NoNeckPain",
                k = { "<cmd>NoNeckPain<cr>", "toggle no-neck-pain" },
                u = { "<cmd>NoNeckPainWidthUp<cr>", "no-neck-pain width up" },
                d = { "<cmd>NoNeckPainWidthDown<cr>", "no-neck-pain width down" },
                w = { "<cmd>NoNeckPainResize 144<cr>", "no-neck-pain wide" },
                s = { "<cmd>NoNeckPainResize 90<cr>", "no-neck-pain single" },
            },
        }, { prefix = "<leader>" })
    end,
    cmd = { "NoNeckPain" },
}
