----------------------------------------------------------
vim.api.nvim_create_autocmd({ "TermOpen" }, {
    pattern = { "*" },
    command = "setlocal nonumber",
})

----------------------------------------------------------
vim.api.nvim_create_augroup("pandoc_syntax", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
    pattern = { "*.md" },
    command = "set filetype=markdown.pandoc",
    group = "pandoc_syntax",
})

----------------------------------------------------------
vim.api.nvim_create_augroup("fish_files", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
    pattern = { "fish_*", "*.fish" },
    command = "set filetype=fish",
    group = "fish_files",
})

----------------------------------------------------------
vim.g.mapleader = ","
vim.g.maplocalleader = ","
local wk = require("which-key")
----------------------------------------------------------
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "help" },
    callback = function() vim.keymap.set("n", "<esc>", ":close<cr>", { buffer = true, silent = true, noremap = true }) end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "julia", "python" },
    callback = function()
        wk.register({
            d = {
                name = "Dev",
                s = { "<Plug>SlimeCellsSendAndGoToNext", "Send cell" },
                j = { "<Plug>SlimeCellsNext", "Next cell" },
                k = { "<Plug>SlimeCellsPrev", "Previous cell" },
                d = { ":Oil ~/.julia/dev<cr>", "Julia dev" },
            },
        }, { mode = "n", prefix = "<leader>" })
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "tex" },
    callback = function()
        wk.register({
            l = {
                name = "Tex",
                b = { ":VimtexCompile<cr>:", "Latex build" },
                cw = { ":VimtexCountWords!<cr>:", "Latex word count" },
                cc = { ":VimtexClean<cr>:", "Latex clean aux" },
                i = { ":VimtexTocOpen<cr>:", "Latex index" },
                r = {
                    name = "Read",
                    l = {
                        ":read ~/.config/nvim/templates/Letter.tex<cr>:",
                        "Letter.tex",
                    },
                    e = {
                        ":read ~/.config/nvim/templates/Prova.tex<cr>:",
                        "Prova.tex",
                    },
                    h = {
                        ":read ~/.config/nvim/templates/HandOut.tex<cr>:",
                        "HandOut.tex",
                    },
                    b = {
                        ":read ~/.config/nvim/templates/PhilBeamer.tex<cr>:",
                        "PhilBeamer.tex",
                    },
                    s = {
                        ":read ~/.config/nvim/templates/SubFile.tex<cr>:",
                        "SubFile.tex",
                    },
                    r = {
                        ":read ~/.config/nvim/templates/Root.tex<cr>:",
                        "Root.tex",
                    },
                },
                v = { ":VimtexView<cr>:", "Latex view" },
            },
        }, { mode = "n", prefix = "<leader>" })
    end,
})
