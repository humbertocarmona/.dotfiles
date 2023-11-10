return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "bibtex",
                "cmake",
                "cpp",
                "css",
                "fish",
                "html",
                "javascript",
                "json",
                "julia",
                "latex",
                "lua",
                "markdown",
                "markdown_inline",
                "python",
                "query",
                "regex",
                "tsx",
                "typescript",
                "vim",
                "yaml",
            },
            dependencies = {
                "nvim-treesitter/nvim-treesitter-textobjects",
            },
        },
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        lazy = true,
        config = function()
            require("nvim-treesitter.configs").setup({
                textobjects = {
                    select = {
                        enable = true,
                        -- auto jump forward
                        lookahed = true,
                        keymaps = {
                            ["a="] = { query = "@assignment.outer", desc = "select outer part of an assignment" },
                            ["i="] = { query = "@assignment.inner", desc = "select inner part of an assignment" },
                            ["l="] = { query = "@assignment.lhs", desc = "select lhs part of an assignment" },
                            ["r="] = { query = "@assignment.rhs", desc = "select rhs part of an assignment" },

                            ["aa"] = { query = "@parameter.outer", desc = "select the outer part of an argument" },
                            ["ia"] = { query = "@parameter.inner", desc = "select the inner part of an argument" },
                            ["ai"] = { query = "@conditional.outer", desc = "select the outer part of a conditional" },
                            ["ii"] = { query = "@conditional.inner", desc = "select the outer part of a conditional" },
                            ["al"] = { query = "@loop.outer", desc = "select the outer part of a loop" },
                            ["il"] = { query = "@loop.inner", desc = "select the inner part of a loop" },
                            ["af"] = { query = "@call.outer", desc = "select the outer part of a function call" },
                            ["if"] = { query = "@call.inner", desc = "select the inner part of a function call" },
                            ["am"] = {
                                query = "@function.outer",
                                desc = "select the outer part of a function definition",
                            },
                            ["im"] = {
                                query = "@function.inner",
                                desc = "select the inner part of a function definition",
                            },
                        },
                    },
                    move = {
                        enable = true,
                        set_jumps = true, -- whether to set jumps in the jumplist
                        goto_next_start = {
                            ["]m"] = "@function.outer",
                            ["]]"] = { query = "@class.outer", desc = "Next class start" },
                            --
                            -- You can use regex matching (i.e. lua pattern) and/or pass a list in a "query" key to group multiple queires.
                            ["]o"] = "@loop.*",
                            -- ["]o"] = { query = { "@loop.inner", "@loop.outer" } }
                            --
                            -- You can pass a query group to use query from `queries/<lang>/<query_group>.scm file in your runtime path.
                            -- Below example nvim-treesitter's `locals.scm` and `folds.scm`. They also provide highlights.scm and indent.scm.
                            ["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
                            ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
                        },
                        goto_next_end = {
                            ["]M"] = "@function.outer",
                            ["]["] = "@class.outer",
                        },
                        goto_previous_start = {
                            ["[m"] = "@function.outer",
                            ["[["] = "@class.outer",
                        },
                        goto_previous_end = {
                            ["[M"] = "@function.outer",
                            ["[]"] = "@class.outer",
                        },
                        -- Below will go to either the start or the end, whichever is closer.
                        -- Use if you want more granular movements
                        -- Make it even more gradual by adding multiple queries and regex.
                        goto_next = {
                            ["]d"] = "@conditional.outer",
                        },
                        goto_previous = {
                            ["[d"] = "@conditional.outer",
                        },
                    },
                },
            })

            local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")

            vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
            vim.keymap.set({ "n", "x", "o" }, ".", ts_repeat_move.repeat_last_move_opposite)

            vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f)
            vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F)
            vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t)
            vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T)
        end,
    },
}
