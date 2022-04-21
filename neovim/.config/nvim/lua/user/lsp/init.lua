local lsp_ok, lspconfig = pcall(require, "lspconfig")
if not lsp_ok then
    return
end


-- nvim-cmp + luasnip
local cmp_ok, cmp = pcall(require, "cmp")
if cmp_ok then
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
    capabilities.textDocument.completion.completionItem.snippetSupport = true

    local servers = { 'pylsp', 'julials', 'jsonls'}
    for _, lsp in ipairs(servers) do
        lspconfig[lsp].setup{
            capabilities=capabilities,
        }
    end

    require "user.lsp.nvim-cmp"
end
--
-- --- coc 
-- local coc_ok, coc = pcall(require, "coc")
-- if coc_ok then
--     vim.g.coc_settings = { auto_start = true }
--     local servers = { 'pylsp', 'julials', 'jsonls'}
--     for i, lsp in ipairs(servers) do
--         lspconfig[lsp].setup(
--             require('coc').lsp_ensure_capabilities(
--                 {
--                     -- on_attach = my_custom_on_attach
--                 }
--         ))
--     end
-- end


require("user.lsp.handlers").setup()
require "user.lsp.lsp-installer"
require "user.lsp.null-ls"

