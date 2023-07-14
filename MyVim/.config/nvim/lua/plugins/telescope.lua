return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.1",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("telescope").setup({
                defaults = {
                    layout_strategy = "horizontal",
                    layout_config = { prompt_position = "top" },
                    sorting_strategy = "ascending",
                    winblend = 0,
                },
                extensions = {
                    fzf = {
                        fuzzy = true,
                        override_generic_sorter = true,
                        override_file_sorter = true,
                        case_mode = "smart_case",
                    },
                    bibtex = {
                        -- Depth for the *.bib file
                        depth = 1,

                        custom_formats = { { id = "myCoolFormat", cite_marker = "%s" } },
                        -- Format to use for citation label.
                        -- Try to match the filetype by default, or use 'plain'
                        format = "myCoolFormat",
                        -- Path to global bibliographies (placed outside of the project)
                        global_files = { "/home/humberto/.config/texmf/zotero.bib" },
                        -- Define the search keys to use in the picker
                        search_keys = { "label", "author", "year", "title" },
                        -- Template for the formatted citation
                        citation_format = "{{author}} ({{year}}), {{title}}.",
                        -- Only use initials for the authors first name
                        citation_trim_firstname = true,
                        -- Max number of authors to write in the formatted citation
                        -- following authors will be replaced by "et al."
                        citation_max_auth = 2,
                        -- Context awareness disabled by default
                        context = true,
                        -- Fallback to global/directory .bib files if context not found
                        -- This setting has no effect if context = false
                        context_fallback = true,
                        -- Wrapping in the preview window is disabled by default
                        wrap = false,
                    },
                },
            })
        end,
    },
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        config = function() require("telescope").load_extension("fzf") end,
    },
    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
        config = function() require("telescope").load_extension("file_browser") end,
    },
    {
        "nvim-telescope/telescope-bibtex.nvim",
        config = function() require("telescope").load_extension("bibtex") end,
    },
}
