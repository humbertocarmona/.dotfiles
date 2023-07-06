-- Helper function for transparency formatting
local alpha = function() return string.format("%x", math.floor(255 * vim.g.transparency or 0.8)) end

--vim.g.neovide_transparency = 0
--vim.g.transparency = 0.8
--vim.g.neovide_background_color = "#0f1117" .. alpha()
vim.opt.guifont = "Roboto Nerd Font Mono:h10"
vim.g.neovide_theme = "auto"
vim.g.neovide_cursor_trail_size = 0.
vim.g.neovide_cursor_animation_length = 0
vim.g.neovide_scroll_animation_length = 0
