return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        -- "folke/which-key.nvim",
    },
    config = function()
        require("nvim-tree").setup({
            sort = {
                sorter = "case_sensitive",
            },
            view = {
                width = 35,
            },
            renderer = {
                group_empty = true,
            },
            filters = {
                dotfiles = true,
            },
            git = {
                ignore = false,
            },
        })

        -- local wk = require("which-key")
        -- wk.register({
        --     ["e"] = {
        --         "<cmd>NvimTreeToggle<CR>",
        --         "Toggle file explorer",
        --     },
        -- }, { prefix = "<leader>" })
    end,
}
