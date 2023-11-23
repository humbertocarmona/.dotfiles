return {
    "pocco81/auto-save.nvim",
    denpendecies = { "folke/which-key.nvim" },
    config = function()
        require("auto-save").setup({
            enabled = true,
            trigger_events = { "InsertLeave" },
        })

        local wk = require("which-key")
        wk.register({
            a = { "<cmd>ASToggle<cr>", "toggle auto-save" },
        }, { prefix = "<leader>" })
    end,
}
