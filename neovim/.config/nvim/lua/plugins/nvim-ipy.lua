vim.g.nvim_ipy_perform_mappings = 0
vim.g.ipy_celldef = '^# %%'

vim.api.nvim_create_user_command("RunPythonQtConsole",
     "call jobstart('jupyter qtconsole --JupyterWidget.include_other_output=True')",
    {})

vim.api.nvim_create_user_command("RunJuliaQtConsole",
     "call jobstart('jupyter qtconsole --kernel julia-1.7 --JupyterWidget.include_other_output=True')",
    {})


vim.keymap.set("n", "]r", "<Plug>(IPy-RunCell)")
