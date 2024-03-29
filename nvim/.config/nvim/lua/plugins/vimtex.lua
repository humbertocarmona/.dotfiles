return {
    "lervag/vimtex",
    ft = { "tex", "latex" },
    -- keys = {
    --     { "<leader>cc", ":VimtexCompile<cr>", desc = "VimtexCompile" },
    --     { "<leader>cv", ":VimtexView<cr>", desc = "VimtexView" },
    -- },
    config = function()
        vim.g.vimtex_view_method = "zathura"
        vim.g.vimtex_compiler_method = "latexmk"
        --vim.g.vimtex_compiler_method = "nvr"
        vim.g.vimtex_mappings_enabled = 1
        vim.g.tex_indent_brace = 0
        vim.g.tex_indent_items = 0
        vim.g.tex_flavor = "latex"
        vim.g.vimtex_quickfix_enabled = 1
        vim.g.vimtex_context_pdf_viewer = "okular"
    end,
}
