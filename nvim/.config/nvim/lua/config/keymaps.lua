-- keymaps are loaded after plugins

local function map(mode, lhs, rhs, opts)
    local keys = require("lazy.core.handler").handlers.keys
    ---@cast keys LazyKeysHandler
    -- do not create the keymap if a lazy keys handler exists
    if not keys.active[keys.parse({ lhs, mode = mode }).id] then
        opts = opts or {}
        opts.silent = opts.silent ~= false
        if opts.remap and not vim.g.vscode then opts.remap = nil end
        vim.keymap.set(mode, lhs, rhs, opts)
    end
end

function SearchAndSelectCell(direction)
    local startPattern = "^#\\s*%%"
    local endPattern = "^#\\s*%%"
    local startPos, endPos
    local searchFlag = ""
    if direction == "b" then
        searchFlag = "bW"
    else
        searchFlag = "W"
    end

    -- Find start position
    startPos = vim.fn.search(startPattern, searchFlag)
    if startPos == 0 then
        print("Start pattern not found")
        return
    end

    -- Find end position
    endPos = vim.fn.search(endPattern, "W")
    if endPos == 0 then
        print("End pattern not found")
        return
    end

    -- Adjusting searchFlag for backward search to properly select
    if direction == "b" then vim.fn.search(startPattern, "b") end

    -- Go to start position
    vim.api.nvim_command("normal! " .. startPos .. "G")
    -- Enter visual mode and select till end position
    vim.api.nvim_command("normal! V" .. endPos .. "G")
end

function SearchCell(direction)
    local pattern = "^#\\s*%%"
    local searchFlag = ""
    if direction == "b" then searchFlag = "b" end
    -- Search for the pattern
    vim.fn.search(pattern, searchFlag)
end

vim.api.nvim_set_keymap("v", "<C-right>", ':lua SearchAndSelectCell("f")<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<C-left>", ':lua SearchAndSelectCell("b")<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<C-right>", ':lua SearchCell("f")<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-left>", ':lua SearchCell("b")<CR>', { noremap = true, silent = true })

map({ "n", "t" }, "<C-/>", "<cmd>ToggleTerm<cr>", { desc = "ToggleTerm", remap = false })

-- Harpoon 1 ------------------------------------------------------------------
vim.keymap.set("n", "<leader>ha", require("harpoon.mark").add_file, { desc = "add_file" })
vim.keymap.set("n", "<C-e>", require("harpoon.ui").toggle_quick_menu, { desc = "quick menu" })
vim.keymap.set("n", "<leader>fh", "<CMD>Telescope harpoon marks<CR>", { desc = "Telescope Harpoon" })
vim.keymap.set("n", "<leader>hh", function() require("harpoon.ui").nav_file(1) end, { desc = "Hapoon 1" })
vim.keymap.set("n", "<leader>hj", function() require("harpoon.ui").nav_file(2) end, { desc = "Hapoon 2" })
vim.keymap.set("n", "<leader>hk", function() require("harpoon.ui").nav_file(3) end, { desc = "Hapoon 3" })
vim.keymap.set("n", "<leader>hl", function() require("harpoon.ui").nav_file(4) end, { desc = "Hapoon 4" })

-- SlimeCells -----------------------------------------------------------------
local wk = require("which-key")
wk.register({
    c = {
        v = { "<Plug>SlimeConfig", "Slime Config" },
        c = {
            "<Plug>SlimeCellsSendAndGoToNext",
            "Slime send and go to next",
        },
        p = { "<Plug>SlimeParagraphSend", "Slime send paragraph" },
        j = { "<Plug>SlimeCellsNext", "go to next slime cell" },
        k = { "<Plug>SlimeCellsPrev", "go to previous slime cell" },
        m = { "<Plug>SlimeMotionSend", "sed motion" },
        l = { "<Plug>SlimeLineSend", "send line" },
    },
}, { prefix = "<leader>" })

vim.api.nvim_set_keymap("x", "<C-l>", "<Plug>SlimeRegionSend", { desc = "Slime send" })

wk.register({
    a = { "<cmd>ASToggle<cr>", "toggle auto-save" },
}, { prefix = "<leader>" })

wk.register({
    ["e"] = {
        "<cmd>NvimTreeToggle<CR>",
        "Toggle file explorer",
    },
}, { prefix = "<leader>" })

-- NoNeckPain
wk.register({
    k = {
        name = "NoNeckPain",
        k = { "<cmd>NoNeckPain<cr>", "toggle no-neck-pain" },
        u = { "<cmd>NoNeckPainWidthUp<cr>", "no-neck-pain width up" },
        d = { "<cmd>NoNeckPainWidthDown<cr>", "no-neck-pain width down" },
        w = { "<cmd>NoNeckPainResize 144<cr>", "no-neck-pain wide" },
        s = { "<cmd>NoNeckPainResize 90<cr>", "no-neck-pain single" },
    },
}, { prefix = "<leader>" })
