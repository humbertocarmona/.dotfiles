-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
  callback = function()
    local root = vim.fs.root(0, { ".git", ".hg" }) or vim.fn.getcwd()
    local spellfile = root .. "/en.utf-8.add"

    -- Create file if missing
    if vim.fn.filereadable(spellfile) == 0 then
      vim.fn.writefile({}, spellfile)
    end

    vim.opt_local.spellfile = spellfile
  end,
})
