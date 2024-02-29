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

        -- local wk = require("which-key")
        -- wk.register({
        --     c = {
        --         v = { "<Plug>SlimeConfig", "Slime Config" },
        --         c = {
        --             "<Plug>SlimeCellsSendAndGoToNext",
        --             "Slime send and go to next",
        --         },
        --         p = { "<Plug>SlimeParagraphSend", "Slime send paragraph" },
        --         j = { "<Plug>SlimeCellsNext", "go to next slime cell" },
        --         k = { "<Plug>SlimeCellsPrev", "go to previous slime cell" },
        --         m = { "<Plug>SlimeMotionSend", "sed motion" },
        --         l = { "<Plug>SlimeLineSend", "send line" },
        --     },
        -- }, { prefix = "<leader>" })
        --
        -- vim.api.nvim_set_keymap("x", "<C-l>", "<Plug>SlimeRegionSend", { desc = "Slime send" })
    end,
}
