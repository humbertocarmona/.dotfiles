-- ltex.lua
-- Configure LTeX for LaTeX grammar checking, but ignore captions

return {
  "neovim/nvim-lspconfig",
  ft = { "tex", "bib", "markdown" },
  config = function()
    require("lspconfig").ltex.setup({
      settings = {
        ltex = {
          language = "en-US", -- or "pt-BR" depending on your writing
          additionalRules = {
            enablePickyRules = false,
          },

          -- Ignore everything inside \caption{ ... }
          hiddenFalsePositives = {
            -- Regex: \\caption\{anything but a closing brace\}
            "\\\\caption\\{[^}]*\\}",
          },

          -- Optional: don't try to grammar-check citations, labels, refs
          -- (recommended for academic writing)
          disabledRules = {
            ["en-US"] = {
              "MORFOLOGIK_RULE_EN_US", -- many false positives in science words
              "WHITESPACE_RULE",
              "WORD_CONTAINS_UNDERSCORE",
            },
          },

          -- Optional: Add your custom dictionary
          dictionary = {
            ["en-US"] = {
              "spin-glass",
              "magnetization",
              "Boltzmann",
              "Tsallis",
              "up-spins",
              "down-spins",
            },
          },
        },
      },
    })
  end,
}
