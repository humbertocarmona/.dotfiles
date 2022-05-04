
vim.cmd([[
    let g:slime_target = "tmux"
    let g:slime_python_ipython = 1
    let g:slime_default_config = {"socket_name": "default", "target_pane": "{last}"}
    let g:slime_dont_ask_default = 1
    let g:ipython_cell_regex = 1
    let g:ipython_cell_tag = '# %%( [^[].*)?'
]])

