vim.g.markdown_fenced_languages = { "html", "python", "bash=sh", "R=r" }
vim.opt.termguicolors = true

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

-- indent
vim.opt.smartindent = true
vim.opt.breakindent = true

-- consistent number column
vim.opt.signcolumn = "yes:1"

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
vim.opt.cmdheight = 0
vim.opt.textwidth = 80
vim.opt.colorcolumn = "+1"
--spell checker
local spellfile = os.getenv("HOME") .. "/.cspell/en.utf-8.add"
vim.opt.spell = false
vim.opt.spelllang = { "en_us", "pt" }
vim.opt.spellfile = spellfile

local cursor1 = "n-v:block-nCursor,"
local cursor2 = "c-i-ci-ve:hor50-Cursor-blinkwait300-blinkon200-blinkoff150,"
local cursor3 = "r-cr-o:hor50"
vim.opt.guicursor = cursor1 .. cursor2 .. cursor3

-- vim.g.vimtex_view_method = "zathura"
-- vim.g.vimtex_compiler_method = "latexmk"
-- plugins
-- slime, general
vim.b.slime_cell_delimiter = "^#*\\s*%%"
vim.g.slime_target = "tmux"
vim.g.slime_default_config = { socket_name = "default", target_pane = "{last}" }
vim.g.slime_dont_ask_default = 1
vim.g.slime_preserve_curpos = 0
vim.g.slime_no_mappings = 1
vim.g.slime_paste_file = "/home/humberto/.slime_paste"
vim.g.slime_python_ipython = 1
vim.g.slime_bracketed_paste = 0
vim.g.ipython_cell_highlight_cells = 1
-- git blame, lualine
vim.g.gitblame_display_virtual_text = 0
-- to make ipython cell to work with julia
vim.g.ipython_cell_run_command = 'include("{filepath}")'
-- vim.g.ipython_cell_cell_command = "include_string(Main, clipboard())"

-- Restore cursor position
vim.api.nvim_create_autocmd({ "BufReadPost" }, {
    pattern = { "*" },
    callback = function() vim.api.nvim_exec('silent! normal! g`"zv', false) end,
})
