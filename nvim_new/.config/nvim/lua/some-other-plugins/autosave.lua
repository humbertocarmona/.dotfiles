return {
  "okuuva/auto-save.nvim",
  version = "^1.0.0", -- see https://devhints.io/semver, alternatively use '*' to use the latest tagged release
  lazy = true,
  keys = {
    { "<leader>A", "<cmd>ASToggle<CR>", desc = "Toggle auto-save" },
  },
  cmd = "ASToggle", -- optional for lazy loading on command
  -- event = { "InsertLeave", "TextChanged" }, -- optional for lazy loading on trigger events
  event = { "BufLeave" }, -- optional for lazy loading on trigger events
  opts = {
    enable = false,
    trigger_events = {
      immediate_save = {
        { "BufLeave", pattern = { "*.lua", "*.c", "*.h" } },
      },
    },
  },
  --- a
}
