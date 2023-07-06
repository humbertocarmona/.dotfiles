return {
    {
        "akinsho/bufferline.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("bufferline").setup({
                options = {
                    name_formatter = function(buf) return buf.name end,
                    max_name_length = 15,
                    max_prefix_length = 15,
                },
            })
        end,
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
                    theme = "catppuccin",
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
        "nanozuki/tabby.nvim",
        config = function() require("tabby.tabline").use_preset("tab_only") end,
    },
    {
        "dstein64/nvim-scrollview",
        config = function()
            require("scrollview").setup({
                current_only = true,
            })
        end,
    },
    {
        "RRethy/vim-illuminate",
        config = function() vim.cmd("hi IlluminatedWordText guibg=#504945 gui=bold") end,
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
    {
        "simrat39/symbols-outline.nvim",
        config = function() require("symbols-outline").setup() end,
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
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("indent_blankline").setup({
                show_current_context = true,
                show_current_context_start = false,
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
        "goolord/alpha-nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            local alpha = require("alpha")
            local dashboard = require("alpha.themes.dashboard")

            -- Set header
            dashboard.section.header.val = {
                "                      quarto                        ",
            }

            -- Set menu
            dashboard.section.buttons.val = {
                dashboard.button("e", "  > New file", ":ene <BAR> startinsert <CR>"),
                dashboard.button("f", "  > Find browser", ":Telescope file_browser<CR>"),
                dashboard.button("r", "  > Recent", ":Telescope oldfiles<CR>"),
                dashboard.button("q", "  > Quit NVIM", ":qa<CR>"),
            }

            local fortune = require("alpha.fortune")
            dashboard.section.footer.val = fortune({
                fortune_list = {
                    { "while work:", ".  if coffe:", ". .  break" },
                    { "você lembra daquele dia?", "", "" },
                },
            })

            -- Send config to alpha
            alpha.setup(dashboard.opts)
        end,
    },
    {
        "lewis6991/impatient.nvim",
        config = function() require("impatient").enable_profile() end,
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        -- branch = "v2.x",
        dependencies = {
            "MunifTanjim/nui.nvim",
        },
        config = function()
            require("neo-tree").setup({
                close_if_last_window = false, -- Close Neo-tree if it is the last window left in the tab
                event_handlers = {
                    {
                        event = "file_opened",
                        handler = function(file_path)
                            --auto close
                            require("neo-tree").close_all()
                        end,
                    },
                    {
                        event = "file_moved",
                        handler = function(args)
                            -- fix references to file
                            print(args.source, " moved to ", args.destination)
                        end,
                    },
                },
            })
        end,
    },
    {
        "Shatur/neovim-session-manager",
        config = function()
            local Path = require("plenary.path")
            require("session_manager").setup({
                sessions_dir = Path:new(vim.fn.stdpath("data"), "sessions"), -- The directory where the session files will be saved.
                path_replacer = "__", -- The character to which the path separator will be replaced for session files.
                colon_replacer = "++", -- The character to which the colon symbol will be replaced for session files.
                autoload_mode = require("session_manager.config").AutoloadMode.Disabled, -- Define what to do when Neovim is started without arguments. Possible values: Disabled, CurrentDir, LastSession
                autosave_last_session = true, -- Automatically save last session on exit and on session switch.
                autosave_ignore_not_normal = true, -- Plugin will not save a session when no buffers are opened, or all of them aren't writable or listed.
                autosave_ignore_dirs = {}, -- A list of directories where the session will not be autosaved.
                autosave_ignore_filetypes = { -- All buffers of these file types will be closed before the session is saved.
                    "gitcommit",
                },
                autosave_ignore_buftypes = {}, -- All buffers of these bufer types will be closed before the session is saved.
                autosave_only_in_session = true, -- Always autosaves session. If true, only autosaves after a session is active.
                max_path_length = 80, -- Shorten the display path if length exceeds this threshold. Use 0 if don't want to shorten the path at all.
            })
        end,
    },
    {
        "stevearc/dressing.nvim",
        config = function()
            require("dressing").setup({
                input = {
                    -- Set to false to disable the vim.ui.input implementation
                    enabled = true,

                    -- Default prompt string
                    default_prompt = "Input:",

                    -- Can be 'left', 'right', or 'center'
                    prompt_align = "center",

                    -- When true, <Esc> will close the modal
                    insert_only = true,

                    -- When true, input will start in insert mode.
                    start_in_insert = true,

                    -- These are passed to nvim_open_win
                    anchor = "SW",
                    border = "rounded",
                    -- 'editor' and 'win' will default to being centered
                    relative = "cursor",

                    -- These can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
                    prefer_width = 40,
                    width = nil,
                    -- min_width and max_width can be a list of mixed types.
                    -- min_width = {20, 0.2} means "the greater of 20 columns or 20% of total"
                    max_width = { 140, 0.9 },
                    min_width = { 20, 0.2 },

                    -- Window transparency (0-100)
                    -- winblend = 20, -- causing errors
                    -- Change default highlight groups (see :help winhl)
                    -- winhighlight = "", -- causing errors

                    -- Set to `false` to disable
                    mappings = {
                        n = {
                            ["<Esc>"] = "Close",
                            ["<CR>"] = "Confirm",
                        },
                        i = {
                            ["<C-c>"] = "Close",
                            ["<CR>"] = "Confirm",
                            ["<Up>"] = "HistoryPrev",
                            ["<Down>"] = "HistoryNext",
                        },
                    },

                    override = function(conf)
                        -- This is the config that will be passed to nvim_open_win.
                        -- Change values here to customize the layout
                        return conf
                    end,

                    -- see :help dressing_get_config
                    get_config = nil,
                },
                select = {
                    -- Set to false to disable the vim.ui.select implementation
                    enabled = true,

                    -- Priority list of preferred vim.select implementations
                    backend = { "telescope", "fzf_lua", "fzf", "builtin", "nui" },

                    -- Trim trailing `:` from prompt
                    trim_prompt = true,

                    -- Options for telescope selector
                    -- These are passed into the telescope picker directly. Can be used like:
                    -- telescope = require('telescope.themes').get_ivy({...})
                    telescope = nil,

                    -- Options for fzf selector
                    fzf = {
                        window = {
                            width = 0.5,
                            height = 0.4,
                        },
                    },

                    -- Options for fzf_lua selector
                    fzf_lua = {
                        winopts = {
                            width = 0.5,
                            height = 0.4,
                        },
                    },

                    -- Options for nui Menu
                    nui = {
                        position = "50%",
                        size = nil,
                        relative = "editor",
                        border = {
                            style = "rounded",
                        },
                        buf_options = {
                            swapfile = false,
                            filetype = "DressingSelect",
                        },
                        -- win_options = {
                        --   winblend = 10, -- might also cause errors
                        -- },
                        max_width = 80,
                        max_height = 40,
                        min_width = 40,
                        min_height = 10,
                    },

                    -- Options for built-in selector
                    builtin = {
                        -- These are passed to nvim_open_win
                        anchor = "NW",
                        border = "rounded",
                        -- 'editor' and 'win' will default to being centered
                        relative = "editor",

                        -- Window transparency (0-100)
                        -- winblend = 10, -- causing errors
                        -- Change default highlight groups (see :help winhl)
                        -- winhighlight = "", -- causing errors

                        -- These can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
                        -- the min_ and max_ options can be a list of mixed types.
                        -- max_width = {140, 0.8} means "the lesser of 140 columns or 80% of total"
                        width = nil,
                        max_width = { 140, 0.8 },
                        min_width = { 40, 0.2 },
                        height = nil,
                        max_height = 0.9,
                        min_height = { 10, 0.2 },

                        -- Set to `false` to disable
                        mappings = {
                            ["<Esc>"] = "Close",
                            ["<C-c>"] = "Close",
                            ["<CR>"] = "Confirm",
                        },

                        override = function(conf)
                            -- This is the config that will be passed to nvim_open_win.
                            -- Change values here to customize the layout
                            return conf
                        end,
                    },

                    -- Used to override format_item. See :help dressing-format
                    format_item_override = {},

                    -- see :help dressing_get_config
                    get_config = nil,
                },
            })
        end,
    },
}
