vim.g.nvim_ipy_perform_mappings = 0
vim.g.ipy_celldef = '^# %%'

vim.api.nvim_create_user_command("RunQtConsole",
     "call jobstart('jupyter qtconsole --JupyterWidget.include_other_output=True')",
    {})


-- vim.cmd [[map <leader>rr <Plug>(IPy-Run)]]
-- vim.cmd [[map <leader>rc <Plug>(IPy-RunCell)]]

-- vim.keymap.set("n","<leader>jq", ":RunQtConsole")
-- vim.keymap.set("n","<leader>jk", ":IPython --existing --no-window")
-- vim.keymap.set("n", "<leader>jc", "<Plug>(IPy-RunCell)")
-- vim.keymap.set("n", "<leader>ja", "<Plug>(IPy-RunAll)")
-- vim.keymap.set("n", "<leader>jr", function ()
--     vim.cmd("RunQtConsole")
--     vim.cmd("IPython --existing --no-window")
-- end)
