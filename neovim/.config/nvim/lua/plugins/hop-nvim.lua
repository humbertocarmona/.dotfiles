
hop = require'hop'

hop.setup{}

-- vim.keymap.set('n', 'f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>", {buffer=0})
-- vim.keymap.set('n', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>", {buffer=0})
-- vim.keymap.set('o', 'f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, inclusive_jump = true })<cr>", {buffer=0})
-- vim.keymap.set('o', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, inclusive_jump = true })<cr>", {buffer=0})
-- vim.keymap.set('', 't', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>", {buffer=0})
-- vim.keymap.set('', 'T', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>", {buffer=0})
-- vim.keymap.set('n', '<leader>h', "<cmd> lua require'hop'.hint_words({ hint_position = require'hop.hint'.HintPosition.END })<cr>", {buffer=0})
-- vim.keymap.set('v', '<leader>h', "<cmd> lua require'hop'.hint_words({ hint_position = require'hop.hint'.HintPosition.END })<cr>", {buffer=0})
-- vim.keymap.set('o', '<leader>h', "<cmd> lua require'hop'.hint_words({ hint_position = require'hop.hint'.HintPosition.END, inclusive_jump = true })<cr>", {buffer=0})


vim.keymap.set("n","h","<cmd>lua require('hop').hint_words()<cr>",{})
vim.keymap.set("n","l","<cmd>lua require('hop').hint_lines()<cr>",{})
vim.keymap.set("v","h","<cmd>lua require('hop').hint_words()<cr>",{})
vim.keymap.set("v","l","<cmd>lua require('hop').hint_lines()<cr>",{})
vim.cmd("hi HopNextKey guifg=#ff9900")
vim.cmd("hi HopNextKey1 guifg=#ff9900")
vim.cmd("hi HopNextKey2 guifg=#ff9900")
