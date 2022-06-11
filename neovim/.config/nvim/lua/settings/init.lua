local function GetLocalSpell()
    local name1 = "./en.utf-8.add"
    local home = os.getenv("HOME")
    local name2 = home .. "/.config/nvim/spell/en.utf-8.add"
    if os.rename(name1,name1) then
        return name1
    end
    return name2
end

-- Global options
vim.opt.backup = false                  -- creates a backup file
vim.opt.clipboard = "unnamedplus"       -- neovim access the system clipboard
vim.opt.cmdheight = 1
vim.opt.colorcolumn = {80}
vim.opt.conceallevel = 0                -- `` is visible in markdown files
vim.opt.cursorcolumn = false
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.fileencoding = "utf-8"
vim.opt.foldclose = ""
vim.opt.foldlevel = 99
vim.opt.foldmethod = "indent"
vim.opt.guifont = "Hack Nerd Font:h9"
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.mouse = "a"
vim.opt.number = true
vim.opt.numberwidth = 2
vim.opt.pumheight = 10                  -- pop up menu height
vim.opt.relativenumber = false
vim.opt.scrolloff = 8
vim.opt.shiftwidth = 4
vim.opt.shortmess:append {c=true, S=true}
vim.opt.showmode = false
vim.opt.showtabline = 2
vim.opt.sidescrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.tabstop = 4
vim.opt.termguicolors = true
vim.opt.textwidth = 80
vim.opt.timeoutlen = 100
vim.opt.undofile = true
vim.opt.updatetime = 300
vim.opt.writebackup = false
vim.opt.spell = true
vim.opt.spelllang = {'en_us', 'pt_br' }
vim.opt.spellfile=GetLocalSpell()
vim.cmd ('set nowrap')
vim.cmd (':filetype plugin indent on')
vim.cmd (':filetype plugin on')

-- vim.cmd ('colorscheme jellybeans-nvim')
vim.cmd ('colorscheme sakura')
-- vim.cmd ('colorscheme ayu-dark' )
-- vim.cmd ('colorscheme kanagawa' )
-- vim.cmd ('colorscheme ghdark')
--
vim.api.nvim_create_autocmd("BufEnter",{
    pattern="*",
    callback=function()
        vim.opt.laststatus = 3
    end
})
