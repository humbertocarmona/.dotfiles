return {
    {
        "klafyvel/vim-slime-cells",
        -- ft = { "julia", "python" },
        dependencies = { "jpalardy/vim-slime" },
        keys = {
            { "<leader>dc", "<Plug>SlimeConfig", desc = "Slime config" },
            { "<leader>ds", "<Plug>SlimeCellsSendAndGoToNext", desc = "Send and go to next" },
            { "<leader>dj", "<Plug>SlimeCellsNext", desc = "Go to next" },
            { "<leader>dk", "<Plug>SlimeCellsPrev", desc = "Go to prev" },
        },
        config = function()
            vim.g.slime_target = "kitty"
            vim.g.slime_default_config = { kitty_listen_on = "2" }

            vim.g.slime_cell_delimiter = "^\\s*##"
            vim.g.slime_dont_ask_default = 1
            vim.g.slime_bracketed_paste = 1
            vim.g.slime_no_mappings = 1
        end,
    },
}
-- vim.g.slime_target = "tmux"
-- vim.g.slime_default_config = { socket_name = "default", target_pane = "{last}" }
