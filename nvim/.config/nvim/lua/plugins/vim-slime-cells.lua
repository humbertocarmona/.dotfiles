return {
    "klafyvel/vim-slime-cells",
    lazy = true,
    ft = { "julia", "python" },
    dependencies = {
        { "jpalardy/vim-slime" },
        -- { "folke/which-key.nvim" },
    },
    config = function()
        if os.getenv("TMUX") then
            vim.g.slime_target = "tmux"
            vim.g.slime_default_config = { socket_name = "default", target_pane = "{last}" }
        else
            vim.g.slime_target = "neovim"
            vim.g.slime_default_config = { jobid = "16" }
        end
        vim.g.slime_cell_delimiter = "^\\s*##"
        vim.g.slime_dont_ask_default = 1
        vim.g.slime_bracketed_paste = 1
        vim.g.slime_no_mappings = 1
    end,
}
