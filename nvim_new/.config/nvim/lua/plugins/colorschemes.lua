return {
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    opts = {
      lsp_styles = {
        underlines = {
          errors = { "undercurl" },
          hints = { "undercurl" },
          warnings = { "undercurl" },
          information = { "undercurl" },
        },
      },
      integrations = {
        aerial = true,
        alpha = true,
        cmp = true,
        dashboard = true,
        flash = true,
        fzf = true,
        grug_far = true,
        gitsigns = true,
        headlines = true,
        illuminate = true,
        indent_blankline = { enabled = true },
        leap = true,
        lsp_trouble = true,
        mason = true,
        mini = true,
        navic = { enabled = true, custom_bg = "lualine" },
        neotest = true,
        neotree = true,
        noice = true,
        notify = true,
        snacks = true,
        telescope = true,
        treesitter_context = true,
        which_key = true,
      },
    },
    specs = {
      {
        "akinsho/bufferline.nvim",
        optional = true,
        opts = function(_, opts)
          if (vim.g.colors_name or ""):find("catppuccin") then
            opts.highlights = require("catppuccin.special.bufferline").get_theme()
          end
        end,
      },
    },
  },
  { "ellisonleao/gruvbox.nvim", lazy = true, config = true, opts = ... },
  {
    "folke/tokyonight.nvim",
    lazy = true,
    config = function()
      local tokyo = require("tokyonight")
      tokyo.setup({
        on_highlights = function(highlights)
          highlights.ColorColumn = {
            bg = "#1d2443",
          }
          highlights.Folded = {
            bg = "#1d2443",
            fg = "#7aa2f7",
          }
          highlights.WinSeparator = {
            bold = true,
            fg = "#2d3453",
          }
        end,
        on_colors = function(colors)
          colors.comment = "#767fa9"
        end,
      })
    end,
  },
  { "rebelot/kanagawa.nvim", lazy = true, opts = { style = "dragon" } },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight-night",
    },
  },
}
