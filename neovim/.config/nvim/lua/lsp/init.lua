local lspconfig = require('lspconfig')
local cmp_nvim_lsp = require('cmp_nvim_lsp')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true


--
-- lspconfig.ccls.setup{
--     init_options = {documentFormatting = true},
--     settings = {
--         rootMarkers = {".ccls",".git/"},
--         languages = {
--             lua = {
--                 {formatCommand = "lua-format -i", formatStdin = true}
--             }
--         }
--     },
--     capabilities = cmp_nvim_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- }
--
lspconfig.pylsp.setup{
     capabilities = cmp_nvim_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities())
}
--
lspconfig.julials.setup{
     capabilities = cmp_nvim_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities())
}
--
-- lspconfig.tsserver.setup{
--     capabilities = cmp_nvim_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- }
--
-- lspconfig.jsonls.setup{
--     commands = {
--         Format = {
--             function()
--                 vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$"),0})
--             end
--         }
--     },
--     capabilities = cmp_nvim_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- }



require("lsp.handlers").setup()
require "lsp.lsp-installer"
require "lsp.null-ls"
