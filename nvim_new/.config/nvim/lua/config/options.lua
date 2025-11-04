-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
--
vim.g.mapleader = ","
vim.g.maplocalleader = ","

local opt = vim.opt

opt.termguicolors = true
opt.linespace = 2
opt.guifont = "FiraCode Nerd Font Propo:h12"
-- opt.guifont = "CaskaydiaCove NF ExtraLight"
-- opt.guifont = "CaskaydiaMono Nerd Font Mono:h12"
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.textwidth = 80
opt.colorcolumn = { 80 }
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldlevel = 2
opt.spell = false
opt.spelllang = { "en", "pt" }
opt.conceallevel = 0
opt.undofile = true
opt.undodir = vim.fn.stdpath("state") .. "/undo"
opt.undolevels = 1000
opt.undoreload = 10000
vim.filetype.add({
  pattern = { [".*/hypr/.*.conf"] = "fish" },
})
vim.filetype.add({
  pattern = { [".*/lf/.*"] = "fish" },
})
vim.filetype.add({
  pattern = { [".*/fish/.*"] = "fish" },
})

vim.g.autoformat = true
-- vim.opt.formatexpr = "v:lua.require'lazyvim.util'.format.formatexpr()"
vim.opt.formatexpr = "v:lua.require'conform'.formatexpr()"
vim.opt.formatoptions = "jcroqlnt" -- tcqj

-- vim.g.clipboard = {
--   name = "WslClipboard",
--   copy = { ["+"] = "clip.exe", ["*"] = "clip.exe" },
--   paste = {
--     ["+"] = "powershell.exe -NoProfile -Command Get-Clipboard",
--     ["*"] = "powershell.exe -NoProfile -Command Get-Clipboard",
--   },
--   cache_enabled = 0,
-- }
