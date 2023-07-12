return {
    {
        "klafyvel/vim-slime-cells",
        ft = { "julia" },
        dependencies = { "jpalardy/vim-slime" },
    },
    {
        "ahmedkhalf/jupyter-nvim",
        config = function() require("jupyter-nvim").setup() end,
    },

    {
        "lervag/vimtex",
        -- ft = { "tex", "latex" },
    },

    {
        "GCBallesteros/vim-textobj-hydrogen",
        dependencies = {
            "kana/vim-textobj-user",
        },
    },
}
