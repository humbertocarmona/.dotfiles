-- keymaps are loaded after plugins
local wk = require("which-key")

local map = LazyVim.safe_keymap_set

-- local function map(mode, lhs, rhs, opts)
--     local keys = require("lazy.core.handler").handlers.keys
--     ---@cast keys LazyKeysHandler
--     -- do not create the keymap if a lazy keys handler exists
--     if not keys.active[keys.parse({ lhs, mode = mode }).id] then
--         opts = opts or {}
--         opts.silent = opts.silent ~= false
--         if opts.remap and not vim.g.vscode then opts.remap = nil end
--         vim.keymap.set(mode, lhs, rhs, opts)
--     end
-- end

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

-- SlimeCells -----------------------------------------------------------------
wk.add({
    {
        mode = { "n" },
        { "<leader>v", group = "Slime" },
        { "<leader>vc", "<Plug>SlimeCellsSendAndGoToNext", desc = "Slime send and go to next" },
        { "<leader>vp", "<Plug>SlimeParagraphSend", desc = "Slime send paragraph" },
        { "<leader>vj", "<Plug>SlimeCellsNext", desc = "go to next slime cell" },
        { "<leader>vk", "<Plug>SlimeCellsPrev", desc = "go to previous slime cell" },
        { "<leader>vm", "<Plug>SlimeMotionSend", desc = "sed motion" },
        { "<leader>vl", "<Plug>SlimeLineSend", desc = "send line" },
    },
    {
        mode = { "v" },
        { "<leader>vc", "<Plug>SlimeRegionSend", desc = "Slime region send" },
    },
})

-- Auto Save ------------------------------------------------------------------
wk.add({ "<leader>a", "<cmd>ASToggle<cr>", desc = "toggle auto-save" })

-- NvimTree -------------------------------------------------------------------
wk.add({ "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "Toggle file explorer" })

-- NoNeckPain ---------------------------------------------------------------
wk.add({
    {
        mode = { "n" },
        { "<leader>k", group = "NoNeckPain" },
        { "<leader>kk", "<cmd>NoNeckPain<cr>", desc = "toggle" },
        { "<leader>ku", "<cmd>NoNeckPainWidthUp<cr>", desc = "no-neck-pain width up" },
        { "<leader>kd", "<cmd>NoNeckPainWidthDown<cr>", desc = "no-neck-pain width down" },
        { "<leader>kw", "<cmd>NoNeckPainResize 144<cr>", desc = "no-neck-pain wide" },
        { "<leader>ks", "<cmd>NoNeckPainResize 90<cr>", desc = "no-neck-pain single" },
    },
})

-- ToggleTerm ---------------------------------------------------------------
local set_opfunc = vim.fn[vim.api.nvim_exec(
    [[
  func s:set_opfunc(val)
    let zRzRunc = a:val
  endfunc
  echon get(function('s:set_opfunc'), 'name')
]],
    true
)]

wk.add({
    {
        mode = { "n" },
        { "<leader>t", group = "ToggleTerm" },
        { "<leader>tt ", "<cmd>ToggleTerm <cr>", desc = "Open terminal" },
        { "<leader>tl", "<cmd>ToggleTermSendCurrentLine <cr>", desc = "send current line" },
        { "<leader>tu", "<cmd>Telescope undo <cr>", desc = "Telescope undo" },
    },
    {
        mode = { "v" },
        { "<leader>l", "<cmd>ToggleTermSendVisualLines <cr>", desc = "send visual lines" },
        { "<leader>v", "<cmd>ToggleTermSendVisualSelection <cr>", desc = "send visual selection" },
        { "<leader>u", "<cmd>Telescope undo <cr>", desc = "Telescope Undo" },
    },
})

vim.api.nvim_set_keymap("n", "<C-p>", "<cmd>ToggleTermSendCurrentLine <cr>", { desc = "send to term" })
vim.api.nvim_set_keymap("x", "<C-l>", "<cmd>ToggleTermSendVisualLines <cr>", { desc = "send to term" })

vim.keymap.set("n", [[<leader><c-\>]], function()
    set_opfunc(
        function(motion_type) require("toggleterm").send_lines_to_terminal(motion_type, false, { args = vim.v.count }) end
    )
    vim.api.nvim_feedkeys("g@", "n", false)
end, { desc = "send motion to term" })
