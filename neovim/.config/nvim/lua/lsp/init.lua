local lspconfig = require'lspconfig'
local cmp_nvim_lsp = require'cmp_nvim_lsp'

local capabilities = cmp_nvim_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities())

--local capabilities = vim.lsp.protocol.make_client_capabilities()
--capabilities.textDocument.completion.completionItem.snippetSupport = true


lspconfig.pylsp.setup{
    capabilities = capabilities,
    on_attach = function ()
        vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0})
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer=0})
        vim.keymap.set("n", "gf", vim.lsp.buf.type_definition, {buffer=0})
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {buffer=0})
        vim.keymap.set("n", "gr", vim.lsp.buf.rename, {buffer=0})
        vim.keymap.set("n", "gn", vim.diagnostic.goto_next, {buffer=0})
        vim.keymap.set("n", "gt", "<cmd>Telescope diagnostics<cr>", {buffer=0})
    end
}

lspconfig.julials.setup{
    capabilities = capabilities,
    on_attach = function ()
        vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0})
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer=0})
        vim.keymap.set("n", "gf", vim.lsp.buf.type_definition, {buffer=0})
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {buffer=0})
        vim.keymap.set("n", "gr", vim.lsp.buf.rename, {buffer=0})
        vim.keymap.set("n", "gn", vim.diagnostic.goto_next, {buffer=0})
        vim.keymap.set("n", "gt", "<cmd>Telescope diagnostics<cr>", {buffer=0})
    end
}


-- require("lsp.handlers").setup() -- these handle servers and keymaps...
require'lsp.lsp-installer'

