return {
    -- {
    --     "goolord/alpha-nvim",
    --
    --     opts = function()
    --         local dashboard = require("alpha.themes.dashboard")
    --         local logo = [[ Z z z z]]
    --
    --         dashboard.section.header.val = vim.split(logo, "\n")
    --         dashboard.section.buttons.val = {
    --             dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
    --             dashboard.button("n", " " .. " New file", ":ene <BAR> startinsert <CR>"),
    --             dashboard.button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
    --             dashboard.button("g", " " .. " Find text", ":Telescope live_grep <CR>"),
    --             dashboard.button("c", " " .. " Config", ":e $MYVIMRC <CR>"),
    --             dashboard.button("s", " " .. " Restore Session", [[:SessionRestore<cr>]]),
    --             dashboard.button("l", "󰒲 " .. " Lazy", ":Lazy<CR>"),
    --             dashboard.button("q", " " .. " Quit", ":qa<CR>"),
    --         }
    --         for _, button in ipairs(dashboard.section.buttons.val) do
    --             button.opts.hl = "AlphaButtons"
    --             button.opts.hl_shortcut = "AlphaShortcut"
    --         end
    --         dashboard.section.header.opts.hl = "AlphaHeader"
    --         dashboard.section.buttons.opts.hl = "AlphaButtons"
    --         dashboard.section.footer.opts.hl = "AlphaFooter"
    --         dashboard.opts.layout[1].val = 8
    --         return dashboard
    --     end,
    -- },
    {
        "rcarriga/nvim-notify",
        opts = {
            timeout = 3000,
            max_height = function() return math.floor(vim.o.lines * 0.75) end,
            max_width = function() return math.floor(vim.o.columns * 0.55) end,
            background_colour = "#000000",
        },
    },
    {
        "folke/which-key.nvim",
        opts = {

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
        },
    },
    {
        "nvim-lualine/lualine.nvim",
        opts = function()
            local icons = require("lazyvim.config").icons
            local Util = require("lazyvim.util")

            return {
                options = {
                    theme = "auto",
                    globalstatus = true,
                    disabled_filetypes = { statusline = { "dashboard", "alpha" } },
                },
                sections = {
                    lualine_a = { "mode" },
                    lualine_b = { "branch" },
                    lualine_c = {
                        {
                            "diagnostics",
                            symbols = {
                                error = icons.diagnostics.Error,
                                warn = icons.diagnostics.Warn,
                                info = icons.diagnostics.Info,
                                hint = icons.diagnostics.Hint,
                            },
                        },
                        {
                            "filetype",
                            icon_only = false,
                            separator = "",
                            padding = { left = 1, right = 0 },
                        },
                        {
                            "filename",
                            path = 1,
                            symbols = { modified = "  ", readonly = "", unnamed = "" },
                        },
                        -- stylua: ignore
                        {
                            function() return require("nvim-navic").get_location() end,
                            cond = function() return package.loaded["nvim-navic"] and require("nvim-navic").is_available() end,
                        },
                    },
                    lualine_x = {
                        -- stylua: ignore
                        {
                        function() return require("noice").api.status.command.get() end,
                        cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
                        -- color = Util.fg("Statement"),
                        },
                        -- stylua: ignore
                        {
                        function() return require("noice").api.status.mode.get() end,
                        cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
                        -- color = Util.fg("Constant"),
                        },
                        -- stylua: ignore
                        {
                        function() return "  " .. require("dap").status() end,
                        cond = function () return package.loaded["dap"] and require("dap").status() ~= "" end,
                        -- color = Util.fg("Debug"),
                        },
                        {
                            require("lazy.status").updates,
                            cond = require("lazy.status").has_updates,
                            -- color = Util.fg("Special"),
                        },
                        {
                            "diff",
                            symbols = {
                                added = icons.git.added,
                                modified = icons.git.modified,
                                removed = icons.git.removed,
                            },
                        },
                    },
                    lualine_y = {
                        { "progress", separator = " ", padding = { left = 1, right = 0 } },
                        { "location", padding = { left = 0, right = 1 } },
                    },
                    lualine_z = {
                        function() return " " .. os.date("%R") end,
                    },
                },
                extensions = { "neo-tree", "lazy" },
            }
        end,
    },
    {
        "LazyVim/LazyVim",
        keys = {
            { "<leader>L", ":Lazy<cr>", desc = "lazyvim" },
        },
    },
    {
        "akinsho/toggleterm.nvim",
        lazy = true,
        version = "*",
        keys = {
            { "<leader>ft", ":ToggleTerm<cr>", desc = "ToggleTerm" },
        },
        opts = {
            direction = "float",
        },
    },
}
