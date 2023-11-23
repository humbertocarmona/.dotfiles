-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.neovide_theme = "auto"
vim.g.neovide_cursor_trail_size = 0.
vim.g.neovide_cursor_animation_length = 0
vim.g.neovide_scroll_animation_length = 0

--- change leader from " " to ","
vim.g.mapleader = ","
vim.g.maplocalleader = ","

local opt = vim.opt

opt.linespace = 2
opt.guifont = "FiraCode Nerd Font Mono:h12"
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.textwidth = 80
opt.colorcolumn = { 80 }
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldlevel = 99
opt.spelllang = { "pt", "en" }
opt.conceallevel = 0
