-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua

local function augroup(name) return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true }) end

-- vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
--     pattern = { "lfrc", "lf_kitty*" },
--     command = "set filetype=bash",
-- })

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
    pattern = { "hyprland.conf", "env.conf", "execs.conf", "rules.conf", "keybinds.conf" },
    command = "set filetype=hyprlang",
})

-- vim.api.nvim_create_autocmd({ "VimEnter" }, { command = "NoNeckPain" })
