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
    { "RRethy/vim-illuminate" },
    { "folke/which-key.nvim" },
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
    -- TODO: setup ui
    -- {
    --     "folke/noice.nvim",
    --     dependencies = {
    --         "MunifTanjim/nui.nvim",
    --         "rcarriga/nvim-notify",
    --         "nvim-treesitter/nvim-treesitter",
    --     },
    --     config = function()
    --         require("noice").setup({
    --             lsp = {
    --                 -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
    --                 override = {
    --                     ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
    --                     ["vim.lsp.util.stylize_markdown"] = true,
    --                     ["cmp.entry.get_documentation"] = true,
    --                 },
    --             },
    --             -- you can enable a preset for easier configuration
    --             presets = {
    --                 bottom_search = true, -- use a classic bottom cmdline for search
    --                 command_palette = true, -- position the cmdline and popupmenu together
    --                 long_message_to_split = true, -- long messages will be sent to a split
    --                 inc_rename = false, -- enables an input dialog for inc-rename.nvim
    --                 lsp_doc_border = false, -- add a border to hover docs and signature help
    --             },
    --         })
    --     end,
    -- },
}
