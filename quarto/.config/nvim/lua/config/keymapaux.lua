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

local buffopts = { noremap = true, silent = true }
local nmap = function(key, effect) vim.keymap.set("n", key, effect, buffopts) end
local vmap = function(key, effect) vim.keymap.set("v", key, effect, buffopts) end
local imap = function(key, effect) vim.keymap.set("i", key, effect, buffopts) end

-- Resize window using <shift> arrow keys
nmap("<S-Up>", "<cmd>resize +2<CR>")
nmap("<S-Down>", "<cmd>resize -2<CR>")
nmap("<S-Left>", "<cmd>vertical resize -2<CR>")
nmap("<S-Right>", "<cmd>vertical resize +2<CR>")

-- Move between windows using <ctrl> direction
nmap("<C-h>", "<C-w>h")
nmap("<C-j>", "<C-w>j")
nmap("<C-k>", "<C-w>k")
nmap("<C-l>", "<C-w>l")

nmap("<C-Left>", "<C-w>h")
nmap("<C-Down>", "<C-w>j")
nmap("<C-Up>", "<C-w>k")
nmap("<C-Right>", "<C-w>l")

nmap("<C-/>", ":ToggleTerm<CR>")

-- Add undo break-points
imap(",", ",<c-g>u")
imap(".", ".<c-g>u")
imap(";", ";<c-g>u")

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
nmap("<S-l>", ":bnext<CR>")
nmap("<S-h>", ":bprevious<CR>")

nmap("<A-j>", ":MoveLine(1)<CR>")
nmap("<A-k>", ":MoveLine(-1)<CR>")
nmap("<A-h>", ":MoveHChar(-1)<CR>")
nmap("<A-l>", ":MoveHChar(1)<CR>")

vmap("<A-j>", ":MoveBlock(1)<CR>")
vmap("<A-k>", ":MoveBlock(-1)<CR>")
vmap("<A-h>", ":MoveHBlock(-1)<CR>")
vmap("<A-l>", ":MoveHBlock(1)<CR>")

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
nmap("<esc>", "<cmd>noh<cr>")

-- find files with telescope
nmap("<c-p>", "<cmd>Telescope find_files<cr>")

-- paste and without overwriting register
vmap("<leader>p", '"_dP')

-- delete and without overwriting register
vmap("<leader>d", '"_d')

-- center after search and jumps
nmap("n", "nzz")
nmap("<c-d>", "<c-d>zz")
nmap("<c-u>", "<c-u>zz")

nmap("<leader>j", [[<c-w>wi]])

nmap("<leader>cc", ":IPythonCellExecuteCellJump<cr>")
nmap("<leader>cl", ":IPythonCellClear<cr>")
nmap("<leader>cn", ":IPythonCellNextCell<cr>")
nmap("<leader>cp", ":IPythonCellPrevCell<cr>")
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
    c = {
        name = "code",
        c = { ":IPythonCellExecuteCellJump<cr>" },
        l = { ":IPythonCellClear<cr>" },
        n = { ":IPythonCellNextCell<cr>" },
        p = { ":IPythonCellPrevCell<cr>" },
        -- v = { "<Plug>SlimeConfig" },
        -- c = { "<Plug>SlimeCellsSendAndGoToNext" },
        -- j = { "<Plug>SlimeCellsNext" },
        -- k = { "<Plug>SlimeCellsPrev" },
    },
    v = {
        name = "vim",
        p = { open_plugin, "open plugin" },
        t = { switchTheme, "switch theme" },
        c = { ":Telescope colorscheme<cr>", "colortheme" },
        l = { ":Lazy<cr>", "Lazy" },
        m = { ":Mason<cr>", "Mason" },
        s = { ":e $MYVIMRC | :cd %:p:h | split . | wincmd k<cr>", "Settings" },
    },
    l = {
        name = "language/lsp",
        d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "go to definition" },
        R = { "<cmd>Telescope lsp_references<cr>", "references" },
        r = { vim.lsp.buf.rename, "rename" },
        D = { vim.lsp.buf.type_definition, "type definition" },
        a = { vim.lsp.buf.code_action, "coda action" },
        e = { vim.diagnostic.open_float, "diagnostics" },
        f = { vim.lsp.buf.format, "format" },
        o = { ":SymbolsOutline<cr>", "outline" },
        g = {
            name = "diagnostics",
            d = { vim.diagnostic.disable, "disable" },
            e = { vim.diagnostic.enable, "enable" },
        },
        n = { ":Neogen<cr>", "neogen docstring" },
    },
    Q = {
        name = "quarto",
        a = { ":QuartoActivate<cr>", "activate" },
        p = { ":lua require'quarto'.quartoPreview()<cr>", "preview" },
        q = { ":lua require'quarto'.quartoClosePreview()<cr>", "close" },
        h = { ":QuartoHelp ", "help" },
        e = { ":lua require'otter'.export()<cr>", "export" },
        E = { ":lua require'otter'.export(true)<cr>", "export overwrite" },
    },
    f = {
        name = "find (telescope)",
        b = { "<cmd>Telescope file_browser<cr>", "files", { noremap = true } },
        f = { "<cmd>Telescope find_files<cr>", "files" },
        -- h = { "<cmd>Telescope help_tags<cr>", "help" },
        k = { "<cmd>Telescope keymaps<cr>", "keymaps" },
        r = { "<cmd>Telescope lsp_references<cr>", "references" },
        g = { "<cmd>Telescope live_grep<cr>", "grep" },
        z = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "fuzzy" },
        m = { "<cmd>Telescope marks<cr>", "marks" },
        M = { "<cmd>Telescope man_pages<cr>", "man pages" },
        c = { "<cmd>Telescope git_commits<cr>", "git commits" },
        s = { "<cmd>Telescope lsp_document_symbols<cr>", "symbols" },
        d = { "<cmd>Telescope buffers<cr>", "buffers" },
        q = { "<cmd>Telescope quickfix<cr>", "quickfix" },
        l = { "<cmd>Telescope loclist<cr>", "loclist" },
        j = { "<cmd>Telescope jumplist<cr>", "marks" },
        p = { "project" },
    },
    h = {
        name = "hidden",
        h = { ":set conceallevel=1<cr>", "hide/conceal" },
        s = { ":set conceallevel=0<cr>", "show/unconceal" },
    },
    s = {
        name = "spellcheck",
        s = { "<cmd>Telescope spell_suggest<cr>", "spelling" },
        ["/"] = { "<cmd>setlocal spell!<cr>", "spellcheck" },
        n = { "]s", "next" },
        p = { "[s", "previous" },
        g = { "zg", "good" },
        r = { "zg", "rigth" },
        w = { "zw", "wrong" },
        b = { "zw", "bad" },
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
    w = {
        name = "write",
        s = { ":w<cr>", "save (write)" },
        w = { ":wq<cr>", "write and quit" },
        q = { ":q!<cr>", "quit (no save)" },
    },

    j = {
        name = "jukit",
        ["os"] = { ':lua require("jukit.splits").output()<CR>', "new out win" },
        ["ts"] = { ':lua require("jukit.splits").term()<CR>', "new out win no cmd" },
        ["hs"] = { ':lua require("jukit.splits").history()<CR>', "new out win w/ saved cmds" },
        ["ohs"] = { ':lua require("jukit.splits").output_and_history()<CR>', "new out term" },
        ["hd"] = { ':lua require("jukit.splits").close_history()<CR>', "close hist out win" },
        ["od"] = { ':lua require("jukit.splits").close_output_split()<CR>', "close out win" },

        ["so"] = { ':lua require("jukit.splits").show_last_cell_output(1)<CR>', "show last cell output" },
        ["j"] = { ':lua require("jukit.splits").out_hist_scroll(1)<CR>', "scroll down output-hist" },
        ["k"] = { ':lua require("jukit.splits").out_hist_scroll(0)<CR>', "scroll up output hist" },
        ["ah"] = { ':lua require("jukit.splits").toggle_auto_hist()<CR>', "create/delete autocmd" },
        ["sl"] = { ':lua require("jukit.layouts").set_layout()<CR>', "apply layout " },

        ["<space>"] = { ':lua require("jukit.send").section(0)<CR>', "send cell" },
        ["cc"] = { ':lua require("jukit.send").until_current_section()<CR>', "execute cells above" },
        ["all"] = { ':lua require("jukit.send").all()<CR>', "execute all" },

        ["co"] = { ':lua require("jukit.cells").create_below(0)<CR>', "create cell below" },
        ["cO"] = { ':lua require("jukit.cells").create_above(0)<CR>', "create cell above" },
        ["ct"] = { ':lua require("jukit.cells").create_below(1)<CR>', "create text cell below" },
        ["cT"] = { ':lua require("jukit.cells").create_above(1)<CR>', "create text cell above" },
        ["cd"] = { ':lua require("jukit.cells").delete()<CR>', "delete current cell" },
        ["cs"] = { ':lua require("jukit.cells").split()<CR>', "split current cell" },
        ["cM"] = { ':lua require("jukit.cells").merge_above()<CR>', "merge above" },
        ["cm"] = { ':lua require("jukit.cells").merge_below()<CR>', "merge bellow" },
        ["ck"] = { ':lua require("jukit.cells").move_up()<CR>', "move cell up" },
        ["cj"] = { ':lua require("jukit.cells").move_down()<CR>', "move cell down" },
        ["J"] = { ':lua require("jukit.cells").jump_to_next_cell()<CR>', "jump next cell" },
        ["K"] = { ':lua require("jukit.cells").jump_to_previous_cell()<CR>', "jump prev cell" },
        ["ddo"] = { ':lua require("jukit.cells").delete_outputs(0)<CR>', "delete cell output" },
        ["dda"] = { ':lua require("jukit.cells").delete_outputs(1)<CR>', "" },

        ["np"] = { ':lua require("jukit.convert").notebook_convert("jupyter-notebook")<CR>', "ipynb to py" },
        ["ht"] = { ':lua require("jukit.convert").save_nb_to_file(0, 1, "html")<CR>', "to html" },
        ["rht"] = { ':lua require("jukit.convert").save_nb_to_file(1, 1, "html")<CR>', "to html run cells" },
        ["pd"] = { ':lua require("jukit.convert").save_nb_to_file(0, 1, "pdf")<CR>', " to pdf" },
        ["rpd"] = { ':lua require("jukit.convert").save_nb_to_file(1, 1, "pdf")<CR>', "to pdf run cells" },
    },
}, { mode = "n", prefix = "<leader>" })

-- normal mode
wk.register({
    ["<c-LeftMouse>"] = { "<cmd>lua vim.lsp.buf.definition()<CR>", "go to definition" },
    ["gx"] = { ":!xdg-open <c-r><c-a><cr>", "open file" },
    ["<c-q>"] = { "<cmd>q<cr>", "close buffer" },
    ["<esc>"] = { "<cmd>noh<cr>", "remove search highlight" },
    ["n"] = { "nzzzv", "center search" },
    ["gN"] = { "Nzzzv", "center search" },
    ["gl"] = { "<c-]>", "open help link" },
    ["gf"] = { ":e <cfile><CR>", "edit file" },
    ["co"] = { "o#%%<cr>", "new code chunk below" },
    ["cO"] = { "O#%%<cr>", "new code chunk above" },
    ["<m-i>"] = { "o```{r}<cr>```<esc>O", "r code chunk" },
    ["<cm-i>"] = { "o```{python}<cr>```<esc>O", "r code chunk" },
    ["<m-I>"] = { "o```{python}<cr>```<esc>O", "r code chunk" },
    -- ["qq"] = { ":q!<cr>", "quit no save" },
    -- ["wq"] = { ":wq<cr>", "write and quit" },
}, { mode = "n" })

-- visual mode
wk.register({
    ["<cr>"] = { "<Plug>SlimeRegionSend", "run code region" },
    -- ["gx"] = { '"ty:!xdg-open t<cr>', "open file" },
    -- ["<M-j>"] = { ":m'>+<cr>`<my`>mzgv`yo`z", "move line down" },
    -- ["<M-k>"] = { ":m'<-2<cr>`>my`<mzgv`yo`z", "move line up" },
    -- ["."] = { ":norm .<cr>", "repat last normal mode command" },
    -- ["q"] = { ":norm @q<cr>", "repat q macro" },
}, { mode = "v" })

-- wk.register({
--     ["<leader>"] = { "<Plug>SlimeRegionSend", "run code region" },
--     ["p"] = { '"_dP', "replace without overwriting reg" },
-- }, { mode = "v", prefix = "<leader>" })

wk.register({
    -- ['<c-e>'] = { "<esc>:FeMaco<cr>i", "edit code" },
    ["<m-->"] = { " <- ", "assign" },
    ["<m-m>"] = { " |>", "pipe" },
    ["<m-i>"] = { "```{r}<cr>```<esc>O", "r code chunk" },
    ["<cm-i>"] = { "<esc>o```{python}<cr>```<esc>O", "r code chunk" },
    ["<m-I>"] = { "<esc>o```{python}<cr>```<esc>O", "r code chunk" },
}, { mode = "i" })
