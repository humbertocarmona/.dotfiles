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
opt.guifont = "FiraCode Nerd Font Propo:h10"
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.textwidth = 88
opt.colorcolumn = { 88 }
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

if vim.fn.has("wsl") == 1 then
  local yank = "/mnt/c/Users/carmo/scoop/apps/neovim/current/bin/win32yank.exe"
  vim.g.clipboard = {
    name = "win32yank-wsl",
    copy = {
      ["+"] = yank .. " -i --crlf",
      ["*"] = yank .. " -i --crlf",
    },
    paste = {
      ["+"] = yank .. " -o --lf",
      ["*"] = yank .. " -o --lf",
    },
    cache_enabled = 0,
  }
end
