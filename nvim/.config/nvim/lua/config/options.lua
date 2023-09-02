-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

--- change leader from " " to ","
vim.g.mapleader = ","
vim.g.maplocalleader = ","

local opt = vim.opt

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
