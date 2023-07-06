return {
    -- completion
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-nvim-lsp-signature-help" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "hrsh7th/cmp-calc" },
            { "hrsh7th/cmp-emoji" },
            { "saadparwaiz1/cmp_luasnip" },
            { "f3fora/cmp-spell" },
            { "ray-x/cmp-treesitter" },
            { "kdheepak/cmp-latex-symbols" },
            -- { 'jc-doyle/cmp-pandoc-references' },
            { "jmbuhr/cmp-pandoc-references" },
            { "L3MON4D3/LuaSnip" },
            { "rafamadriz/friendly-snippets" },
            { "onsails/lspkind-nvim" },
            {
                "KadoBOT/cmp-plugins",
                config = function()
                    require("cmp-plugins").setup({
                        files = { "plugins.lua" }, -- Recommended: use static filenames or partial paths
                    })
                end,
            },
        },
        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")
            local lspkind = require("lspkind")
            lspkind.init()

            local has_words_before = function()
                local line, col = unpack(vim.api.nvim_win_get_cursor(0))
                return col ~= 0
                    and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
            end

            cmp.setup({
                snippet = {
                    expand = function(args) luasnip.lsp_expand(args.body) end,
                },
                mapping = {
                    ["<C-f>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-d>"] = cmp.mapping.scroll_docs(4),
                    ["<C-n>"] = cmp.mapping(function(fallback)
                        if luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                            fallback()
                        end
                    end, { "i", "s" }),
                    ["<C-p>"] = cmp.mapping(function(fallback)
                        if luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                    ["<c-a>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm({
                        select = true,
                    }),
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif has_words_before() then
                            cmp.complete()
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
                },
                autocomplete = false,
                formatting = {
                    format = lspkind.cmp_format({
                        with_text = true,
                        menu = {
                            otter = "[🦦]",
                            luasnip = "[snip]",
                            nvim_lsp = "[LSP]",
                            buffer = "[buf]",
                            path = "[path]",
                            spell = "[spell]",
                            pandoc_references = "[ref]",
                            tags = "[tag]",
                            treesitter = "[TS]",
                            calc = "[calc]",
                            latex_symbols = "[tex]",
                            emoji = "[emoji]",
                        },
                    }),
                },
                sources = {
                    { name = "otter" },
                    { name = "path" },
                    { name = "plugins" },
                    { name = "nvim_lsp" },
                    { name = "nvim_lsp_signature_help" },
                    { name = "luasnip", keyword_length = 3, max_item_count = 3 },
                    { name = "pandoc_references" },
                    { name = "buffer", keyword_length = 5, max_item_count = 3 },
                    { name = "spell" },
                    { name = "treesitter", keyword_length = 5, max_item_count = 3 },
                    { name = "calc" },
                    { name = "latex_symbols" },
                    { name = "emoji" },
                },
                view = {
                    entries = "native",
                },
                window = {
                    documentation = {
                        border = require("misc.style").border,
                    },
                },
            })
            -- for friendly snippets
            require("luasnip.loaders.from_vscode").lazy_load()
            -- for custom snippets
            require("luasnip.loaders.from_vscode").lazy_load({ paths = { "~/.config/nvim/snips" } })
        end,
    },
    {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup({
                check_ts = true,
                ts_config = {
                    lua = { "string", "source" },
                    javascript = { "string", "template_string" },
                    java = false,
                },
                disable_filetype = { "TelescopePrompt", "spectre_panel" },
                disable_in_macro = true,
                disable_in_replace_mode = true,
                enable_moveright = true,
                ignored_next_char = "",
                enable_check_bracket_line = true, --- check bracket in same line
            })
            local Rule = require("nvim-autopairs.rule")

            local cond = require("nvim-autopairs.conds")

            require("nvim-autopairs").add_rules({
                Rule("`", "'", "tex"),
                Rule("$", "$", "tex"),
                Rule(" ", " ")
                    :with_pair(function(opts)
                        local pair = opts.line:sub(opts.col, opts.col + 1)
                        return vim.tbl_contains({ "$$", "()", "{}", "[]" }, pair)
                    end)
                    :with_move(cond.none())
                    :with_cr(cond.none())
                    :with_del(function(opts)
                        local col = vim.api.nvim_win_get_cursor(0)[2]
                        local context = opts.line:sub(col - 1, col + 2)
                        return vim.tbl_contains({ "$  $", "(  )", "{  }", "[  ]" }, context)
                    end),
                Rule("$ ", " ", "tex"):with_pair(cond.not_after_regex(" ")):with_del(cond.none()),
                Rule("[ ", " ", "tex"):with_pair(cond.not_after_regex(" ")):with_del(cond.none()),
                Rule("{ ", " ", "tex"):with_pair(cond.not_after_regex(" ")):with_del(cond.none()),
                Rule("( ", " ", "tex"):with_pair(cond.not_after_regex(" ")):with_del(cond.none()),
            })

            local cmp_autopairs = require("nvim-autopairs.completion.cmp")
            local cmp_status_ok, cmp = pcall(require, "cmp")
            if not cmp_status_ok then return end
            cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))
        end,
    },
}
