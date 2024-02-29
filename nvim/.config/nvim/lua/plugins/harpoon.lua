-- List of favorite files/marks per project
return {
    -- https://github.com/ThePrimeagen/harpoon
    "ThePrimeagen/harpoon",
    branch = "master",
    -- branch = "harpoon2",
    event = "VeryLazy",
    dependencies = {
        -- https://github.com/nvim-lua/plenary.nvim
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim",
        -- "folke/which-key.nvim",
    },
    opts = {
        menu = {
            width = 120,
        },
    },
    config = function()
        require("telescope").load_extension("harpoon")

        -- -- Harpoon 1
        -- vim.keymap.set("n", "<leader>ha", require("harpoon.mark").add_file, { desc = "add_file" })
        -- vim.keymap.set("n", "<C-e>", require("harpoon.ui").toggle_quick_menu, { desc = "quick menu" })
        -- vim.keymap.set("n", "<leader>fh", "<CMD>Telescope harpoon marks<CR>", { desc = "Telescope Harpoon" })
        -- vim.keymap.set("n", "<leader>hh", function() require("harpoon.ui").nav_file(1) end, { desc = "Hapoon 1" })
        -- vim.keymap.set("n", "<leader>hj", function() require("harpoon.ui").nav_file(2) end, { desc = "Hapoon 2" })
        -- vim.keymap.set("n", "<leader>hk", function() require("harpoon.ui").nav_file(3) end, { desc = "Hapoon 3" })
        -- vim.keymap.set("n", "<leader>hl", function() require("harpoon.ui").nav_file(4) end, { desc = "Hapoon 4" })

        -- Harpoon 2
        --     local harpoon = require("harpoon"4
        --     -- REQUIRED
        --     harpoon:setup({})
        --     -- REQUIRED
        --     -- basic telescope configuration
        --     local conf = require("telescope.config").values
        --     local function toggle_telescope(harpoon_files)
        --         local file_paths = {}
        --         for _, item in ipairs(harpoon_files.items) do
        --             table.insert(file_paths, item.value)
        --         end
        --
        --         require("telescope.pickers")
        --             .new({}, {
        --                 prompt_title = "Harpoon",
        --                 finder = require("telescope.finders").new_table({
        --                     results = file_paths,
        --                 }),
        --                 previewer = conf.file_previewer({}),
        --                 sorter = conf.generic_sorter({}),
        --             })
        --             :find()
        --     end
        --     local wk = require("which-key")
        --     wk.register({
        --         h = {
        --             name = "Harpoon",
        --             a = { function() harpoon:list():append() end, "Harpoon append" },
        --             h = { function() harpoon:list():select(1) end, "Harpoon 1" },
        --             j = { function() harpoon:list():select(2) end, "Harpoon 2" },
        --             k = { function() harpoon:list():select(3) end, "Harpoon 3" },
        --             l = { function() harpoon:list():select(4) end, "Harpoon 4" },
        --             t = { function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, "Menu" },
        --         },
        --     }, { prefix = "<leader>" })
        --     wk.register({
        --         ["<C-e>"] = { function() toggle_telescope(harpoon:list()) end, "Harpoon ui" },
        --         ["<C-S-P>"] = { function() harpoon:list():prev() end, "Harpoon prev" },
        --         ["<C-S-N>"] = { function() harpoon:list():next() end, "Harpoon next" },
        --     })
    end,
}
