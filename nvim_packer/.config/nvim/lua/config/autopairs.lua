-- Setup nvim-cmp.
local cmp_autopairs = require("nvim-autopairs.completion.cmp")

local cmp = require("cmp")
cmp.event:on(
    "confirm_done", 
    cmp_autopairs.on_confirm_done())

require("nvim-autopairs").setup({
	check_ts = true,
    ts_config = {
        lua = { 'string' },
        javascript = { 'string'}
    },
    fast_wrap = {} -- check <M-e> $ and <M-e> q 
})


