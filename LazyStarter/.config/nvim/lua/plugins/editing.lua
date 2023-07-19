return {
    { "folke/flash.nvim", enabled = false },
    {
        "echasnovski/mini.surround",
        opts = {
            mappings = {
                add = "sa", -- Add surrounding in Normal and Visual modes
                delete = "sd", -- Delete surrounding
                find = "sf", -- Find surrounding (to the right)
                find_left = "sF", -- Find surrounding (to the left)
                highlight = "sh", -- Highlight surrounding
                replace = "sr", -- Replace surrounding
                update_n_lines = "sn", -- Update `n_lines`
            },
        },
    },
    {
        "lervag/vimtex",
        ft = { "tex", "latex" },
        keys = {
            { "<leader>cc", ":VimtexCompile<cr>", desc = "VimtexCompile" },
            { "<leader>cv", ":VimtexView<cr>", desc = "VimtexView" },
        },
        config = function()
            vim.g.vimtex_view_method = "zathura"
            vim.g.vimtex_compiler_method = "latexmk"

            vim.g.vimtex_mappings_enabled = 1
            vim.g.tex_indent_brace = 0
            vim.g.tex_indent_items = 0
            vim.g.tex_flavor = "latex"
            vim.g.vimtex_quickfix_enabled = 0
            vim.g.vimtex_context_pdf_viewer = "okular"
        end,
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = { "kdheepak/cmp-latex-symbols" },
        opts = function(_, opts)
            local cmp = require("cmp")
            opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "latex_symbols" } }))
        end,
    },
}
