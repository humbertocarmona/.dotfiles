-- global options
local tabsize = 4
vim.opt.expandtab = true
vim.opt.fileencoding = "utf-8"
vim.opt.tabstop = tabsize
vim.opt.shiftwidth = tabsize
vim.opt.termguicolors = true
vim.opt.foldclose = ""
vim.opt.foldlevel = 99
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.laststatus = 3
--vim.opt.listchars:append("space:·")
vim.opt.mouse = "a"
vim.opt.number = true
vim.opt.numberwidth = 1
vim.opt.relativenumber = true
vim.opt.scrolloff = 8
vim.opt.shiftwidth = tabsize
vim.opt.shortmess:append({ c = true, S = true })
vim.opt.showmode = false
vim.opt.showtabline = 0
vim.opt.sidescrolloff = 8
vim.opt.signcolumn = "yes:1"
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.tabstop = tabsize
vim.opt.termguicolors = true
vim.opt.textwidth = 110
vim.opt.timeoutlen = 500
vim.opt.undofile = true
vim.opt.updatetime = 300
vim.opt.writebackup = false
vim.opt.spell = false
vim.opt.spelllang = { "en_us", "pt_br" }
local home = os.getenv("HOME")
local spellfile = home .. "/.cspell/en.utf-8.add"
vim.opt.spellfile = spellfile

vim.b.slime_cell_delimiter = "^#*\\s*%%"
vim.g.slime_target = "tmux"
vim.g.slime_default_config = { socket_name = "default", target_pane = "{last}" }
vim.g.slime_dont_ask_default = 1
vim.g.slime_preserve_curpos = 0
vim.g.slime_no_mappings = 1
vim.g.slime_paste_file = "/home/humberto/.slime_paste"
vim.g.slime_python_ipython = 1
vim.g.slime_bracketed_paste = 1

vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
