vim.opt.backup = false
vim.opt.completeopt = { "menuone", "noselect" }
vim.opt.conceallevel = 0
vim.opt.showmode = false
vim.opt.showbreak = "    "
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.writebackup = false
vim.opt.scrolloff = 7
vim.opt.sidescrolloff = 7
vim.opt.shortmess:append("c")

vim.g.markdown_fenced_languages = { "html", "python", "bash=sh", "R=r" }

-- more opinionated
vim.opt.number = true -- show line numbers
vim.opt.relativenumber = true
vim.opt.updatetime = 250 -- for auto commands and hovers
vim.opt.mouse = "a" -- enable mouse
vim.opt.mousefocus = true
vim.opt.clipboard:append("unnamedplus") -- use system clipboard
-- vim.cmd("set nowrap")
-- vim.opt.wrap = true
-- use spaces as tabs
local tabsize = 4
vim.opt.expandtab = true
vim.opt.shiftwidth = tabsize
vim.opt.tabstop = tabsize

-- , as leader
vim.g.mapleader = ","
vim.g.maplocalleader = ","
vim.opt.timeoutlen = 500 -- until which-key pops up

-- smarter search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- color theme tweaks
vim.g.nord_borders = true
vim.opt.termguicolors = true
-- indent
vim.opt.smartindent = false
vim.opt.breakindent = true
vim.opt.autoindent = false
-- consistent number column
vim.opt.signcolumn = "yes"

-- how to show a autocomplete menu
vim.opt.completeopt = "menuone,noinsert"

-- add folds with treesitter grammar
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- but open all by default
vim.opt.foldlevel = 99

-- global status line
vim.opt.laststatus = 3

-- split right and below by default
vim.opt.splitright = true
vim.opt.splitbelow = true

--tabline
vim.opt.showtabline = 1

--windowline
vim.opt.winbar = "%t"

vim.opt.formatoptions = "tcqrj"
-- hide cmdline when not used
vim.opt.cmdheight = 1
vim.opt.textwidth = 80
vim.opt.colorcolumn = "+1"
--spell checker
local spellfile = os.getenv("HOME") .. "/.cspell/en.utf-8.add"
vim.opt.spell = false
vim.opt.spelllang = { "en_us", "pt" }
vim.opt.spellfile = spellfile

-- local cursor1 = "n-v:block-nCursor,"
-- local cursor2 = "c-i-ci-ve:hor50-Cursor-blinkwait300-blinkon200-blinkoff150,"
-- local cursor3 = "r-cr-o:hor50"
-- vim.opt.guicursor = cursor1 .. cursor2 .. cursor3

-- plugins

-- Restore cursor position
vim.api.nvim_create_autocmd({ "BufReadPost" }, {
    pattern = { "*" },
    callback = function() vim.api.nvim_exec('silent! normal! g`"zv', false) end,
})
