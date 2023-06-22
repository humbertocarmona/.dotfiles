return {
    {
        "quarto-dev/quarto-nvim",
        ft = { "markdown", "quarto" },
        dependencies = {
            {
                "jmbuhr/otter.nvim",
                config = function()
                    require("otter.config").setup({
                        lsp = {
                            hover = {
                                border = require("misc.style").border,
                            },
                        },
                    })
                end,
            },
            {
                "quarto-dev/quarto-vim",
                ft = "quarto",
                dependencies = { "vim-pandoc/vim-pandoc-syntax" },
                -- note: needs additional vim highlighting enabled
                -- for markdown in treesitter.lua
            },
            "neovim/nvim-lspconfig",
        },
        config = function()
            -- conceal can be tricky because both
            -- the treesitter highlighting and the
            -- regex vim syntax files can define conceals
            --
            -- conceallevel
            -- 0		Text is shown normally
            -- 1		Each block of concealed text is replaced with one
            -- 		character.  If the syntax item does not have a custom
            -- 		replacement character defined (see |:syn-cchar|) the
            -- 		character defined in 'listchars' is used.
            -- 		It is highlighted with the "Conceal" highlight group.
            -- 2		Concealed text is completely hidden unless it has a
            -- 		custom replacement character defined (see
            -- 		|:syn-cchar|).
            -- 3		Concealed text is completely hidden.
            vim.opt.conceallevel = 1

            -- disable conceal in markdown/quarto
            vim.g["pandoc#syntax#conceal#use"] = false

            -- embeds are already handled by treesitter injectons
            vim.g["pandoc#syntax#codeblocks#embeds#use"] = false

            vim.g["pandoc#syntax#conceal#blacklist"] = { "codeblock_delim", "codeblock_start" }

            -- but allow some types of conceal in math reagions:
            -- a=accents/ligatures d=delimiters m=math symbols
            -- g=Greek  s=superscripts/subscripts
            vim.g["tex_conceal"] = "gm"

            require("quarto").setup({
                lspFeatures = {
                    enabled = true,
                    languages = { "r", "python", "julia" },
                    chunks = "curly", -- 'curly' or 'all'
                    diagnostics = {
                        enabled = true,
                        triggers = { "BufWrite" },
                    },
                    completion = {
                        enabled = true,
                    },
                },
            })
        end,
    },

    -- send code from python/r/qmd docuemts to the terminal
    -- thanks to tmux can be used for any repl
    -- like ipython, R, bash
    {
        "jpalardy/vim-slime",
        ft = { "python", "julia", "quarto", "markdown" },
    },
    -- {
    --     "klafyvel/vim-slime-cells",
    --     ft = { "julia" },
    -- },

    {
        "hanschen/vim-ipython-cell",
        ft = { "python", "julia" },
    },

    -- paste an image to markdown from the clipboard
    -- :PasteImg,
    {
        "ekickx/clipboard-image.nvim",
    },

    -- display images in the terminal!
    {
        "edluffy/hologram.nvim",
        config = function()
            -- require'hologram'.setup{
            --   auto_display = true
            -- }
        end,
    },

    {
        "ahmedkhalf/jupyter-nvim",
        config = function() require("jupyter-nvim").setup() end,
    },

    {
        "lervag/vimtex",
        ft = { "tex", "latex" },
        config = function()
            vim.g.vimtex_view_general_viewer = "okular"
            vim.g.vimtex_view_general_options = "--unique file:@pdf#src:@line@tex"
            vim.g.vimtex_view_method = "zathura"
            vim.g.vimtex_compiler_method = "latexmk"
        end,
    },

    {
        "GCBallesteros/vim-textobj-hydrogen",
        dependencies = {
            "kana/vim-textobj-user",
        },
    },
}
