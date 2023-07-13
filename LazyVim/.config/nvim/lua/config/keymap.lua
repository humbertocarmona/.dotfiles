local wk = require("which-key")

P = function(x)
    print(vim.inspect(x))
    return x
end

RELOAD = function(...) return require("plenary.reload").reload_module(...) end

R = function(name)
    RELOAD(name)
    return require(name)
end

local opts = { noremap = true, silent = true }
local nmap = function(key, effect) vim.keymap.set("n", key, effect, opts) end
local vmap = function(key, effect) vim.keymap.set("v", key, effect, opts) end
local imap = function(key, effect) vim.keymap.set("i", key, effect, opts) end

-- Resize window using <shift> arrow keys
nmap("<S-Up>", ":resize +2<cr>:")
nmap("<S-Down>", ":resize -2<cr>:")
nmap("<S-Left>", ":vertical resize -2<cr>:")
nmap("<S-Right>", ":vertical resize +2<cr>:")

-- Move between windows using <ctrl> direction
nmap("<C-h>", "<C-w>h")
nmap("<C-j>", "<C-w>j")
nmap("<C-k>", "<C-w>k")
nmap("<C-l>", "<C-w>l")

nmap("<C-Left>", "<C-w>h")
nmap("<C-Down>", "<C-w>j")
nmap("<C-Up>", "<C-w>k")
nmap("<C-Right>", "<C-w>l")

nmap("<C-/>", ":ToggleTerm<cr>:")

-- Add undo break-points
-- imap(",", ",<c-g>u")
-- imap(".", ".<c-g>u")
-- imap(";", ";<c-g>u")

local function switchTheme()
    if vim.o.background == "light" then
        vim.o.background = "dark"
        vim.cmd([[Catppuccin mocha]])
    else
        vim.o.background = "light"
        vim.cmd([[Catppuccin latte]])
    end
end

-- Better buffer navigation
nmap("<S-l>", ":bnext<cr>:")
nmap("<S-h>", ":bprevious<cr>:")

nmap("Q", "<Nop>")

-- list hidden buffers
-- nmap("<leader>ls", ":ls!<cr>")
-- nmap("<leader>vh", ':execute "h " . expand("<cword>")<cr>')

-- source entire file
nmap("<leader>xx", ":w<cr>:source %<cr>")

-- keep selection after indent/dedent
vmap(">", ">gv")
vmap("<", "<gv")

-- remove search highlight on esc
nmap("<esc>", ":noh<cr>")

-- find files with telescope
nmap("<c-p>", ":Telescope find_files<cr>")

-- paste and without overwriting register
vmap("<leader>p", '"_dP')

-- delete and without overwriting register
vmap("<leader>d", '"_d')

-- center after search and jumps
nmap("n", "nzz")
nmap("<c-d>", "<c-d>zz")
nmap("<c-u>", "<c-u>zz")

vim.keymap.set("n", "-", require("oil").open, { desc = "Open parent directory" })

nmap("<leader>j", [[<c-w>wi]])

local function open_plugin()
    local word = vim.fn.expand("<cWORD>")
    -- url = string.match(url, '".+"')
    local url = string.match(word, '%b""')
    if url ~= nil then
        url = string.gsub(url, "[\"']", "")
    else
        url = string.match(word, "%b''")
        if url ~= nil then url = string.gsub(url, "[\"']", "") end
    end
    url = "https://github.com/" .. url
    local cmd = "!brave-browser " .. url
    vim.cmd(cmd)
end

--show kepbindings with whichkey
--add your own here if you want them to
--show up in the popup as well
wk.register({
    ["b"] = { ":Telescope buffers<cr>", "files", { noremap = true } },
    ["e"] = { ":NvimTreeToggle<cr>:", "explorer" },
    ["u"] = { ":UndotreeToggle<cr>:", "undo" },
    ["w"] = { ":set wrap!<cr>", "Toggle wrap" },
    ["x"] = { ":wqa<cr>:", "save all and quit" },
    a = {
        name = "Actions",
        a = { ":lua PdfAnnots()<cr>:", "annotate" },
        b = { ":terminal bibexport -o %:p:r.bib %:p:r.aux<cr>:", "bib export" },
        g = { ":e ~/.config/nvim/templates/Glossary.tex<cr>:", "edit glossary" },
        h = { ":lua _HTOP_TOGGLE()<cr>:", "htop" },
        i = { ":IlluminateToggle<cr>:", "illuminate" },
        r = { ":VimtexErrors<cr>:", "report errors" },
        s = { ":e ~/.config/nvim/snips/snippets/<cr>", "edit snippets" },
        u = { ":cd %:p:h<cr>:", "update cwd" },
        v = { "<plug>(vimtex-context-menu)", "vimtex menu" },
        p = { open_plugin, "open plugin" },
        t = { switchTheme, "switch theme" },
        l = { ":Lazy<cr>", "Lazy" },
        m = { ":Mason<cr>", "Mason" },
    },
    f = {
        name = "find (telescope)",
        -- b = { ":Telescope file_browser<cr>", "files", { noremap = true } },
        b = { ":Telescope bibtex<cr>:", "citations" },
        c = { ":Telescope colorscheme<cr>", "colortheme" },
        f = { ":Telescope find_files<cr>", "files" },
        k = { ":Telescope keymaps<cr>", "keymaps" },
        r = { ":Telescope lsp_references<cr>", "references" },
        g = { ":Telescope live_grep<cr>", "grep" },
        z = { ":Telescope current_buffer_fuzzy_find<cr>", "fuzzy" },
        m = { ":Telescope marks<cr>", "marks" },
        l = { ":Telescope loclist<cr>", "loclist" },
        j = { ":Telescope jumplist<cr>", "marks" },
        p = { "project" },
    },
    g = {
        name = "git",
        c = { ":GitConflictRefresh<cr>", "conflict" },
        g = { ":Neogit<cr>", "neogit" },
        s = { ":Gitsigns<cr>", "gitsigns" },
        pl = { ":Octo pr list<cr>", "gh pr list" },
        pr = { ":Octo review start<cr>", "gh pr review" },
        wc = { ":lua require('telescope').extensions.git_worktree.create_git_worktree()<cr>", "worktree create" },
        ws = { ":lua require('telescope').extensions.git_worktree.git_worktrees()<cr>", "worktree switch" },
        d = {
            name = "diff",
            o = { ":DiffviewOpen<cr>", "open" },
            c = { ":DiffviewClose<cr>", "close" },
        },
    },
    s = {
        name = "Lsp",
        ["/"] = { vim.lsp.buf.rename, "rename" },
        a = { vim.lsp.buf.code_action, "coda action" },
        d = { vim.lsp.buf.definition(), "go to definition" },
        D = { vim.lsp.buf.type_definition, "type definition" },
        e = { vim.diagnostic.open_float, "diagnostics" },
        f = { vim.lsp.buf.format, "format" },
        g = {
            name = "diagnostics",
            d = { vim.diagnostic.disable, "disable" },
            e = { vim.diagnostic.enable, "enable" },
        },
        l = { ":lua vim.g.cmptoggle = not vim.g.cmptoggle<cr>:", "cmptoggle" },
        n = { ":Neogen<cr>", "neogen docstring" },
        q = { ":Telescope quickfix<cr>", "quickfix" },
        r = { ":Telescope lsp_references<cr>", "references" },
        s = { ":Telescope lsp_document_symbols<cr>", "symbols" },
    },
    m = {
        name = "Manage sessions",
        -- restore the session for the current directory
        s = { [[:lua require("persistence").load()<cr>]], "restore session in cwd" },
        n = { [[:lua require("persistence").stop()<cr>]], "restore last session" },
        l = { [[:lua require("persistence").load({ last = true })<cr>]], "stop Persistence" },
    },
    p = {
        name = "Pandoc",
        w = { function() os.execute("pandoc -s %:p -o %:p:r.docx") end, "word" },
        m = { ":TermExec cmd='pandoc %:p -o %:p:r.md'<cr>:", "markdown" },
        h = { ":TermExec cmd='pandoc %:p -o %:p:r.html'<cr>:", "html" },
        l = { ":TermExec cmd='pandoc %:p -o %:p:r.tex'<cr>:", "latex" },
        p = { ":TermExec cmd='pandoc %:p -o %:p:r.pdf'<cr>:", "pdf" },
        -- x = { ":echo "run: unoconv -f pdf path-to.docx""  , "word to pdf"},
        -- w = { ":TermExec cmd='pandoc %:p -o %:p:r.docx'<cr>:" , "word"},
    },
    z = {
        name = "Spellcheck",
        s = { ":Telescope spell_suggest<cr>", "spelling" },
        ["/"] = { ":setlocal spell!<cr>", "spellcheck" },
        n = { "]s", "next" },
        p = { "[s", "previous" },
        g = { "zg", "good" },
        r = { "zg", "rigth" },
        w = { "zw", "wrong" },
        b = { "zw", "bad" },
    },
}, { mode = "n", prefix = "<leader>" })

-- normal mode
wk.register({
    ["<c-LeftMouse>"] = { ":lua vim.lsp.buf.definition()<cr>:", "go to definition" },
    ["gx"] = { ":!xdg-open <c-r><c-a><cr>", "open file" },
    ["<c-q>"] = { ":q<cr>", "close buffer" },
    ["<esc>"] = { ":noh<cr>", "remove search highlight" },
    ["n"] = { "nzzzv", "center search" },
    ["gN"] = { "Nzzzv", "center search" },
    ["gl"] = { "<c-]>", "open help link" },
    ["gf"] = { ":e <cfile><cr>:", "edit file" },
    ["co"] = { "o#%%<cr>", "new code chunk below" },
    ["cO"] = { "O#%%<cr>", "new code chunk above" },
    ["<m-i>"] = { "o```{r}<cr>```<esc>O", "r code chunk" },
    ["<cm-i>"] = { "o```{python}<cr>```<esc>O", "r code chunk" },
    ["<m-I>"] = { "o```{python}<cr>```<esc>O", "r code chunk" },
    -- ["qq"] = { ":q!<cr>", "quit no save" },
    -- ["wq"] = { ":wq<cr>", "write and quit" },
}, { mode = "n" })
-- visual mode
-- wk.register({
--     ["<cr>"] = { "<Plug>SlimeRegionSend", "run code region" },
--     -- ["gx"] = { '"ty:!xdg-open t<cr>', "open file" },
--     -- ["<M-j>"] = { ":m'>+<cr>`<my`>mzgv`yo`z", "move line down" },
--     -- ["<M-k>"] = { ":m'<-2<cr>`>my`<mzgv`yo`z", "move line up" },
--     -- ["."] = { ":norm .<cr>", "repat last normal mode command" },
--     -- ["q"] = { ":norm @q<cr>", "repat q macro" },
-- }, { mode = "v" })
--
-- wk.register({
--     ["<leader>"] = { "<Plug>SlimeRegionSend", "run code region" },
--     ["p"] = { '"_dP', "replace without overwriting reg" },
-- }, { mode = "v", prefix = "<leader>" })
--
-- wk.register({
--     -- ['<c-e>'] = { "<esc>:FeMaco<cr>i", "edit code" },
--     ["<m-->"] = { " <- ", "assign" },
--     ["<m-m>"] = { " |>", "pipe" },
--     ["<m-i>"] = { "```{r}<cr>```<esc>O", "r code chunk" },
--     ["<cm-i>"] = { "<esc>o```{python}<cr>```<esc>O", "r code chunk" },
--     ["<m-I>"] = { "<esc>o```{python}<cr>```<esc>O", "r code chunk" },
-- }, { mode = "i" })
