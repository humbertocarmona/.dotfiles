-- Setup nvim-cmp.
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
cmp.event:on(
    'confirm_done',
     cmp_autopairs.on_confirm_done()
)

local npairs = require('nvim-autopairs')

 npairs.setup {
    fast_wrap = {},
    check_ts = true,
    ts_config = {
         lua = { "string", "source" },
         javascript = { "string", "template_string" },
         java = false,
     },
}

