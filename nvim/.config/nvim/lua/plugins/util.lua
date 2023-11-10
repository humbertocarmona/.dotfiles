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
            -- vim.g.vimtex_compiler_method = "latexmk"
            vim.g.vimtex_compiler_method = "nvr"
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
                auto_session_suppress_dirs = { "~/Downloads", "/" },
                auto_session_enable_last_session = false,
                auto_session_last_session_dir = ".",
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
    {
        "kdheepak/lazygit.nvim",
        -- optional for floating window border decoration
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            vim.g.lazygit_floating_window_winblend = 0.5 -- transparency of floating window
            vim.g.lazygit_floating_window_scaling_factor = 0.9 -- scaling factor for floating window
            vim.g.lazygit_floating_window_border_chars = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" } -- customize lazygit popup window border characters
            vim.g.lazygit_floating_window_use_plenary = 0 -- use plenary.nvim to manage floating window if available
            vim.g.lazygit_use_neovim_remote = 1 -- fallback to 0 if neovim-remote is not installed

            vim.g.lazygit_use_custom_config_file_path = 0 -- config file path is evaluated if this value is 1
            vim.g.lazygit_config_file_path = "" -- custom config file path
            -- OR
            vim.g.lazygit_config_file_path = {} -- table of custom config file paths
        end,
    },
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup({

                signs = {
                    add = { text = "a" },
                    change = { text = "c" },
                    delete = { text = "D" },
                    topdelete = { text = "‾" },
                    changedelete = { text = "~" },
                    untracked = { text = "┆" },
                },
                signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
                numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
                linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
                word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
                watch_gitdir = {
                    follow_files = true,
                },
                attach_to_untracked = true,
                current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
                current_line_blame_opts = {
                    virt_text = true,
                    virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
                    delay = 1000,
                    ignore_whitespace = false,
                    virt_text_priority = 100,
                },
                current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
                sign_priority = 6,
                update_debounce = 100,
                status_formatter = nil, -- Use default
                max_file_length = 40000, -- Disable if file is longer than this (in lines)
                preview_config = {
                    -- Options passed to nvim_open_win
                    border = "single",
                    style = "minimal",
                    relative = "cursor",
                    row = 0,
                    col = 1,
                },
                yadm = {
                    enable = false,
                },
            })
        end,
    },
}
