return {
	settings = {

		Lua = {
			diagnostics = {
				-- Get the language server to recognize the `vim` global
                globals = { "vim", "awesome", "julia", "→", "awesome", "screen"},
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	},
}
