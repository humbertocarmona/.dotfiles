return {
  "lervag/vimtex",
  ft = { "tex", "latex" },
  keys = {
    { "<leader>pv", "<cmd>VimtexView<CR>", desc = "View PDF (VimTeX)" },
    { "<leader>pl", "<cmd>VimtexCompile<CR>", desc = "Compile (latexmk)" },
  },
  config = function()
    vim.g.vimtex_compiler_latexmk = {
      build_dir = "",
      callback = 1,
      continuous = 1,
      executable = "latexmk",
      options = {
        "-shell-escape",
        "-verbose",
        "-file-line-error",
        "-synctex=1",
        "-interaction=nonstopmode",
        "-lualatex",
      },
    }
    vim.g.vimtex_compiler_method = "latexmk"
    vim.g.vimtex_compiler_latexmk_engines = {
      _ = "-lualatex",
    }
    -- vim.g.vimtex_view_method = "okular"
    -- vim.g.vimtex_view_general_viewer = "okular"
    -- vim.g.vimtex_view_general_options = "--unique file:@pdf#src:@line@tex"
    vim.g.vimtex_view_method = "zathura"
    vim.g.vimtex_view_general_viewer = "zathura"
    vim.g.vimtex_view_general_options =
      [[--synctex-forward @line:@col:@tex --synctex-editor-command 'nvr --remote-silent +%{line} %{input}' @pdf]]
    vim.g.vimtex_quickfix_open_on_warning = 0
  end,
}
