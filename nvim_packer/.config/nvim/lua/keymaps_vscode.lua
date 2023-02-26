vim.g.mapleader = ","
vim.g.maplocalleader = ","
local bufopts = { noremap = true, silent = true}

-- select all
-- vim.keymap.set("n", "<C-a>", "ggVG", bufopts)


-- clear all selections
vim.keymap.set("n", "<leader>c", "::let @/=''<cr>", bufopts)
-- delete buffer
vim.keymap.set("n", "<leader>bd", ":bd<cr>", bufopts)

-- Better window navigation
vim.keymap.set("n", "<C-j>", "<C-w>j", bufopts)
vim.keymap.set("n", "<C-h>", "<C-w>h", bufopts)
vim.keymap.set("n", "<C-k>", "<C-w>k", bufopts)
vim.keymap.set("n", "<C-l>", "<C-w>l", bufopts)

-- Resize with arrows
vim.keymap.set("n", "<C-Up>", ":resize -1<CR>", bufopts)
vim.keymap.set("n", "<C-Down>", ":resize +3<CR>", bufopts)
vim.keymap.set("n", "<C-Left>", ":vertical resize -1<CR>", bufopts)
vim.keymap.set("n", "<C-Right>", ":vertical resize +3<CR>", bufopts)

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", bufopts)
vim.keymap.set("v", ">", ">gv", bufopts)

-- Better buffer navigation
vim.keymap.set("n", "<S-l>", ":bnext<CR>", bufopts)
vim.keymap.set("n", "<S-h>", ":bprevious<CR>", bufopts)

-- fedepujol/move.nvim
vim.keymap.set("n", "<A-h>", ":MoveHChar(-1)<CR>", bufopts)
vim.keymap.set("n", "<A-j>", ":MoveLine(1)<CR>", bufopts)
vim.keymap.set("n", "<A-k>", ":MoveLine(-1)<CR>", bufopts)
vim.keymap.set("n", "<A-l>", ":MoveHChar(1)<CR>", bufopts)
vim.keymap.set("v", "<A-h>", ":MoveHBlock(-1)<CR>", bufopts)
vim.keymap.set("v", "<A-j>", ":MoveBlock(1)<CR>", bufopts)
vim.keymap.set("v", "<A-k>", ":MoveBlock(-1)<CR>", bufopts)
vim.keymap.set("v", "<A-l>", ":MoveHBlock(1)<CR>", bufopts)

-- Telescope
vim.keymap.set("n", "<leader>td", ":Telescope diagnostics<cr>", bufopts)
vim.keymap.set("n", "<leader>tk", ":Telescope keymaps<cr>", bufopts)
vim.keymap.set("n", "<leader>b", ":Telescope buffers<cr>", bufopts)
vim.keymap.set("n", "<leader>tc", ":Telescope colorscheme<cr>", bufopts)
vim.keymap.set("n", "<leader>tf", ":Telescope find_files<cr>", bufopts)
vim.keymap.set("n", "<leader>tl", ":Telescope live_grep<cr>", bufopts)
vim.keymap.set("n", "<leader>tp", ":lua require('telescope').extensions.project.project{}<cr>", bufopts)

