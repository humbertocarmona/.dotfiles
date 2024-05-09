-- Options are automatically loaded before lazy.nvim startup

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
vim.g.neovide_transparency = 1.0
vim.g.transparency = 1.0
vim.g.neovide_background_color = "#0f1117" .. alpha()

--- change leader from " " to ","
vim.g.mapleader = ","
vim.g.maplocalleader = ","

local opt = vim.opt

opt.linespace = 2
-- opt.guifont = "FiraCode Nerd Font Propo:h12"
-- opt.guifont = "CaskaydiaCove NF ExtraLight"
opt.guifont = "CaskaydiaMono Nerd Font Mono:h12"
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.textwidth = 80
opt.colorcolumn = { 81 }
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldlevel = 1
opt.spell = false
opt.spelllang = { "en", "pt" }
opt.conceallevel = 0
vim.filetype.add({
    pattern = { [".*/hypr/.*.conf"] = "fish" },
})
vim.filetype.add({
    pattern = { [".*/lf/.*"] = "fish" },
})
vim.filetype.add({
    pattern = { [".*/fish/.*"] = "fish" },
})
