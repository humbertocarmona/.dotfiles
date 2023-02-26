local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local packer_bootstrap

if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https;//github.com/wbthomason/packer.nvim",
        install_path,
    })
    print("Installing packer close and reopen Neovim...")
    vim.cmd("packadd packer.nvim")
end
-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.api.nvim_create_augroup("packer_user_config", {clear = true})
vim.api.nvim_create_autocmd({"BufWritePost"},{
    pattern = {'plugins.lua'},
    command = 'source <afile> | PackerSync'
})

--vim.cmd([[
-- augroup packer_user_config
-- autocmd!
-- autocmd BufWritePost plugins.lua source <afile> | PackerSync
-- augroup end
--]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init({
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "rounded" })
        end,
    },
})

-- Install your plugins here
return packer.startup(function(use)
    local lua_path = function(name)
        return string.format("require'config.%s'", name)
    end
    use({ "wbthomason/packer.nvim" }) -- Have packer manage itself

    -- some requirements -----------------------------------------
    use({ "kyazdani42/nvim-web-devicons" })
    use({ "ryanoasis/vim-devicons" })
    use({ "nvim-lua/plenary.nvim" })
    --[[ use({ "jose-elias-alvarez/null-ls.nvim", config = lua_path("null-ls") }) ]]
    --------------------------------------------------------------


    -- mason (lsp install) ---------------------------------------
    -- nvim-lspconfig.nvim
    -- need to keep this order:
    -- mason.nvim
    -- mason.mason-lspconfig.nvim
    use({ 'VonHeikemen/lsp-zero.nvim' })

    use({ "neovim/nvim-lspconfig",})

    -- mason itself
    use({ "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    })

    -- mason lsp config
    use({ "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup()
        end
    })
    -- requirements for nvim-lspconfig ----------------------------
    use({ "catppuccin/nvim", as = "catppuccin" })
    use({ "RishabhRD/popfix" })
    use({ "RishabhRD/nvim-lsputils" })
    use({ "folke/lsp-colors.nvim" })

    -- lsp statis
    use({ "nvim-lua/lsp-status.nvim",
        config = function()
            require("lsp-status").register_progress()
        end,
    })

    --pandoc
    use({ 'vim-pandoc/vim-pandoc-syntax', requires = { 'vim-pandoc/vim-pandoc' } })

    --quarto
    use({ 'quarto-dev/quarto-nvim',
        requires = {
            { 'jmbuhr/otter.nvim', },
            { 'quarto-dev/quarto-vim',
                ft = 'quarto',
                dependencies = { 'vim-pandoc/vim-pandoc-syntax' },
                -- note: needs additional vim highlighting enabled
                -- for markdown in treesitter.lua
            },
            { 'neovim/nvim-lspconfig' }
        },
        config = lua_path('quarto')
    })


    -- paste an image to markdown from the clipboard
    -- :PasteImg,
    use({ 'ekickx/clipboard-image.nvim' })


    -- trouble 
    use({ 'folke/trouble.nvim',
        requires = 'kyazdani42/nvim-web-devicons',
        config = lua_path('trouble'),
    }) -- pretty list of diagnostics

    -- Snippets
    use({ 'L3MON4D3/LuaSnip', config = lua_path('luasnip') }) --snippet engine
    use({ 'rafamadriz/friendly-snippets' }) -- some snippets for LuaSnip

    -- code completion
    use({ 'hrsh7th/nvim-cmp',
        requires = {
            { 'f3fora/cmp-spell' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-cmdline' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },
            { 'hrsh7th/cmp-path' },
            { 'jmbuhr/cmp-pandoc-references' },
            { 'kdheepak/cmp-latex-symbols' },
            { 'onsails/lspkind-nvim',        config = lua_path('lspkind-nvim') },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'windwp/nvim-autopairs',       config = lua_path('autopairs') },
            { 'KadoBOT/cmp-plugins',
                config = function()
                    require('cmp-plugins').setup({
                        files = { 'plugins.lua' } -- Recommended: use static filenames or partial paths
                    })
                end,
            },
        },
        config = lua_path('nvim-cmp'),
    })

    -- Mini -------------------------------------------------------
    -- h: mini.surround
    -- saiw(  add  (sa) innerword (iw) parethesis ('(' or ')')
    -- saiwi for interactive
    -- sr"' replace " by '
    -- sh} hoghlight
    use { 'echasnovski/mini.nvim',
        branch = 'stable',
        config = function()
            require('mini.surround').setup({})
        end
    }

    -- DAP debugging ...
    ---------------------------------------------------------------
    use({ "mfussenegger/nvim-dap" })
    use({ "mfussenegger/nvim-dap-python" })
    use({ "mfussenegger/nvim-dap-ui" })
    use({ "nvim-telescope/telescope-dap.nvim" })
    use({ "theHamsta/nvim-dap-virtual-text" })

    -- Treesitter based highlighting
    use({ 'nvim-treesitter/nvim-treesitter',
        requires = {
            { "p00f/nvim-ts-rainbow" },
            { "JoosepAlviste/nvim-ts-context-commentstring" },
            { "lewis6991/nvim-treesitter-context" },
            { "mechatroner/rainbow_csv",
                config = function()
                    require("nvim-treesitter.configs").setup({
                        rainbow = {
                            -- Setting colors
                            colors = {
                                "#ffffff",
                                "#bbbbbb",
                                "#ffffff",
                                "#bbbbbb",
                            },
                            -- Term colors
                            termcolors = {
                                -- Term colors here
                            },
                        },
                    })
                end,
            },
            { 'nvim-treesitter/nvim-treesitter-textobjects' },
            { 'nvim-treesitter/playground' }
        },
        run = function()
            require("nvim-treesitter.install").update({ with_sync = true })
        end,
        config = lua_path("treesitter"),
    })

    use({ "lukas-reineke/indent-blankline.nvim", config = lua_path("indentline") })

    use({ "numToStr/Comment.nvim", config = lua_path("comment") })

    -- syntax
    use({ "JuliaEditorSupport/julia-vim",
        config = function()
            vim.g.latex_to_unicode_tab = "off"
        end,
    })

    use({ "ap/vim-css-color" }) -- color parenthesis

    use({ "xuhdev/vim-latex-live-preview" })

    use({ "iamcco/markdown-preview.nvim" })

    use { 'nathom/filetype.nvim', config = lua_path("filetype") }

    -- status and buffer lines
    use({ "nvim-lualine/lualine.nvim",
        requires = { "kyazdani42/nvim-web-devicons", opt = true },
        config = lua_path("lualine"),
    })
    use({ "famiu/bufdelete.nvim" })

    -- Telescope
    use({ "nvim-lua/popup.nvim" })
    use({ "nvim-telescope/telescope.nvim", config = lua_path("telescope") })
    use({ "nvim-telescope/telescope-fzy-native.nvim" })
    --use({ "nvim-telescope/telescope-project.nvim" })
    use({ "nvim-telescope/telescope-symbols.nvim" })
    use({ "nvim-telescope/telescope-file-browser.nvim" })
    use({ "sudormrfbin/cheatsheet.nvim" })

    use({ "simrat39/symbols-outline.nvim",
        config = function()
            require("symbols-outline").setup()
        end
    })


    -- explorer
    use({ "kyazdani42/nvim-tree.lua", config = lua_path("nvim-tree") })
    use({ "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        },
    })
    -- Git
    use({ "lewis6991/gitsigns.nvim", config = lua_path("gitsigns") })
    use({ "kdheepak/lazygit.nvim" })

    -- Color
    --[[ use({ "crivotz/nvim-colorizer.lua", config = lua_path("colorizer") }) ]]
    use({ "norcalli/nvim-colorizer.lua",
        config = function()
            require 'colorizer'.setup {
                css = { css_fn = true, css = true },
                'javascript',
                'html',
                'r',
                'rmd',
                'qmd',
                'markdown',
                'python'
            }
        end
    })


    use({ "lpinilla/vim-codepainter" })

    -- Colorschemes
    use({ "humbertocarmona/carmona-nvim" })
    use({ "xiyaowong/nvim-transparent", config = lua_path("transparent") })
    use({ "Shatur/neovim-ayu" })
    -- use({ 'wojciechkepka/vim-github-dark' })
    -- use({ "dylanaraps/wal.vim" }) -- use with pywal

    -- ide
    use({ "goolord/alpha-nvim", config = lua_path("alpha") })
    use({ "akinsho/toggleterm.nvim", tag = "*", config = lua_path("toggleterm") })
    use({ "folke/which-key.nvim" })
    use({ "klafyvel/vim-slime-cells",
        requires = { { "jpalardy/vim-slime" } },
        ft = { "julia", "python" },
        config = function()
            if vim.fn.getenv("TERM_PROGRAM") == "tmux" then
                vim.g.slime_target = "tmux"
                vim.g.slime_cell_delimiter = "^\\s*#\\s*%%"
                vim.g.slime_default_config = { socket_name = "default", target_pane = "{last}" }
                vim.g.slime_dont_ask_default = 1
                vim.g.slime_preserve_curpos = 0
                vim.g.slime_no_mappings = 1
                vim.g.slime_paste_file = "/home/humberto/.slime_paste"
                vim.g.slime_python_ipython = 1
                vim.g.slime_bracketed_paste = 1
            else
                vim.g.slime_target = "screen"
                vim.g.slime_cell_delimiter = "^\\s*#\\s*%%"
                vim.g.slime_paste_file = "/home/humberto/.slime_paste"
                vim.g.slime_preserve_curpos = 0
                vim.g.slime_no_mappings = 1
                vim.g.slime_python_ipython = 1
                vim.g.slime_bracketed_paste = 1
            end
        end,
    })
    ---------------------------------------------------------------------------
    use({ "fedepujol/move.nvim" })
    -- use({ "anuvyklack/pretty-fold.nvim", config = lua_path("pretty-fold") })
    use({ "lewis6991/impatient.nvim", config = lua_path("impatient") })

    use({ "folke/zen-mode.nvim",
        requires = { "folke/twilight.nvim" },
        config = lua_path("zen-mode"),
    })

    use({ "rcarriga/nvim-notify",
        config = function()
            require("notify").setup({
                background_colour = "#000000",
            })
        end
    })

    use({ "antoinemadec/FixCursorHold.nvim" }) -- This is needed to fix lsp doc highlight

    -- Automatically set up your configuration after cloning packer.nvim
    if packer_bootstrap then
        require("packer").sync()
    end
end)
