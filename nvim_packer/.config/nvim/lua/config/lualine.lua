local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

lualine.setup({
	options = {
		section_separators = {
			left = "",
			right = "",
		},
		component_separators = {
			left = "|",
			right = "|",
		},
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "buffers" },
		lualine_c = { "diagnostics", "status"},
		lualine_x = { "searchcount", "encoding", "fileformat", "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {},
})
