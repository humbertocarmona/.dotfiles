--[[ vim.cmd.colorscheme 'jellybeans-nvim' ]]
--[[ vim.cmd.colorscheme 'sakura' ]]
--[[ vim.cmd.colorscheme 'ayu-mirage' ]]
--[[ vim.cmd.colorscheme 'kanagawa' ]]
--[[ vim.cmd.colorscheme 'carmona' ]]
vim.cmd.colorscheme 'catppuccin'
local colors = require('catppuccin.palettes.mocha')
vim.cmd.highlight { 'tabline', 'guifg=' .. colors.green, 'guibg=' .. colors.mantle }

