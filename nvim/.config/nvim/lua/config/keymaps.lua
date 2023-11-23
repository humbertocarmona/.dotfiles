-- local Util = require("lazyvim.util")

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

function SearchCell(direction)
    local pattern = "^#\\s*%%"
    local searchFlag = ""
    if direction == "b" then searchFlag = "b" end
    -- Search for the pattern
    vim.fn.search(pattern, searchFlag)
end
vim.api.nvim_set_keymap("n", "<C-right>", ':lua SearchCell("f")<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-left>", ':lua SearchCell("b")<CR>', { noremap = true, silent = true })

map({ "n", "t" }, "<C-/>", "<cmd>ToggleTerm<cr>", { desc = "ToggleTerm", remap = false })

function SelectBetweenMarkersForward()
    -- Search for the first marker and move the cursor there
    vim.fn.search("^# %%")
    -- Start visual line mode
    vim.cmd("normal! V")
    -- Search for the next marker. If found, move one line up to adjust the selection
    local current_pos = vim.fn.getpos(".")
    local next_marker = vim.fn.search("^# %%", "W")
    if next_marker > 0 and next_marker ~= current_pos[2] then vim.cmd("normal! k") end
    -- Adjust the visual selection to include the line before the next marker
    vim.cmd("normal! o")
    vim.cmd("normal! 0")
end

-- Forward search and select between markers
vim.keymap.set("n", "<C-Down>", SelectBetweenMarkersForward, {
    noremap = true,
    silent = true,
    desc = "Select cell forward", -- Description for the keymap
})
