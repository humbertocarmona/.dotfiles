local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd('packadd packer.nvim')
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

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
return packer.startup(
    function(use)
        local lua_path = function(name)
            return string.format("require'plugins.%s'", name)
        end

        use { 'wbthomason/packer.nvim' } -- Have packer manage itself

        use { 'neovim/nvim-lspconfig' ,
            requires = {
                { 'williamboman/nvim-lsp-installer' }, -- language server installer

                -- code completion
                { 'hrsh7th/nvim-cmp' }, -- The completion plugin
                { 'hrsh7th/cmp-buffer' },
                { 'hrsh7th/cmp-path' },
                { 'hrsh7th/cmp-cmdline' },
                { 'hrsh7th/cmp-nvim-lsp' },
                { 'hrsh7th/cmp-nvim-lua' },
                { 'saadparwaiz1/cmp_luasnip' },
                { 'f3fora/cmp-spell' },

                -- Snippets
                { 'L3MON4D3/LuaSnip' }, --snippet engine
                -- { 'rafamadriz/friendly-snippets' }, -- some snippets for LuaSnip


                -- autopairs
                -- { 'windwp/nvim-autopairs', config = lua_path"autopairs" },
                { 'jiangmiao/auto-pairs'},
                { 'tpope/vim-surround' },
                -- other
                { 'jose-elias-alvarez/null-ls.nvim' }, -- formatters and linters
                { 'onsails/lspkind-nvim' },
                -- { 'weilbith/nvim-code-action-menu', cmd = 'CodeActionMenu' },

            }
        }

        -- use { 'VonHeikemen/lsp-zero.nvim', config = lua_path"lsp-zero" }

        -- Treesitter based highlighting
        use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate", config = lua_path"treesitter" }
        use { 'p00f/nvim-ts-rainbow' }
        use { 'lukas-reineke/indent-blankline.nvim' }
        use { 'JoosepAlviste/nvim-ts-context-commentstring' }
        use { 'lewis6991/nvim-treesitter-context' }
        use { 'numToStr/Comment.nvim', config = lua_path"comment" }

        -- syntax
        use { 'JuliaEditorSupport/julia-vim' }
        use { 'ap/vim-css-color' }
        use { 'lervag/vimtex' }
        use { 'preservim/vim-markdown' }
        use { 'iamcco/markdown-preview.nvim' }
        use { 'chrisbra/csv.vim', config = lua_path"csv" }
        -- use { 'nathom/filetype.nvim' }

        -- icons
        use { 'kyazdani42/nvim-web-devicons' }
        use { 'ryanoasis/vim-devicons' }

        -- status and buffer lines
        use { 'akinsho/bufferline.nvim', config = lua_path"bufferline" }
        use { 'nvim-lualine/lualine.nvim', config = lua_path"lualine" }

        -- Telescope
        use { 'nvim-lua/popup.nvim' }
        use { 'nvim-lua/plenary.nvim' }
        use { 'nvim-telescope/telescope.nvim', config= lua_path"telescope" }
        use { 'nvim-telescope/telescope-fzy-native.nvim' }
        use { 'nvim-telescope/telescope-project.nvim' }
        use { 'nvim-telescope/telescope-dap.nvim' }
        -- use { 'sudormrfbin/cheatsheet.nvim' }
        -- explorer
        use { 'kyazdani42/nvim-tree.lua', config=lua_path"nvim-tree" }

        -- Color
        use { 'crivotz/nvim-colorizer.lua', config = lua_path"colorizer" }
        use { 'lpinilla/vim-codepainter' }

        -- Git
        use { 'lewis6991/gitsigns.nvim', config=lua_path"gitsigns" }
        use { 'kdheepak/lazygit.nvim' }


        -- Colorschemes
        use { 'numToStr/Sakura.nvim' }
        use { 'humbertocarmona/kanagawa-mod.nvim' }
        use { 'xiyaowong/nvim-transparent', config = lua_path"transparent" }
        -- use { 'Shatur/neovim-ayu' }
        use { 'wojciechkepka/vim-github-dark' }
        -- use { 'metalelf0/jellybeans-nvim' }
        -- use { 'rebelot/kanagawa.nvim' }
        -- use { 'rktjmp/lush.nvim' }
        -- pywal is great! generated color paletes
        -- use { 'dylanaraps/wal.vim' }

        -- ide
        use { 'goolord/alpha-nvim', config = lua_path"alpha"}
        use { 'folke/which-key.nvim', config = lua_path"whichkey" }
        -- use { 'hanschen/vim-ipython-cell', requires = {'jpalardy/vim-slime'},
        --      config = lua_path"slime"}
        use { 'bfredl/nvim-ipy', config = lua_path"nvim-ipy" }

        -- My plugins here
        use { 'Pocco81/AutoSave.nvim', config = lua_path"autosave" }
        use { 'ggandor/lightspeed.nvim',
            requires = {'tpope/vim-repeat'},
            config = lua_path"lightspeed" }
        use { 'fedepujol/move.nvim' } -- keymaps
        use { 'lewis6991/impatient.nvim', config = lua_path"impatient" }
        use { 'folke/zen-mode.nvim',
            requires ={ 'folke/twilight.nvim' },
            config = lua_path"zen-mode" }
        use { 'antoinemadec/FixCursorHold.nvim' } -- This is needed to fix lsp doc highlight
        use { 'tversteeg/registers.nvim'}

        -- Automatically set up your configuration after cloning packer.nvim
        -- Put this at the end after all plugins
        if PACKER_BOOTSTRAP then
            require("packer").sync()
        end
    end
)
