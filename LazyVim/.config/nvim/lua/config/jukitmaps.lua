vim.keymap.set("n", "<leader>os", ':lua require("jukit.splits").output()<CR>', { noremap = true })
--  Opens a new output window and executes the command specified in `g:jukit_shell_cmd`
vim.keymap.set("n", "<leader>ts", ':lua require("jukit.splits").term()<CR>', { noremap = true })
--  Opens a new output window without executing any command
vim.keymap.set("n", "<leader>hs", ':lua require("jukit.splits").history()<CR>', { noremap = true })
--  Opens a new output-history window, where saved ipython outputs are displayed
vim.keymap.set("n", "<leader>ohs", ':lua require("jukit.splits").output_and_history()<CR>', { noremap = true })
--  Shortcut for opening output terminal and output-history
vim.keymap.set("n", "<leader>hd", ':lua require("jukit.splits").close_history()<CR>', { noremap = true })
--  Close output-history window
vim.keymap.set("n", "<leader>od", ':lua require("jukit.splits").close_output_split()<CR>', { noremap = true })
--  Close output window

vim.keymap.set("n", "<leader>so", ':lua require("jukit.splits").show_last_cell_output(1)<CR>', { noremap = true })
--  Show output of current cell (determined by current cursor position) in output-history
--  window. Argument: Whether or not to reload outputs if cell id of outputs to display is
--  the same as the last cell id for which outputs were displayed
vim.keymap.set("n", "<leader>j", ':lua require("jukit.splits").out_hist_scroll(1)<CR>', { noremap = true })
--  Scroll down in output-history window. Argument: whether to scroll down (1) or up (0)
vim.keymap.set("n", "<leader>k", ':lua require("jukit.splits").out_hist_scroll(0)<CR>', { noremap = true })
--  Scroll up in output-history window. Argument: whether to scroll down (1) or up (0)
vim.keymap.set("n", "<leader>ah", ':lua require("jukit.splits").toggle_auto_hist()<CR>', { noremap = true })
--  Create/delete autocmd for displaying saved output on CursorHold. Also, see explanation
--  for `g:jukit_auto_output_hist`
vim.keymap.set("n", "<leader>sl", ':lua require("jukit.layouts").set_layout()<CR>', { noremap = true })
--  Apply layout (see `g:jukit_layout`) to current splits - NOTE: it is expected that this
--  function is called from the main file buffer/split

-- sending code
vim.keymap.set("n", "<leader><space>", ':lua require("jukit.send").section(0)<CR>', { noremap = true })
--  Send code within the current cell to output split (also saves the output if ipython is
--  used and `g:jukit_save_output==1`). Argument: if 1, will move the cursor to the next
--  cell below after sending the code to the split, otherwise cursor position stays the
--  same.
vim.keymap.set("n", "<CR>", ':lua require("jukit.send").line()<CR>', { noremap = true })
--  Send current line to output split
vim.keymap.set("v", "<CR>", ':<C-U>lua require("jukit.send").selection()<CR>', { noremap = true })
--  Send visually selected code to output split
vim.keymap.set("n", "<leader>cc", ':lua require("jukit.send").until_current_section()<CR>', { noremap = true })
--  Execute all cells until the current cell
vim.keymap.set("n", "<leader>all", ':lua require("jukit.send").all()<CR>', { noremap = true })
--  Execute all cells
--
-- cells
vim.keymap.set("n", "<leader>co", ':lua require("jukit.cells").create_below(0)<CR>', { noremap = true })
--  Create new code cell below. Argument: Whether to create code cell (0) or markdown cell (1)
vim.keymap.set("n", "<leader>cO", ':lua require("jukit.cells").create_above(0)<CR>', { noremap = true })
--  Create new code cell above. Argument: Whether to create code cell (0) or markdown cell (1)
vim.keymap.set("n", "<leader>ct", ':lua require("jukit.cells").create_below(1)<CR>', { noremap = true })
--  Create new textcell below. Argument: Whether to create code cell (0) or markdown cell (1)
vim.keymap.set("n", "<leader>cT", ':lua require("jukit.cells").create_above(1)<CR>', { noremap = true })
--  Create new textcell above. Argument: Whether to create code cell (0) or markdown cell (1)
vim.keymap.set("n", "<leader>cd", ':lua require("jukit.cells").delete()<CR>', { noremap = true })
--  Delete current cell
vim.keymap.set("n", "<leader>cs", ':lua require("jukit.cells").split()<CR>', { noremap = true })
--  Split current cell (saved output will then be assigned to the resulting cell above)
vim.keymap.set("n", "<leader>cM", ':lua require("jukit.cells").merge_above()<CR>', { noremap = true })
--  Merge current cell with the cell above
vim.keymap.set("n", "<leader>cm", ':lua require("jukit.cells").merge_below()<CR>', { noremap = true })
--  Merge current cell with the cell below
vim.keymap.set("n", "<leader>ck", ':lua require("jukit.cells").move_up()<CR>', { noremap = true })
--  Move current cell up
vim.keymap.set("n", "<leader>cj", ':lua require("jukit.cells").move_down()<CR>', { noremap = true })
--  Move current cell down
vim.keymap.set("n", "<leader>J", ':lua require("jukit.cells").jump_to_next_cell()<CR>', { noremap = true })
--  Jump to the next cell below
vim.keymap.set("n", "<leader>K", ':lua require("jukit.cells").jump_to_previous_cell()<CR>', { noremap = true })
--  Jump to the previous cell above
vim.keymap.set("n", "<leader>ddo", ':lua require("jukit.cells").delete_outputs(0)<CR>', { noremap = true })
--  Delete saved output of current cell. Argument: Whether to delete all saved outputs (1)
--  or only saved output of current cell (0)
vim.keymap.set("n", "<leader>dda", ':lua require("jukit.cells").delete_outputs(1)<CR>', { noremap = true })
--  Delete saved outputs of all cells. Argument: Whether to delete all saved outputs (1)
--  or only saved output of current cell (0)

-- ipynb conversion
--
vim.keymap.set("n", "<leader>np", ':lua require("jukit.convert").notebook_convert("jupyter-notebook")<CR>')

vim.keymap.set("n", "<leader>ht", ':lua require("jukit.convert").save_nb_to_file(0, 1, "html")<CR>', { noremap = true })
--  Convert file to html (including all saved outputs) and open it using the command
--  specified in `g:jukit_html_viewer'. If `g:jukit_html_viewer` is not defined, then will
--  default to `g:jukit_html_viewer='xdg-open'`. Arguments: 1.: Whether to rerun all cells
--  when converting 2.: Whether to open it after converting 3.: filetype to convert to
vim.keymap.set("n", "<leader>rht", ':lua require("jukit.convert").save_nb_to_file(1, 1, "html")<CR>')
--  same as above, but will (re-)run all cells when converting to html
vim.keymap.set("n", "<leader>pd", ':lua require("jukit.convert").save_nb_to_file(0, 1, "pdf")<CR>', { noremap = true })
--  Convert file to pdf (including all saved outputs) and open it using the command
--  specified in `g:jukit_pdf_viewer'. If `g:jukit_pdf_viewer` is not defined, then will
--  default to `g:jukit_pdf_viewer='xdg-open'`. Arguments: 1.: Whether to rerun all cells
--  when converting 2.: Whether to open it after converting 3.: filetype to convert to.
--  NOTE: If the function doesn't work there may be issues with your nbconvert or latex
--  version - to debug, try converting to pdf using `jupyter nbconvert --to pdf
--  --allow-errors --log-level='ERROR' --HTMLExporter.theme=dark </abs/path/to/ipynb> &&
--  xdg-open </abs/path/to/pdf>` in your terminal and check the output for possible
--  issues.
vim.keymap.set("n", "<leader>rpd", ':lua require("jukit.convert").save_nb_to_file(1, 1, "pdf")<CR>', { noremap = true })
--  same as above, but will (re-)run all cells when converting to pdf. NOTE: If the
--  function doesn't work there may be issues with your nbconvert or latex version - to
--  debug, try converting to pdf using `jupyter nbconvert --to pdf --allow-errors
--  --log-level='ERROR' --HTMLExporter.theme=dark </abs/path/to/ipynb> && xdg-open
--  </abs/path/to/pdf>` in your terminal and check the output for possible issues.
