vim.g.mapleader = "\\"
vim.g.maplocalleader = "\\"

-- select all
vim.api.nvim_set_keymap("n", "<C-a>", "ggVG", {noremap=true, silent=true})

-- Better window navigation
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", {noremap=true, silent=true})
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", {noremap=true, silent=true})
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", {noremap=true, silent=true})
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", {noremap=true, silent=true})

-- Resize with arrows
vim.api.nvim_set_keymap("n", "<C-Up>", ":resize -1<CR>", {noremap=true, silent=true})
vim.api.nvim_set_keymap("n", "<C-Down>", ":resize +3<CR>", {noremap=true, silent=true})
vim.api.nvim_set_keymap("n", "<C-Left>", ":vertical resize -1<CR>", {noremap=true, silent=true})
vim.api.nvim_set_keymap("n", "<C-Right>", ":vertical resize +3<CR>", {noremap=true, silent=true})

-- Insert ----------------------------

-- Stay in indent mode
vim.api.nvim_set_keymap("v", "<", "<gv", {noremap=true, silent=true})
vim.api.nvim_set_keymap("v", ">", ">gv", {noremap=true, silent=true})

-- replace selected text by register
vim.api.nvim_set_keymap("v", "p", '"_dP', {noremap=true, silent=true})

-- neovim version 7.0+
-- Better buffer navigation
vim.keymap.set("n", "<S-l>", ":bnext<CR>")
vim.keymap.set("n", "<S-h>", ":bprevious<CR>")
vim.keymap.set("n", "<S-d>", "<cmd>:bd<CR>")

-- fedepujol/move.nvim
vim.keymap.set('n', '<A-j>', ":MoveLine(1)<CR>")
vim.keymap.set('n', '<A-k>', ":MoveLine(-1)<CR>")
vim.keymap.set('v', '<A-j>', ":MoveBlock(1)<CR>")
vim.keymap.set('v', '<A-k>', ":MoveBlock(-1)<CR>")
vim.keymap.set('n', '<A-l>', ":MoveHChar(1)<CR>")
vim.keymap.set('n', '<A-h>', ":MoveHChar(-1)<CR>")
vim.keymap.set('v', '<A-l>', ":MoveHBlock(1)<CR>")
vim.keymap.set('v', '<A-h>', ":MoveHBlock(-1)<CR>")

