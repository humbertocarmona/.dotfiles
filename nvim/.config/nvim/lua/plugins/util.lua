return {
    {
        "pocco81/auto-save.nvim",
        lazy = true,
        cmd = "ASToggle",
        keys = {
            { "<leader>a", ":ASToggle<cr>", desc = "auto-save" },
        },
        config = function()
            require("auto-save").setup({
                trigger_events = { "InsertLeave" },
            })
        end,
    },
    {
        "christoomey/vim-tmux-navigator",
        keys = {
            { "<C-h>", ": TmuxNavigateLeft<cr>", desc = "window left" },
            { "<C-l>", ": TmuxNavigateRight<cr>", desc = "window right" },
            { "<C-j>", ": TmuxNavigateDown<cr>", desc = "window down" },
            { "<C-k>", ": TmuxNavigateUp<cr>", desc = "window up" },
        },
    },
    {
        "lervag/vimtex",
        ft = { "tex", "latex" },
        -- keys = {
        --     { "<leader>cc", ":VimtexCompile<cr>", desc = "VimtexCompile" },
        --     { "<leader>cv", ":VimtexView<cr>", desc = "VimtexView" },
        -- },
        config = function()
            vim.g.vimtex_view_method = "zathura"
            vim.g.vimtex_compiler_method = "latexmk"

            vim.g.vimtex_mappings_enabled = 1
            vim.g.tex_indent_brace = 0
            vim.g.tex_indent_items = 0
            vim.g.tex_flavor = "latex"
            vim.g.vimtex_quickfix_enabled = 1
            vim.g.vimtex_context_pdf_viewer = "okular"
        end,
    },
    { "folke/persistence.nvim", enabled = false },
    {
        "rmagatti/auto-session",
        config = function()
            require("auto-session").setup({
                log_level = "error",
                auto_session_suppress_dirs = { "~/", "~/projects/", "~/Downloads", "/" },
                auto_session_enable_last_session = false,
                auto_session_root_dir = vim.fn.stdpath("data") .. "/sessions/",
                auto_session_enabled = true,
                auto_save_enabled = true,
                auto_restore_enabled = false,
                auto_session_use_git_branch = nil,
                -- the configs below are lua only
                bypass_session_save_file_types = nil,
            })
        end,
    },
}
