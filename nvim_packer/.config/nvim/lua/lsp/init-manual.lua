local ok, lspconfig = pcall(require, "lspconfig")
if not ok then
	return
end

--[[ local cmp_nvim_lsp = require("cmp_nvim_lsp") ]]

local function create_capabilities()
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities.textDocument.completion.completionItem.snippetSupport = true
	capabilities.textDocument.completion.completionItem.preselectSupport = true
	capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
	capabilities.textDocument.completion.completionItem.deprecatedSupport = true
	capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
	capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
	capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
	capabilities.textDocument.completion.completionItem.resolveSupport = {
		properties = { "documentation", "detail", "additionalTextEdits" },
	}
	capabilities.textDocument.completion.completionItem.documentationFormat = { "markdown" }
	capabilities.textDocument.codeAction = {
		dynamicRegistration = true,
		codeActionLiteralSupport = {
			codeActionKind = {
				valueSet = (function()
					local res = vim.tbl_values(vim.lsp.protocol.CodeActionKind)
					table.sort(res)
					return res
				end)(),
			},
		},
	}
	return capabilities
end

-- signs
local signs = {
	{ name = "DiagnosticSignError", text = " " },
	{ name = "DiagnosticSignWarn", text = " " },
	{ name = "DiagnosticSignHint", text = " " },
	{ name = "DiagnosticSignInfo", text = " " },
}
for _, sign in ipairs(signs) do
	vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

local config = {
	-- disable virtual text
	virtual_text = true,
	-- show signs
	signs = {
		active = signs,
	},
	update_in_insert = true,
	underline = false,
	severity_sort = true,
	float = {
		focusable = false,
		style = "minimal",
		border = "rounded",
		source = "always",
		header = "",
		prefix = "",
	},
}
vim.diagnostic.config(config)

-- handlers
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
-- disable virtual text (recommended for julia)
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	virtual_text = false,
	underline = false,
	signs = true,
	update_in_insert = false,
})
local function Lsp_highlight_document(client)
	-- Set autocommands conditional on server_capabilities
	if client.server_capabilities.document_highlight then
		vim.api.nvim_exec(
			[[
            augroup lsp_document_highlight
            autocmd! * <buffer>
            autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
            autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
            augroup END
        ]],
			false
		)
	end
end

local on_attach = function(client, bufnr)
	Lsp_highlight_document(client)
end

local servers = {
	pylsp = {
		settings = {
			pylsp = {
				plugins = {
					pycodestyle = {
						maxLineLength = 110,
					},
					autopep8 = {
						enabled = true,
					},
					flake8 = {
						enabled = true,
						maxLineLength = 110,
					},
					pyflakes = {
						enabled = false,
					},
					rope_completion = {
						enabled = true,
					},
					yapf = {
						enabled = false,
					},
				},
			},
		},
	},
	sumneko_lua = {},
	clangd = {},
	jsonls = {},
	ltex = {},
	julials = {
		cmd = {
			"julia",
			"--startup-file=yes",
			"--history-file=no",
			vim.fn.expand("~/.config/nvim/lua/lsp/lsp.jl"),
		},
		settings = {
			julia = {
				symbolCacheDownload = true,
				lint = {
					missingrefs = "all",
					iter = true,
					lazy = false,
					modname = true,
				},
			},
		},
	},
}

for lsp, setup in pairs(servers) do
	setup.capabilities = create_capabilities()
	setup.on_attach = on_attach
	--setup.capabilities = require("cmp_nvim_lsp").default_capabilities(setup.capabilities)
	if lsp == "julials" then
		setup.capabilities.textDocument.completion.completionItem.preselectSupport = true
		setup.capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
		setup.capabilities.textDocument.completion.completionItem.deprecatedSupport = true
		setup.capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
		setup.capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
		setup.capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
		setup.capabilities.textDocument.completion.completionItem.resolveSupport = {
			properties = { "documentation", "detail", "additionalTextEdits" },
		}
		setup.capabilities.textDocument.completion.completionItem.documentationFormat = { "markdown" }
		setup.capabilities.textDocument.codeAction = {
			dynamicRegistration = true,
			codeActionLiteralSupport = {
				codeActionKind = {
					valueSet = (function()
						local res = vim.tbl_values(vim.lsp.protocol.CodeActionKind)
						table.sort(res)
						return res
					end)(),
				},
			},
		}
	end
	-- vim.lsp.set_log_level("debug")
	lspconfig[lsp].setup(setup)
end

