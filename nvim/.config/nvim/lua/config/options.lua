-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.termguicolors = true

vim.g.neovide_theme = "auto"
vim.g.neovide_cursor_trail_size = 0.
vim.g.neovide_cursor_animation_length = 0
vim.g.neovide_scroll_animation_length = 0
vim.g.neovide_remember_window_size = true
vim.g.neovide_floating_shadow = true
vim.g.neovide_floating_z_height = 10
vim.g.neovide_light_angle_degrees = 45
vim.g.neovide_light_radius = 5

-- Helper function for transparency formatting
local alpha = function() return string.format("%x", math.floor((255 * vim.g.transparency) or 0.8)) end
-- g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
vim.g.neovide_transparency = 0.75
vim.g.transparency = 0.75
vim.g.neovide_background_color = "#0f1117" .. alpha()

--- change leader from " " to ","
vim.g.mapleader = ","
vim.g.maplocalleader = ","

local opt = vim.opt

opt.linespace = 2
opt.guifont = "JetBrainsMono Nerd Font:h10"
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.textwidth = 80
opt.colorcolumn = { 81 }
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldlevel = 99
opt.spell = true
opt.spelllang = { "pt", "en" }
opt.conceallevel = 0
vim.filetype.add({
    pattern = { [".*/hypr/.*.conf"] = "hyprlang" },
})
vim.filetype.add({
    pattern = { [".*/fish/.*"] = "fish" },
})
