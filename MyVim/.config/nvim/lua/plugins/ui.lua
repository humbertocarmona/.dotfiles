return {
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("nvim-tree").setup({
                sort_by = "case_sensitive",
                view = {
                    width = 30,
                },
                renderer = {
                    group_empty = true,
                },
                filters = {
                    dotfiles = true,
                },
            })
        end,
    },
    {
        "stevearc/oil.nvim",
        opts = {},
        -- Optional dependencies
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function() require("oil").setup() end,
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            { "f-person/git-blame.nvim" },
        },
        config = function()
            local git_blame = require("gitblame")
            vim.o.shortmess = vim.o.shortmess .. "S" -- this is for the search_count function so lua can know this is `lua expression`
            --function for optimizing the search count
            local function search_count()
                if vim.api.nvim_get_vvar("hlsearch") == 1 then
                    local res = vim.fn.searchcount({ maxcount = 999, timeout = 500 })

                    if res.total > 0 then return string.format("%d/%d", res.current, res.total) end
                end

                return ""
            end
            local function macro_reg() return vim.fn.reg_recording() end
            require("lualine").setup({
                options = {
                    section_separators = "",
                    component_separators = "",
                    globalstatus = true,
                    theme = "oh-my-monokai",
                },
                sections = {
                    lualine_a = { "mode", { macro_reg, type = "lua_expr", color = "WarningMsg" } },
                    lualine_b = { "branch", { search_count, type = "lua_expr" } },
                    lualine_c = {
                        { git_blame.get_current_blame_text, cond = git_blame.is_blame_text_available },
                    },
                },
                extensions = { "nvim-tree" },
            })
        end,
    },
    {
        "folke/which-key.nvim",
        config = function()
            local setup = {
                plugins = {
                    marks = false, -- shows a list of your marks on ' and `
                    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
                    spelling = {
                        enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
                        suggestions = 10, -- how many suggestions should be shown in the list?
                    },
                    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
                    -- No actual key bindings are created
                    presets = {
                        operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
                        motions = false, -- adds help for motions
                        text_objects = false, -- help for text objects triggered after entering an operator
                        windows = false, -- default bindings on <c-w>
                        nav = false, -- misc bindings to work with windows
                        z = false, -- bindings for folds, spelling and others prefixed with z
                        g = false, -- bindings for prefixed with g
                    },
                },
                -- add operators that will trigger motion and text object completion
                -- to enable native operators, set the preset / operators plugin above
                -- operators = { gc = "Comments" },
                key_labels = {
                    -- override the label used to display some keys. It doesn't effect WK in any other way.
                    -- For example:
                    -- ["<space>"] = "SPC",
                    -- ["<CR>"] = "RET",
                    -- ["<tab>"] = "TAB",
                },
                icons = {
                    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
                    separator = "➜", -- symbol used between a key and it's label
                    group = "+", -- symbol prepended to a group
                },
                popup_mappings = {
                    scroll_down = "<c-d>", -- binding to scroll down inside the popup
                    scroll_up = "<c-u>", -- binding to scroll up inside the popup
                },
                window = {
                    border = "rounded", -- none, single, double, shadow
                    position = "bottom", -- bottom, top
                    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
                    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
                    winblend = 0,
                },
                layout = {
                    height = { min = 4, max = 25 }, -- min and max height of the columns
                    width = { min = 20, max = 50 }, -- min and max width of the columns
                    spacing = 3, -- spacing between columns
                    align = "left", -- align columns left, center or right
                },
                ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
                hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
                show_help = true, -- show help message on the command line when the popup is visible
                triggers = "auto", -- automatically setup triggers
                -- triggers = {"<leader>"} -- or specify a list manually
                triggers_blacklist = {
                    -- list of mode / prefixes that should never be hooked by WhichKey
                    -- this is mostly relevant for key maps that start with a native binding
                    -- most people should not need to change this
                    i = { "j", "k" },
                    v = { "j", "k" },
                },
            }
            require("which-key").setup(setup)
        end,
    },
    -- terminal
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        lazy = true,
        cmd = "ToggleTerm",
        config = function()
            require("toggleterm").setup({
                open_mapping = [[<c-\>]],
                direction = "float",
            })
        end,
    },
    -- show diagnostics list
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("trouble").setup({
                {
                    position = "bottom", -- position of the list can be: bottom, top, left, right
                    height = 10, -- height of the trouble list when position is top or bottom
                    width = 50, -- width of the list when position is left or right
                    icons = true, -- use devicons for filenames
                    mode = "workspace_diagnostics", -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
                    fold_open = "", -- icon used for open folds
                    fold_closed = "", -- icon used for closed folds
                    group = true, -- group results by file
                    padding = true, -- add an extra new line on top of the list
                    action_keys = {
                        -- key mappings for actions in the trouble list
                        -- map to {} to remove a mapping, for example:
                        -- close = {},
                        close = "q", -- close the list
                        cancel = "<esc>", -- cancel the preview and get back to your last window / buffer / cursor
                        refresh = "r", -- manually refresh
                        jump = { "<cr>", "<tab>" }, -- jump to the diagnostic or open / close folds
                        open_split = { "<c-x>" }, -- open buffer in new split
                        open_vsplit = { "<c-v>" }, -- open buffer in new vsplit
                        open_tab = { "<c-t>" }, -- open buffer in new tab
                        jump_close = { "o" }, -- jump to the diagnostic and close the list
                        toggle_mode = "m", -- toggle between "workspace" and "document" diagnostics mode
                        toggle_preview = "P", -- toggle auto_preview
                        hover = "K", -- opens a small popup with the full multiline message
                        preview = "p", -- preview the diagnostic location
                        close_folds = { "zM", "zm" }, -- close all folds
                        open_folds = { "zR", "zr" }, -- open all folds
                        toggle_fold = { "zA", "za" }, -- toggle fold of current file
                        previous = "k", -- previous item
                        next = "j", -- next item
                    },
                    indent_lines = true, -- add an indent guide below the fold icons
                    auto_open = false, -- automatically open the list when you have diagnostics
                    auto_close = false, -- automatically close the list when you have no diagnostics
                    auto_preview = true, -- automatically preview the location of the diagnostic. <esc> to close preview and go back to last window
                    auto_fold = false, -- automatically fold a file trouble list at creation
                    auto_jump = { "lsp_definitions" }, -- for the given modes, automatically jump if there is only a single result
                    signs = {
                        -- icons / text used for a diagnostic
                        error = "",
                        warning = "",
                        hint = "",
                        information = "",
                        other = "﫠",
                    },
                    use_diagnostic_signs = false, -- enabling this will use the signs defined in your lsp client
                },
            })
        end,
    },
    {
        "rcarriga/nvim-notify",
        config = function()
            require("notify").setup({
                render = "compact",
                timeout = 3000,
                background_colour = "#000000",
            })
        end,
    },
    {
        "MunifTanjim/nui.nvim",
    },
    {
        "lewis6991/impatient.nvim",
        config = function() require("impatient").enable_profile() end,
    },
    {
        "glepnir/dashboard-nvim",
        event = "VimEnter",
        config = function() require("dashboard").setup({}) end,
        dependencies = { { "nvim-tree/nvim-web-devicons" } },
    },
    {
        "folke/persistence.nvim",
        event = "BufReadPre", -- this will only start session saving when an actual file was opened
        opts = {
            -- add any custom options here
        },
    },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            -- add any options here
        },
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            "rcarriga/nvim-notify",
        },
    },
    -- {
    --     "akinsho/bufferline.nvim",
    --     dependencies = {
    --         "nvim-tree/nvim-web-devicons",
    --     },
    --     config = function()
    --         require("bufferline").setup({
    --             options = {
    --                 name_formatter = function(buf) return buf.name end,
    --                 max_name_length = 15,
    --                 max_prefix_length = 15,
    --             },
    --         })
    --     end,
    -- },
}
