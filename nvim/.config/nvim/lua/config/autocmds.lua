-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua

-- autocmd BufNewFile,BufRead *.csv   set filetype=csv_semicolon
-- autocmd BufNewFile,BufRead *.dat   set filetype=csv_pipe- Add any additional autocmds here

local function augroup(name) return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true }) end

-- vim.api.nvim_create_autocmd({ "FileType" }, {
--     group = augroup("rainbow_csv"),
--     pattern = {
--         "csv",
--     },
--     command = "set filetype=csv",
-- })
