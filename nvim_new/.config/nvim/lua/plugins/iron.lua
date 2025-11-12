return {
  "Vigemus/iron.nvim",
  lazy = true,
  ft = { "python", "julia" },
  config = function()
    local iron = require("iron.core")
    local view = require("iron.view")
    local common = require("iron.fts.common")

    iron.setup({
      config = {
        -- Whether a repl should be discarded or not
        scratch_repl = true,
        -- Your repl definitions come here
        repl_definition = {
          sh = {
            -- Can be a table or a function that
            -- returns a table (see below)
            command = { "zsh" },
          },
          python = {
            command = { "python3" }, -- or { "ipython", "--no-autoindent" }
            format = common.bracketed_paste_python,
            block_dividers = { "# %%", "#%%" },
            env = { PYTHON_BASIC_REPL = "1" }, --this is needed for python3.13 and up.
          },
          julia = {
            command = { "julia", "--color=no", "--project=./" },
            block_dividers = { "# %%", "#%%" },
          },
        },
        -- set the file type of the newly created repl to ft
        -- bufnr is the buffer id of the REPL and ft is the filetype of the
        -- language being used for the REPL.
        repl_filetype = function(bufnr, ft)
          return ft
          -- or return a string name such as the following
          -- return "iron"
        end,
        -- Send selections to the DAP repl if an nvim-dap session is running.
        dap_integration = true,
        -- How the repl window will be displayed
        -- See below for more information
        -- repl_open_cmd = view.bottom(40),
        -- repl_open_cmd = view.right(44),
        repl_open_cmd = view.split.vertical.botright(0.45),
      },
      -- Iron doesn't set keymaps by default anymore.
      -- You can set them here or manually add keymaps to the functions in iron.core
      keymaps = {
        toggle_repl = "<leader>ro", -- toggles the repl open and closed.
        restart_repl = "<leader>rR", -- calls `IronRestart` to restart the repl
        send_motion = "<leader>rs",
        visual_send = "<leader>rv",
        send_file = "<leader>rg",
        send_line = "<leader>rl",
        send_paragraph = "<leader>rp",
        send_until_cursor = "<leader>ru",
        send_mark = "<leader>im",
        send_code_block = "<leader>rb",
        send_code_block_and_move = "<leader>rr",
        mark_motion = "<leader>mc",
        mark_visual = "<leader>mc",
        remove_mark = "<leader>md",
        cr = "<leader>r<cr>",
        interrupt = "<leader>r<space>",
        exit = "<leader>rq",
        clear = "<leader>rc",
      },
      -- If the highlight is on, you can change how it looks
      -- For the available options, check nvim_set_hl
      highlight = {
        italic = true,
      },
      ignore_blank_lines = true, -- ignore blank lines when sending visual select lines
    })
    -- vim.keymap.set('n', '<space>rf', '<cmd>IronFocus<cr>')
    -- vim.keymap.set('n', '<space>rh', '<cmd>IronHide<cr>')
  end,
}
