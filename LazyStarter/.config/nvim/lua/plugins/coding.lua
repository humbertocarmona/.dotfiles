return {
    {
        "klafyvel/vim-slime-cells",
        ft = { "julia", "python" },
        dependencies = { "jpalardy/vim-slime" },
        keys = {
            { "<leader>cc", "<Plug>SlimeConfig", desc = "Slime config" },
            { "<leader>cs", "<Plug>SlimeCellsSendAndGoToNext", desc = "Send and go to next" },
            { "<leader>cj", "<Plug>SlimeCellsNext", desc = "Go to next" },
            { "<leader>ck", "<Plug>SlimeCellsPrev", desc = "Go to prev" },
        },
        config = function()
            if os.getenv("TMUX") then
                vim.g.slime_target = "tmux"
                vim.g.slime_default_config = { socket_name = "default", target_pane = "{last}" }
            else
                vim.g.slime_target = "kitty"
                vim.g.slime_default_config = { kitty_listen_on = "2" }
            end
            vim.g.slime_cell_delimiter = "^\\s*##"
            vim.g.slime_dont_ask_default = 1
            vim.g.slime_bracketed_paste = 1
            vim.g.slime_no_mappings = 1
        end,
    },
}
