local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local completion = null_ls.builtins.completion

null_ls.setup({
	debug = false,
	sources = {
        formatting.stylua,
        formatting.eslint,
		formatting.prettier.with({ extra_args = {
            "--no-semi",
            "--single-quote",
            "--jsx-single-quote"}
        }),
		formatting.black,
		formatting.stylua,
        formatting.latexindent,
		diagnostics.flake8,
        diagnostics.eslint,
        completion.spell,
		--diagnostics.selene
	},
})
