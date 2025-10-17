return {
    {
        -- amongst your other plugins
        {
            "akinsho/toggleterm.nvim",
            version = "*",
            opts = {
                size = 15,
                direction = "horizontal", --| "vertical" | "tab" | "float",
                start_in_insert = true,
                winbar = {
                    enabled = false,
                    name_formatter = function(term) --  term: Terminal
                        return term.name
                    end,
                },
                open_mapping = [[<c-\>]],
            },
        },
    },
}
