local status_ok, treesitterconfs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    return
end

treesitterconfs.setup({
    -- A list of parser names, or "all"
    ensure_installed = {
        "bibtex",
        "c",
        "cpp",
        "cmake",
        "fish",
        "fortran",
        "java",
        "javascript",
        "json",
        "json5",
        "julia",
        "latex",
        "lua",
        "make",
        "markdown",
        "markdown_inline",
        "python",
        "sql",
        "toml",
        "vim",
        "yaml"
    },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = { 'markdown' },
    },
    indent = {
        enable = true,
    },
    sync_install = true,
    auto_install = true,
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
        },
    },
    textobjects = {
        select = {
            enable = true,
            lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
            keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ['af'] = '@function.outer',
                ['if'] = '@function.inner',
                ['ac'] = '@class.outer',
                ['ic'] = '@class.inner',
                ['ao'] = '@codechunk.outer',
                ['io'] = '@codechunk.inner',
            },
        },
        move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
                [']m'] = '@function.outer',
                [']c'] = '@codechunk.inner',
                [']]'] = '@class.outer',
            },
            goto_next_end = {
                [']M'] = '@function.outer',
                [']['] = '@class.outer',
            },
            goto_previous_start = {
                ['[m'] = '@function.outer',
                ['[c'] = '@codechunk.inner',
                -- ['[['] = '@class.outer',
            },
            goto_previous_end = {
                ['[M'] = '@function.outer',
                ['[]'] = '@class.outer',
            },
        },
    },
})
