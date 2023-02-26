-- for quarto
vim.api.nvim_create_augroup("pandoc_syntax", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
    pattern = { "*.md" },
    command = "set filetype=markdown.pandoc",
    group = "pandoc_syntax",
})

vim.api.nvim_create_augroup("fish_files", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
    pattern = { "fish_*", "*.fish" },
    command = "set filetype=fish",
    group = "fish_files",
})
