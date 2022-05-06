---- IRON-REPL ----------------------------------------------------------------
local iron = require('iron')
iron.core.add_repl_definitions {
  python = {
    venv_python = {
      command =  "pipenv run ipython"
    }
  }
}
iron.core.set_config {
  preferred = {
    python = "venv_python",
  }
}


-- using IPy-Run and IPy-RunCell
-- vim.cmd [[nnoremap <silent><c-v> <Plug>(iron-visual-send)]]
-- vim.cmd [[nnoremap <C-p> <Plug>(iron-send-line)]]

-- vim.keymap.set("n", "<C-p>", "<Plug>(iron-send-line)")
-- vim.keymap.set("n", "<C-v>", "<Plug>(iron-visual-send)")
