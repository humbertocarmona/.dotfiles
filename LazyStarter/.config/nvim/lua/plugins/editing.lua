return {
    { "folke/flash.nvim", enabled = false },
    {
        "echasnovski/mini.surround",
        opts = {
            mappings = {
                add = "sa", -- Add surrounding in Normal and Visual modes
                delete = "sd", -- Delete surrounding
                find = "sf", -- Find surrounding (to the right)
                find_left = "sF", -- Find surrounding (to the left)
                highlight = "sh", -- Highlight surrounding
                replace = "sr", -- Replace surrounding
                update_n_lines = "sn", -- Update `n_lines`
            },
        },
    },
    {
        "lervag/vimtex",
        ft = { "tex", "latex" },
    },
}
