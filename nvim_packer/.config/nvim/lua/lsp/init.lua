vim.opt.signcolumn = 'yes' -- Reserve space for diagnostic icons

local lsp = require('lsp-zero').preset({
  name = 'recommended',
  set_lsp_keymaps = false,
})

-- this are the defaults for recommended:
--[[ opts[1] = 'recommended' ]]
--[[ opts.suggest_lsp_servers = true ]]
--[[ opts.setup_servers_on_start = true ]]
--[[ opts.cmp_capabilities = true ]]
--[[ opts.manage_nvim_cmp = true ]]
--[[ opts.call_servers = 'local' ]]

-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

lsp.setup()



