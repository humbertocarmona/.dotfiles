-- slime, general
vim.b.slime_cell_delimiter = "^#*\\s*%%"
vim.g.slime_target = "tmux"
vim.g.slime_default_config = { socket_name = "default", target_pane = "{last}" }
vim.g.slime_dont_ask_default = 1
vim.g.slime_preserve_curpos = 0
vim.g.slime_no_mappings = 1
vim.g.slime_paste_file = "/home/humberto/.slime_paste"
vim.g.slime_python_ipython = 1
vim.g.slime_bracketed_paste = 0
vim.g.ipython_cell_highlight_cells = 1
-- git blame, lualine
vim.g.gitblame_display_virtual_text = 0
-- to make ipython cell to work with julia
vim.g.ipython_cell_run_command = 'include("{filepath}")'
-- vim.g.ipython_cell_cell_command = "include_string(Main, clipboard())"
