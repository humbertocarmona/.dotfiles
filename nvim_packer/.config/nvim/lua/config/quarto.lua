-- conceal can be tricky because both
-- the treesitter highlighting and the
-- regex vim syntax files can define conceals
--
-- conceallevel
-- 0		Text is shown normally
-- 1		Each block of concealed text is replaced with one
-- 		character.  If the syntax item does not have a custom
-- 		replacement character defined (see |:syn-cchar|) the
-- 		character defined in 'listchars' is used.
-- 		It is highlighted with the 'Conceal' highlight group.
-- 2		Concealed text is completely hidden unless it has a
-- 		custom replacement character defined (see
-- 		|:syn-cchar|).
-- 3		Concealed text is completely hidden.
vim.opt.conceallevel = 1

-- disable conceal in markdown/quarto
vim.g['pandoc#syntax#conceal#use'] = false

-- embeds are already handled by treesitter injectons
vim.g['pandoc#syntax#codeblocks#embeds#use'] = false

vim.g['pandoc#syntax#conceal#blacklist'] = { 'codeblock_delim', 'codeblock_start' }

-- but allow some types of conceal in math reagions:
-- a=accents/ligatures d=delimiters m=math symbols
-- g=Greek  s=superscripts/subscripts
vim.g['tex_conceal'] = 'g'

require 'quarto'.setup {
    lspFeatures = {
        enabled = true,
        languages = { 'r', 'python', 'julia' },
        diagnostics = {
            enabled = true,
            triggers = { 'BufWrite' }
        },
        completion = {
            enabled = true
        }
    }
}
