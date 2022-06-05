if vim.fn.exists('g:vscode') == 0 then
    require "plugins"               -- lua/plugins.lua
    require "settings"                  -- lua/user/init.lua
    require "lsp"                   -- lua/lsp/init.lua
    require "settings.keymaps"          -- lua/user/keymaps.lua
else
	print('exists g:vscode')
end

