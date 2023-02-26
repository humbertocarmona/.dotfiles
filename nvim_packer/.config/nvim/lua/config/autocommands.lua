-- FileType can close with 'q'
vim.api.nvim_create_autocmd(
    'FileType',
    {
        pattern = {'help'},
        command = [[nnoremap <buffer><silent> q :close<CR>]]
    }
)

-- FileType auto save
vim.api.nvim_create_augroup('autosave', {clear = true})
vim.api.nvim_create_autocmd({'InsertLeave'}, {
    pattern={'*.py', '*.jl', '*.cpp'},
    command='update',
    group = 'autosave'
})

-- set pandoc syntax
vim.api.nvim_create_augroup('pandoc_syntax', {clear = true})
vim.api.nvim_create_autocmd({'BufEnter', 'BufWinEnter'},{
    pattern = {'*.md'},
    command = 'set FileType=markdown.pandoc',
    group = 'pandoc_syntax'
})
