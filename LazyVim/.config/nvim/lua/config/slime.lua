-- slime, general
vim.g.slime_target = "tmux"
vim.b.slime_cell_delimiter = "^#*\\s*%%"
vim.g.slime_default_config = { socket_name = "default", target_pane = "{last}" }
vim.g.slime_dont_ask_default = 1
vim.g.slime_bracketed_paste = 1
vim.g.slime_no_mappings = 1
-- vim.g.slime_preserve_curpos = 0
-- vim.g.slime_paste_file = "/home/humberto/.slime_paste"
