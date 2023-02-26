local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
	return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local completion = null_ls.builtins.completion

null_ls.setup({
	debug = false,
	sources = {
		null_ls.builtins.code_actions.gitsigns,
		formatting.eslint,
		formatting.prettier.with({
			extra_args = {
				"--no-semi",
				"--single-quote",
				"--jsx-single-quote",
			},
		}),
		formatting.yapf.with({ extra_args = {
			"--style=/home/humberto/.style.yapf",
		} }),
		formatting.stylua,
		formatting.latexindent,
		formatting.clang_format,
		formatting.jq,
		--[[ diagnostics.eslint, ]]
		--[[ diagnostics.fish, ]]
		--[[ diagnostics.chktex, ]]
		--[[ diagnostics.jsonlint, ]]
		completion.luasnip,
	},
})
