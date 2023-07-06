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
        -- ft = { "tex", "latex" },
    },

    {
        "GCBallesteros/vim-textobj-hydrogen",
        dependencies = {
            "kana/vim-textobj-user",
        },
    },
    {
        "luk400/vim-jukit",
        dependencies = {
            "tomtom/tcomment_vim",
        },
        config = function()
            vim.g.jukit_shell_cmd = "julia --project=./"
            -- Specifies the command used to start a shell in the output split.
            -- Can also be an absolute path. Can also be any other shell
            -- command, e.g. `R`, `julia`, etc. (note that output saving is only
            -- possible for ipython)

            vim.g.jukit_terminal = "kitty"
            -- Terminal to use. Can be one of '', 'kitty', 'vimterm', 'nvimterm'
            -- or 'tmux'. If '' is given then will try to detect terminal
            -- (though this might fail, in which case it simply defaults to
            -- 'vimterm' or 'nvimterm' - depending on the output of
            -- `has("nvim")`)

            vim.g.jukit_auto_output_hist = 0
            -- If set to 1, will create an autocmd with event `CursorHold` to
            -- show saved ipython output of current cell in output-history
            -- split. Might slow down (n)vim significantly, you can use `set
            -- updatetime=<number of milliseconds>` to control the time to wait
            -- until CursorHold events are triggered, which might improve
            -- performance if set to a higher number (e.g. `set
            -- updatetime=1000`).

            vim.g.jukit_use_tcomment = 0
            -- Whether to use tcomment plugin
            -- (https://github.com/tomtom/tcomment_vim) to comment out cell
            -- markers. If not, then cell markers will simply be prepended with
            -- `g:jukit_comment_mark`

            vim.g.jukit_comment_mark = "#"
            -- See description of `g:jukit_use_tcomment` above

            vim.g.jukit_mappings = 1
            -- If set to 0, none of the default function mappings (as specified
            -- further down) will be applied

            vim.g.jukit_mappings_ext_enabled = { "jl", "py", "ipynb" }
            -- String or list of strings specifying extensions for which the
            -- mappings will be created. For example,
            -- `vim.g.jukit_mappings_ext_enabled=['py', 'ipynb']` will enable
            -- the mappings only in `.py` and `.ipynb` files. Use
            -- `vim.g.jukit_mappings_ext_enabled='*'` to enable them for all
            -- files.

            vim.g.jukit_notebook_viewer = "jupyter-notebook"
            -- Command to open .ipynb files, by default jupyter-notebook is
            -- used. To use e.g. vs code instead, you could set this to
            -- `vim.g.jukit_notebook_viewer = 'code'`

            vim.g.jukit_convert_overwrite_default = -1
            -- Default setting when converting from .ipynb to .py or vice versa
            -- and a file of the same name already exists. Can be of [-1, 0, 1],
            -- where -1 means no default (i.e. you'll be prompted to specify
            -- what to do), 0 means never overwrite, 1 means always overwrite

            vim.g.jukit_convert_open_default = -1
            -- Default setting for whether the notebook should be opened after
            -- converting from .py to .ipynb. Can be of [-1, 0, 1], where -1
            -- means no default (i.e. you'll be prompted to specify what to do),
            -- 0 means never open, 1 means always open

            vim.g.jukit_file_encodings = "utf-8"
            -- Default encoding for reading and writing to files in the python
            -- helper functions

            vim.g.jukit_venv_in_output_hist = 1
            -- Whether to also use the provided terminal command for the output
            -- history split when starting the splits using the JukitOUtHist
            -- command. If 0, the provided terminal command is only used in the
            -- output split, not in the output history split.

            vim.g.jukit_highlight_markers = 1
            -- Whether to highlight cell markers or not. You can specify the
            -- colors of cell markers by putting e.g. `highlight
            -- jukit_cellmarker_colors guifg=#1d615a guibg=#1d615a ctermbg=22
            -- ctermfg=22` with your desired colors in your (neo)vim config.
            -- Make sure to define this highlight *after* loading a colorscheme
            -- in your (neo)vim config

            vim.g.jukit_enable_textcell_bg_hl = 1
            -- Whether to highlight background of textcells. You can specify the
            -- color by putting `highlight jukit_textcell_bg_colors
            -- guibg=#131628 ctermbg=0` with your desired colors in your
            -- (neo)vim config. Make sure to define this highlight group *after*
            -- loading a colorscheme in your (neo)vim config.

            vim.g.jukit_enable_textcell_syntax = 1
            -- Whether to enable markdown syntax highlighting in textcells

            -- vim.g.jukit_text_syntax_file = $VIMRUNTIME . '/syntax/' . 'markdown.vim'
            -- Syntax file to use for textcells. If you want to define your own syntax
            -- matches inside of text cells, make sure to include `containedin=textcell`.

            vim.g.jukit_hl_ext_enabled = "*"
            -- String or list of strings specifying extensions for which the
            -- relevant highlighting autocmds regarding marker-highlighting,
            -- textcell-highlighting, etc. will be created. For example,
            -- `vim.g.jukit_hl_extensions=['py', 'R']` will enable the defined
            -- highlighting options for `.py` and `.R` files. Use
            -- `vim.g.jukit_hl_extensions='*'` to enable them for all files and
            -- `vim.g.jukit_hl_extensions=''` to disable them completely

            vim.g.jukit_output_new_os_window = 0
            -- If set to 1, opens output split in new os-window. Can be used to
            -- e.g. write code in one kitty-os-window on your primary monitor
            -- while sending code to the shell which is in a seperate
            -- kitty-os-window on another monitor.

            vim.g.jukit_outhist_new_os_window = 0
            -- Same as `g:jukit_output_new_os_window`, only for
            -- output-history-split
        end,
    },
}
