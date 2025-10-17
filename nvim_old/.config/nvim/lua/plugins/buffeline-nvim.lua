return {
    {
        "akinsho/bufferline.nvim",
        enabled = true,
        event = "VeryLazy",
        config = function()
            require("bufferline").setup({
                options = {
                    mode = "buffers", -- or "tabs"
                    diagnostics = "nvim_lsp",
                    offsets = {
                        {
                            filetype = "NvimTree",
                            text = "File Explorer",
                            highlight = "Directory",
                            separator = true,
                        },
                    },
                    separator_style = "slant", -- or "thin", "padded_slant", etc.
                },
            })
        end,
    },
}
