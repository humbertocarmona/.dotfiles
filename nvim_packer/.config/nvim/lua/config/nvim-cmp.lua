vim.opt.completeopt = { "menu", "menuone", "noselect" }

local cmp = require("cmp")
local luasnip = require("luasnip")
local lspkind = require("lspkind")
lspkind.init()

local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-f>"] = cmp.mapping.scroll_docs( -4),
        ["<C-d>"] = cmp.mapping.scroll_docs(4),
        ['<C-n>'] = cmp.mapping(function(fallback)
            if luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
                fallback()
            end
        end, { "i", "s" }),
        ['<C-p>'] = cmp.mapping(function(fallback)
            if luasnip.jumpable( -1) then
                luasnip.jump( -1)
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<C-a"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(), -- cmp.mapping.close()
        ["<CR>"] = cmp.mapping.confirm({ -- behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        }),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end, { "i", "s" }),
    }),
    autocomplete = false,
    formatting = {
        format = lspkind.cmp_format({
            mode = "text_symbol",
            preset = "codicons",
            maxwidth = 60,
            symbol_map = {
                Text = "",
                Method = "",
                Function = "",
                Constructor = "",
                Field = "ﰠ",
                Variable = "",
                Class = "ﴯ",
                Interface = "",
                Module = "",
                Property = "ﰠ",
                Unit = "塞",
                Value = "",
                Enum = "",
                Keyword = "",
                Snippet = "",
                Color = "",
                File = "",
                Reference = "",
                Folder = "",
                EnumMember = "",
                Constant = "",
                Struct = "פּ",
                Event = "",
                Operator = "",
                TypeParameter = "",
            },
            --[[ before = function(entry, vim_item) ]]
            --[[ 	return vim_item ]]
            --[[ end, ]]
        }),
    },
    sources = cmp.config.sources({
        {name = 'otter'},
        { name = "path",
            keyword_length = 2,
        },
        { name = "nvim_lsp" },
        { name = "nvim_lsp_signature_help"},
        { name = "nvim_lua" },
        { name = "luasnip", keyword_length = 3, max_item_count=3 },
        { name = 'pandoc_references'},
        { name = "buffer", keyword_length = 5, max_item_count=3},
        { name = "spell", keyword_length = 2},
        { name = 'treesitter'},
        { name = "latex_symbols" },
    }, {}),
})

require("luasnip.loaders.from_vscode").lazy_load()
      -- for custom snippets
require("luasnip.loaders.from_vscode").lazy_load({ paths = { "~/.config/nvim/snippets/" } })


-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
    -- mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = "nvim_lsp_document_symbol" },
    }, {
        { name = 'buffer' },
    }),
})
