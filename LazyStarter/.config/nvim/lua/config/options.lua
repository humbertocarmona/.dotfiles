-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

--- change leader from " " to ","
vim.g.mapleader = ","
vim.g.maplocalleader = ","

local opt = vim.opt

opt.tabstop = 4
opt.textwidth = 80

opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldlevel = 99
local spellfile = os.getenv("HOME") .. "/.cspell/en.utf-8.add"
opt.spelllang = { "pt", "en" }
opt.spellfile = spellfile
