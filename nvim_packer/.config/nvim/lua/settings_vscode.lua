local function GetLocalSpell()
    local name1 = "./en.utf-8.add"
    local home = os.getenv("HOME")
    local name2 = home .. "/.config/nvim/spell/en.utf-8.add"
    if os.rename(name1,name1) then
        return name1
    end
    return name2
end

local vim = vim
local opt = vim.opt

-- Global options
opt.backup = false                  -- creates a backup file
opt.clipboard:append {"unnamedplus"}       -- neovim access the system clipboard
opt.cmdheight = 1
opt.colorcolumn = {110}
opt.conceallevel = 0                -- `` is visible in markdown files
opt.cursorcolumn = false
opt.cursorline = true
opt.expandtab = true
opt.fileencoding = "utf-8"
opt.foldclose = ""
opt.foldlevel = 99
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
--opt.foldmethod = "indent"
opt.guifont = "Hack NF:h9"
opt.hlsearch = true
opt.ignorecase = true
opt.listchars:append('space:·')
opt.mouse = "a"
opt.number = true
opt.numberwidth = 1
opt.pumheight = 10                  -- pop up menu height
opt.relativenumber = false
opt.scrolloff = 8
opt.shiftwidth = 4
opt.shortmess:append {c=true, S=true}
opt.showmode = false
opt.showtabline = 0
opt.sidescrolloff = 8
opt.signcolumn = "yes"
opt.smartcase = true
opt.smartindent = true
opt.splitbelow = true
opt.splitright = true
opt.swapfile = false
opt.tabstop = 4
-- opt.termguicolors = true
opt.textwidth = 110
opt.timeoutlen = 500
opt.undofile = true
opt.updatetime = 300
opt.writebackup = false
opt.spell = true
opt.spelllang = {'en_us', 'pt_br' }
opt.spellfile=GetLocalSpell()
