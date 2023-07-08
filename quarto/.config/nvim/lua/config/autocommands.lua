----------------------------------------------------------
vim.api.nvim_create_autocmd({ "TermOpen" }, {
    pattern = { "*" },
    command = "setlocal nonumber",
})

----------------------------------------------------------
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "help" },
    callback = function() vim.keymap.set("n", "q", ":close<cr>", { buffer = true, silent = true, noremap = true }) end,
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
-- vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
--     pattern = { "*" },
--     command = "ASToggle",
-- })
