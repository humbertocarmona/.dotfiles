local options = {
    backup = false,                          -- creates a backup file
    clipboard = "unnamedplus",               -- neovim access the system clipboard
    cmdheight = 1,
    completeopt = { "menuone", "noselect" }, -- mostly just for cmp
    conceallevel = 0,                        -- `` is visible in markdown files
    cursorline = true,
    expandtab = true,
    foldmethod = "indent",
    foldlevel = 5,
    foldclose = "all",
    guifont = "Hack Nerd Font Mono:h10",
    fileencoding = "utf-8",
    hlsearch = true,
    ignorecase = true,
    mouse = "a",                             -- allow the mouse in neovim
    number = true,                           -- set numbered lines
    numberwidth = 2,
    pumheight = 10,                          -- pop up menu height
    relativenumber = true,                   -- set relative numbered lines
    scrolloff = 8,                           -- is one of my fav
    sidescrolloff = 8,
    signcolumn = "yes",                      -- ?
    shiftwidth = 4,                          -- number of spaces for indentation
    showmode = false,
    showtabline = 2,                         -- always show tabs
    smartcase = true,                        -- smart case
    smartindent = true,                      -- make indenting smarter again
    splitbelow = true,
    splitright = true,
    swapfile = false,
    tabstop = 4,
    termguicolors = true,
    timeoutlen = 100,
    undofile = true,
    updatetime = 300,
    writebackup = false,
    textwidth = 80,
}

vim.opt.shortmess:append "c"

for k, v in pairs(options) do
    vim.opt[k] = v
end

vim.cmd [[ set whichwrap+=<,>,[,],h,l ]]
vim.cmd [[ set nowrap ]]
vim.cmd [[ set colorcolumn=82 ]]
-- vim.cmd [[set iskeyword+=-]]
-- vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work
vim.cmd [[ syntax on ]]
vim.cmd [[ filetype plugin indent on ]]

