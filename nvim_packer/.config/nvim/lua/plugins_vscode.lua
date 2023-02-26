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
    local lua_path = function(name)
        return string.format("require'user.%s'", name)
    end
    use({ "wbthomason/packer.nvim" }) -- Have packer manage itself

    use { 'echasnovski/mini.nvim',
        branch = 'stable',
        config = function()
            require('mini.surround').setup({})
        end
    }
    ---------------------------------------------------------------
    use({ "lukas-reineke/indent-blankline.nvim", config = lua_path("indentline") })
    use({ "numToStr/Comment.nvim", config = lua_path("comment") })

    use({ "ap/vim-css-color" }) -- color parenthesis

    use { 'nathom/filetype.nvim' }

    -- Telescope
    use({ "nvim-lua/popup.nvim" })
    use({ "nvim-telescope/telescope.nvim", config = lua_path("telescope") })

    use({ "nvim-telescope/telescope-file-browser.nvim"})
    use({ "nvim-telescope/telescope-fzy-native.nvim" })
    use({ "nvim-telescope/telescope-project.nvim" })
    use({ "nvim-telescope/telescope-symbols.nvim" })
    use({ "sudormrfbin/cheatsheet.nvim" })

    use({ "fedepujol/move.nvim" })
    use({ "anuvyklack/pretty-fold.nvim", config = lua_path("pretty-fold") })
    use({ "lewis6991/impatient.nvim", config = lua_path("impatient") })
    use({ "antoinemadec/FixCursorHold.nvim" }) -- This is needed to fix lsp doc highlight

    -- Automatically set up your configuration after cloning packer.nvim
    if packer_bootstrap then
        require("packer").sync()
    end
end)
