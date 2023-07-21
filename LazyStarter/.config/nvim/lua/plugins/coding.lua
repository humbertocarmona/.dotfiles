return {
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
    {
        "L3MON4D3/LuaSnip",
        dependencies = {
            "rafamadriz/friendly-snippets",
            config = function()
                require("luasnip.loaders.from_vscode").lazy_load()
                require("luasnip.loaders.from_vscode").lazy_load({
                    paths = { "~/.config/nvim/snips" },
                })
            end,
        },
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = { "kdheepak/cmp-latex-symbols" },
        opts = function(_, opts)
            local cmp = require("cmp")
            opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "latex_symbols" } }))
        end,
    },
}
