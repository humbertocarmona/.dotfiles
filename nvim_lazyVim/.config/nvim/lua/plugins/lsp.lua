return {
    { -- package manager for neovim
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "stylua",
                "shfmt",
            },
        },
    },
    { -- closes some gaps that exist between mason.nvim and lspconfig
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                },
            })
        end,
    },
    { -- setup lsp configurations, config comminications between neovim and lsps
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                lua_ls = {
                    -- mason = false, -- set to false if you don't want this server to be installed with mason
                    settings = {
                        Lua = {
                            workspace = {
                                checkThirdParty = false,
                            },
                            completion = {
                                callSnippet = "Replace",
                            },
                        },
                    },
                },
            },
        },
    },
    {
        "jose-elias-alvarez/null-ls.nvim",
        opts = function()
            local nls = require("null-ls")
            return {
                root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git"),
                sources = {
                    nls.builtins.diagnostics.fish,
                    nls.builtins.formatting.fish_indent,
                    nls.builtins.formatting.stylua,
                    nls.builtins.formatting.shfmt,
                    nls.builtins.diagnostics.zsh,
                    nls.builtins.completion.luasnip,
                },
            }
        end,
    },
}
