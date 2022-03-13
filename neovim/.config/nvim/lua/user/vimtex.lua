vim.cmd([[
    let g:vimtex_view_method = 'zathura'
    let g:vimtex_compiler_method = 'latexmk'
    let g:vimtex_compiler_silent = 1
    let g:vimtex_compiler_latexmk = {
        \ 'build_dir' : '',
        \ 'callback' : 1,
        \ 'continuous' : 1,
        \ 'executable' : 'latexmk',
        \ 'hooks' : [],
        \ 'options' : [
        \   '-verbose',
        \   '-synctex=1',
        \   '-interaction=nonstopmode',
        \ ],
        \}
]])
    -- let g:vimtex_view_general_viewer = "okular"
    -- let g:vimtex_view_general_options = "--unique file:@pdf\#src:@line@tex"
    --    \   '-file-line-error',
