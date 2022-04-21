local fn = vim.fn

-- Automatically install packer
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
	vim.cmd([[packadd packer.nvim]])
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
return packer.startup(function(use)
	-- My plugins here
	use("windwp/nvim-autopairs") -- Autopairs, integrates with both cmp and treesitter
	use("Pocco81/AutoSave.nvim")
    use("kyazdani42/nvim-web-devicons")
	use("wbthomason/packer.nvim") -- Have packer manage itself
	use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins
	use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
	use("numToStr/Comment.nvim") -- Easily comment stuff
	use("kyazdani42/nvim-tree.lua")
	use("akinsho/bufferline.nvim")
	use("moll/vim-bbye")
    use("nvim-lualine/lualine.nvim")
	-- use("akinsho/toggleterm.nvim")
	use("ahmedkhalf/project.nvim")
	use("lewis6991/impatient.nvim")
	use("lukas-reineke/indent-blankline.nvim")
	use("goolord/alpha-nvim")
	use("antoinemadec/FixCursorHold.nvim") -- This is needed to fix lsp doc highlight
	use("folke/which-key.nvim")
    use("jpalardy/vim-slime")
    use("folke/zen-mode.nvim")
    use("norcalli/nvim-colorizer.lua")
    use("chen244/csv-tools.lua")
    use("p00f/nvim-ts-rainbow")
	use("JuliaEditorSupport/julia-vim")
    use("lervag/vimtex")
    use("ap/vim-css-color")
	use("nathom/filetype.nvim")
    use("preservim/vim-markdown")
    use("iamcco/markdown-preview.nvim")
    use("junegunn/limelight.vim")


    -- Colorschemes
	use('xiyaowong/nvim-transparent')
    -- use("lunarvim/darkplus.nvim")
	use("Shatur/neovim-ayu")
    -- use("folke/tokyonight.nvim")
    -- use("wojciechkepka/vim-github-dark")
    -- use("nanotech/jellybeans.vim")
    use{'rktjmp/lush.nvim'}
    use{'metalelf0/jellybeans-nvim'}
    use{'numToStr/Sakura.nvim'}


    -- pywal is great! generated color paletes
    use("dylanaraps/wal.vim")



	-- Telescope
	use("nvim-telescope/telescope.nvim")


	-- LSP using nvim-cmp and luasnip
	use("neovim/nvim-lspconfig") -- enable native LSP
    use("hrsh7th/nvim-cmp") -- The completion plugin
	use("hrsh7th/cmp-nvim-lsp")  -- LSP source for bvim-cmp
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	use("L3MON4D3/LuaSnip") --snippet engine
	use("rafamadriz/friendly-snippets") -- some snippets for LuaSnip
	use("saadparwaiz1/cmp_luasnip") -- snippet completions

    -- LSP with CoC
	-- use("neovim/nvim-lspconfig") -- enable native LSP
    -- use('ms-jpq/coq_nvim')
    -- use('ms-jpq/coq.artifacts')
    -- use('ms-jpq/coq.thirdparty')

    use("williamboman/nvim-lsp-installer") -- language server installer
    use("jose-elias-alvarez/null-ls.nvim") -- formatters and linters
	-- use("tamago324/nlsp-settings.nvim") -- lang server settings defined in json

    -- Treesitter based highlighting
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("JoosepAlviste/nvim-ts-context-commentstring")


	-- Git
	use("lewis6991/gitsigns.nvim")
    use("kdheepak/lazygit.nvim")
	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
