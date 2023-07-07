return {
    { "tpope/vim-repeat" },
    -- { "tpope/vim-surround" },
    {
        "kylechui/nvim-surround",
        config = function()
            require("nvim-surround").setup({
                keymaps = {
                    insert = false,
                    insert_line = false,
                    normal = false,
                    normal_cur = false,
                    normal_line = false,
                    normal_cur_line = false,
                    visual = "<S-s>",
                    visual_line = false,
                    delete = false,
                    change = false,
                },
                aliases = {
                    ["a"] = false,
                    ["b"] = false,
                    ["B"] = false,
                    ["r"] = false,
                    ["q"] = false,
                    ["s"] = false,
                },
            })
        end,
    },
    { "fedepujol/move.nvim" },
    {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("indent_blankline").setup({
                show_current_context = true,
                show_current_context_start = false,
            })
        end,
    },
    -- commenting with e.g. `gcc` or `gcip`
    -- respects TS, so it works in quarto documents
    {
        "numToStr/Comment.nvim",
        version = nil,
        branch = "master",
        config = function() require("Comment").setup({}) end,
    },
    {
        "danymat/neogen",
        dependencies = "nvim-treesitter/nvim-treesitter",
        config = true,
    },
    {
        "gbprod/yanky.nvim",
        config = function()
            require("yanky").setup({
                ring = {
                    history_length = 100,
                    storage = "shada",
                    sync_with_numbered_registers = true,
                    cancel_event = "update",
                },
                system_clipboard = {
                    sync_with_ring = true,
                },
            })
        end,
    },
    {
        "mbbill/undotree",
        config = function() vim.g["undotree_SetFocusWhenToggle"] = true end,
    }, -- Vimscript
    { "jbyuki/nabla.nvim" },

    {
        "Pocco81/auto-save.nvim",
        config = function()
            require("auto-save").setup({
                enabled = false,
                execution_message = {
                    message = function() -- message to print on save
                        return ("auto-saved at " .. vim.fn.strftime("%H:%M:%S"))
                    end,
                    dim = 0.18, -- dim the color of `message`
                    cleaning_interval = 1250, -- (milliseconds) automatically clean MsgArea after displaying `message`. See :h MsgArea
                },
                trigger_events = { "InsertLeave" }, -- vim events that trigger auto-save. See :h events
                -- function that determines whether to save the current buffer or not
                -- return true: if buffer is ok to be saved
                -- return false: if it's not ok to be saved
                condition = function(buf)
                    local fn = vim.fn
                    local utils = require("auto-save.utils.data")

                    if fn.getbufvar(buf, "&modifiable") == 1 and utils.not_in(fn.getbufvar(buf, "&filetype"), {}) then
                        return true -- met condition(s), can save
                    end
                    return false -- can't save
                end,
                write_all_buffers = false, -- write all buffers when the current one meets `condition`
                debounce_delay = 135, -- saves the file at most every `debounce_delay` milliseconds
                callbacks = {
                    -- functions to be executed at different intervals
                    enabling = nil, -- ran when enabling auto-save
                    disabling = nil, -- ran when disabling auto-save
                    before_asserting_save = nil, -- ran before checking `condition`
                    before_saving = nil, -- ran before doing the actual save
                    after_saving = nil, -- ran after doing the actual save
                },
            })
        end,
    },
}
