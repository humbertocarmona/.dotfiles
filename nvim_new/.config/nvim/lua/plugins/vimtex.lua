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
        "-pdf",
        "-interaction=nonstopmode",
        "-shell-escape",
        "-synctex=1",
        "-file-line-error",
        -- "-verbose",
        -- "-lualatex",
      },
    }
    vim.g.vimtex_compiler_method = "latexmk"
    vim.g.vimtex_compiler_latexmk_engines = {
      _ = "-lualatex",
    }

    -- 🔑 Let vimtex handle zathura + nvr automatically
    vim.g.vimtex_view_method = "zathura"

    -- ❌ REMOVE / COMMENT these for now:
    -- vim.g.vimtex_view_general_viewer = ...
    -- vim.g.vimtex_view_general_options = ...
    -- vim.g.vimtex_view_zathura_options = ...

    vim.g.vimtex_quickfix_open_on_warning = 0
  end,
}
