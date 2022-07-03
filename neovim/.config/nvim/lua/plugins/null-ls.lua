local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local completion = null_ls.builtins.completion

null_ls.setup({
	debug = false,
	sources = {
        formatting.eslint,
		formatting.prettier.with({ extra_args = {
            "--no-semi",
            "--single-quote",
            "--jsx-single-quote"}
        }),
        -- formatting.black.with({extra_args = {
        --           "--fast"
        -- }}),
		-- formatting.stylua,
        formatting.latexindent,
        formatting.autopep8.with({extra_args = {
            "--max-line-length=90"
        }}),
        diagnostics.flake8.with({extra_args={
             "--max-line-length=90"
        }}),
        diagnostics.eslint,
        diagnostics.markdownlint,
        diagnostics.fish,
        diagnostics.cppcheck,
        -- diagnostics.selene, 
        completion.spell,
        completion.luasnip,
	},
})
