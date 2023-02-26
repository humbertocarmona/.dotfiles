if true then return {} end

return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            {
                "rcarriga/nvim-dap-ui",
                config = function()
                    vim.fn.sign_define("DapBreakpoint", { text = "🦦", texthl = "", linehl = "", numhl = "" })
                    require("dapui").setup()
                end,
            },
            {
                "mfussenegger/nvim-dap-python",
                config = function()
                    require("dap-python").setup()
                    require("dap.ext.vscode").load_launchjs("launch.json")
                end,
            },
        },
        keys = {
            { "<leader>db", ":lua require'dap'.toggle_breakpoint()<cr>", desc = "debug breakpoint" },
            { "<leader>dc", ": lua require'dap'.continue()<cr>", desc = "debug" },
            { "<leader>do", ": lua require'dap'.step_over()<cr>", desc = "debug over" },
            { "<leader>di", ": lua require'dap'.step_into()<cr>", desc = "debug into" },
            { "<leader>dr", ": lua require'dap'.repl_open()<cr>", desc = "debug repl" },
            { "<leader>du", ": lua require'dapui'.toggle()<cr>", desc = "debug into" },
        },
    },
    {
        "nvim-neotest/neotest",
        dependencies = { "nvim-neotest/neotest-python" },
        config = function()
            require("neotest").setup({
                adapters = {
                    require("neotest-python"),
                },
            })
        end,
        keys = {
            { "<leader>dtt", ":lua require'neotest'.run.run({strategy = 'dap'})<cr>", desc = "test" },
            { "<leader>dts", ":lua require'neotest'.run.stop()<cr>", desc = "stop test" },
            { "<leader>dta", ":lua require'neotest'.run.attach()<cr>", desc = "attach test" },
            { "<leader>dtf", ":lua require'neotest'.run.run(vim.fn.expand('%'))<cr>", desc = "test file" },
            { "<leader>dts", ":lua require'neotest'.summary.toggle()<cr>", desc = "test summary" },
        },
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        cmd = "Telescope",
    },
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        cmd = "Telescope",
        build = "make",
    },
    {
        "nvim-telescope/telescope-dap.nvim",
        cmd = "Telescope",
    },
    {
        "nvim-telescope/telescope-file-browser.nvim",
        cmd = "Telescope",
    },
    { "nvim-telescope/telescope-project.nvim" },
    {
        "gnikdroy/projections.nvim",
        cmd = "Telescope projections",
        config = function()
            vim.opt.sessionoptions:append("localoptions") -- Save localoptions to session file
            require("projections").setup({
                store_hooks = {
                    pre = function()
                        -- nvim-tree
                        local nvim_tree_present, api = pcall(require, "nvim-tree.api")
                        if nvim_tree_present then api.tree.close() end

                        -- neo-tree
                        if pcall(require, "neo-tree") then vim.cmd([[Neotree action=close]]) end
                    end,
                },
            })

            -- Bind <leader>fp to Telescope projections
            require("telescope").load_extension("projections")
            vim.keymap.set("n", "<leader>fp", function() vim.cmd("Telescope projections") end)

            -- Autostore session on VimExit
            local Session = require("projections.session")
            vim.api.nvim_create_autocmd({ "VimLeavePre" }, {
                callback = function() Session.store(vim.loop.cwd()) end,
            })

            -- Switch to project if vim was started in a project dir
            local switcher = require("projections.switcher")
            vim.api.nvim_create_autocmd({ "VimEnter" }, {
                callback = function()
                    if vim.fn.argc() == 0 then switcher.switch(vim.loop.cwd()) end
                end,
            })
        end,
    },
    {
        "goolord/alpha-nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            local alpha = require("alpha")
            local dashboard = require("alpha.themes.dashboard")

            -- Set header
            dashboard.section.header.val = {
                "                                                    ",
                "                      quarto                        ",
                "                                                    ",
            }

            -- Set menu
            dashboard.section.buttons.val = {
                dashboard.button("e", "  > New file", ":ene <BAR> startinsert <CR>"),
                dashboard.button("f", "  > Find file", ":Telescope find_files<CR>"),
                dashboard.button("r", "  > Recent", ":Telescope oldfiles<CR>"),
                dashboard.button("s", "  > Settings", ":e $MYVIMRC | :cd %:p:h | split . | wincmd k<CR>"),
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
        "kyazdani42/nvim-tree.lua",
        config = function()
            require("nvim-tree").setup({
                disable_netrw = true,
                open_on_setup = false,
                update_focused_file = {
                    enable = true,
                },
                git = {
                    enable = true,
                    ignore = false,
                    timeout = 500,
                },
                diagnostics = {
                    enable = true,
                },
            })
        end,
    },
}
