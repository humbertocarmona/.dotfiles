local lspconfig = require'lspconfig'
local cmp_nvim_lsp = require'cmp_nvim_lsp'

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmp_nvim_lsp.update_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true




function lsp_highlight_document(client)
    -- Set autocommands conditional on server_capabilities
    if client.resolved_capabilities.document_highlight then
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

function lsp_keymaps(bufnr)
    vim.api.nvim_create_user_command("Format","lua vim.lsp.buf.formatting()",{})
    vim.keymap.set("n","K",':lua vim.lsp.buf.hover()<CR>')
    vim.keymap.set("n","gD",':lua vim.lsp.buf.declaration()<CR>')
    vim.keymap.set("n","gd",':lua vim.lsp.buf.definition()<CR>')
    vim.keymap.set("n","gi",':lua vim.lsp.buf.implerentation()<CR>')
    vim.keymap.set("n","go",':Telescope lsp_references<CR>')
    vim.keymap.set("n","gr",':lua vim.lsp.buf.rename()<CR>')
    vim.keymap.set("n","ga",':lua vim.lsp.buf.code_action()<CR>')
    vim.keymap.set("n","gl",':lua vim.diagnostic.open_float()<CR>')
    vim.keymap.set("n","[d",':lua vim.diagnostic.goto_prev()<CR>')
    vim.keymap.set("n","]d",':lua vim.diagnostic.goto_next()<CR>')
    -- local opts = { noremap = true, silent = true }
    -- vim.api.nvim_buf_set_keymap(bufnr, "n", "gD",
    --     "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, "n", "gd",
    --     "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, "n", "gi",
    --     "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, "n", "gr",
    --     "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, "n", "gl",
    --     '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, "n", "K",
    --     "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    --   vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-k>",
    -- n       "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn",
    --     "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>q",
    --       "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca",
    --       "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>f",
    --       "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, "n", "[d",
    --     '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, "n", "]d",
    --     '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
    -- vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
end



-- lspconfig.pylsp.setup{
--     capabilities = capabilities,
--     on_attach = function(client, bufnr)
--         -- this is just an example of what I can do to avoid using this server
--         -- for formatting if it has the capabilities to do so.
--         -- if client.name == 'pylsp' then 
--         --     client.resolved_capabilities.document_formatting = false
--         -- end
--         lsp_highlight_document(client)
--         lsp_keymaps(bufnr)
--     end
-- }

lspconfig.julials.setup{
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        lsp_highlight_document(client)
        lsp_keymaps(bufnr)
    end
}

-- lspconfig.lua.setup{
--     capabilities = capabilities,
--     on_attach = function(client, bufnr)
--         lsp_highlight_document(client)
--         lsp_keymaps(bufnr)
--     end,
--     settings = {
--         Lua = {
--             diagnostics = {
--                 globals = { 'vim', 'awesome', 'screen'}
--             }
--         }
--     }
-- }


require("lsp.handlers").setup() -- these handle servers and keymaps...
require("lsp.lsp-installer")

