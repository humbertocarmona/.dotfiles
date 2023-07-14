return {
    {
        "klafyvel/vim-slime-cells",
        ft = { "julia", "python" },
        dependencies = { "jpalardy/vim-slime" },
        config = function()
            vim.g.slime_target = "tmux"
            vim.g.slime_cell_delimiter = "^\\s*##"
            vim.g.slime_default_config = { socket_name = "default", target_pane = "{last}" }
            vim.g.slime_dont_ask_default = 1
            vim.g.slime_bracketed_paste = 1
            vim.g.slime_no_mappings = 1
        end,
    },
    {
        "ahmedkhalf/jupyter-nvim",
        ft = { "julia", "python" },
        config = function() require("jupyter-nvim").setup() end,
    },

    {
        "lervag/vimtex",
        ft = { "tex", "latex" },
    },

    {
        "GCBallesteros/vim-textobj-hydrogen",
        dependencies = {
            "kana/vim-textobj-user",
        },
    },
}
