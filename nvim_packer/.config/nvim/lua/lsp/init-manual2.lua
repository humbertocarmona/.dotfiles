require('mason').setup()

require('mason-lspconfig').setup({
  ensure_installed = {
    -- Replace these with whatever servers you want to install
  }
})

local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
local lsp_attach = function(client, bufnr)
    local bufopts = { noremap = true, silent = true}
    --Lsp stuff
    vim.keymap.set("n", "gp", ":lua vim.diagnostic.goto_prev({ border = 'rounded' }) <cr>", bufopts)
    vim.keymap.set("n", "gn", ":lua vim.diagnostic.goto_next({ border = 'rounded' }) <cr>", bufopts)
    vim.keymap.set("n", "gl", ":lua vim.diagnostic.open_float() <cr>", bufopts)
    vim.keymap.set("n", "gd", ":lua vim.lsp.buf.definition() <cr>", bufopts)
    vim.keymap.set("n", "gr", ":lua vim.lsp.buf.references() <cr>", bufopts)
    vim.keymap.set("n", "gD", ":lua vim.lsp.buf.declaration() <cr>", bufopts)
    vim.keymap.set("n", "gi", ":lua vim.lsp.buf.implementation() <cr>", bufopts)
    vim.keymap.set("n", "K", ":lua 	vim.lsp.buf.hover() <cr>", bufopts)
    vim.keymap.set("n", "<leader>r", ":lua vim.lsp.buf.rename() <cr>", bufopts)
    vim.keymap.set("n", "<leader>wa", ":lua vim.lsp.buf.add_workspace_folder() <cr>", bufopts)
    vim.keymap.set("n", "<leader>wr", ":lua vim.lsp.buf.remove_workspace_folder() <cr>", bufopts)
    vim.keymap.set("n", "<leader>f", ":lua vim.lsp.buf.format({ async = true }) <cr>", bufopts)
    vim.keymap.set("n", "<leader>F", ":lua vim.lsp.buf.format() <cr>", bufopts)
    vim.keymap.set("n", "<leader>wl", ":lua print(vim.inspect(vim.lsp.buf.list_workspace_folders())) <cr>", bufopts)
end

local lspconfig = require('lspconfig')
require('mason-lspconfig').setup_handlers({
  function(server_name)
    lspconfig[server_name].setup({
      on_attach = lsp_attach,
      capabilities = lsp_capabilities,
    })
  end,
})
