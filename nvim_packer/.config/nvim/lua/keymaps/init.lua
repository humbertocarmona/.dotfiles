vim.g.mapleader = ","
vim.g.maplocalleader = ","
local bufopts = { noremap = true, silent = true }

-- clear all selections

-- Better window navigation
vim.keymap.set("n", "<C-j>", "<C-w>j", bufopts)
vim.keymap.set("n", "<C-h>", "<C-w>h", bufopts)
vim.keymap.set("n", "<C-k>", "<C-w>k", bufopts)
vim.keymap.set("n", "<C-l>", "<C-w>l", bufopts)

-- Resize with arrows
vim.keymap.set("n", "<C-Up>", ":resize -1<CR>", bufopts)
vim.keymap.set("n", "<C-Down>", ":resize +3<CR>", bufopts)
vim.keymap.set("n", "<C-Left>", ":vertical resize -1<CR>", bufopts)
vim.keymap.set("n", "<C-Right>", ":vertical resize +3<CR>", bufopts)

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", bufopts)
vim.keymap.set("v", ">", ">gv", bufopts)

-- Better buffer navigation
vim.keymap.set("n", "<S-l>", ":bnext<CR>", bufopts)
vim.keymap.set("n", "<S-h>", ":bprevious<CR>", bufopts)

-- fedepujol/move.nvim
vim.keymap.set("n", "<A-j>", ":MoveLine(1)<CR>", bufopts)
vim.keymap.set("n", "<A-k>", ":MoveLine(-1)<CR>", bufopts)
vim.keymap.set("n", "<A-h>", ":MoveHChar(-1)<CR>", bufopts)
vim.keymap.set("n", "<A-l>", ":MoveHChar(1)<CR>", bufopts)

vim.keymap.set("v", "<A-j>", ":MoveBlock(1)<CR>", bufopts)
vim.keymap.set("v", "<A-k>", ":MoveBlock(-1)<CR>", bufopts)
vim.keymap.set("v", "<A-h>", ":MoveHBlock(-1)<CR>", bufopts)
vim.keymap.set("v", "<A-l>", ":MoveHBlock(1)<CR>", bufopts)

-- akinsho/toogleterm.nvim
vim.keymap.set("n", "<C-/>", ":ToggleTerm<CR>", bufopts)

--Slime
vim.keymap.set("n", "<s-cr>", "<PLUG>SlimeCell", bufopts)
vim.keymap.set("n", "<c-cr>", "<PLUG>SlimeCellsSendAndGoToNext", bufopts)
vim.keymap.set("n", "<c-n>", "<PLUG>SlimeCellsPrev", bufopts)
vim.keymap.set("n", "<c-m>", "<PLUG>SlimeCellsNext", bufopts)
vim.keymap.set("x", "<cr>", "<PLUG>SlimeRegionSend", bufopts)

vim.keymap.set("n", "gl", ":lua vim.diagnostic.open_float() <cr>", bufopts)
local wk = require("which-key")

-- goolord/alpha-nvim

wk.register({
	["<leader>"] = { "::let @/=''<cr>", "clear" },
	["e"] = { ":NvimTreeToggle<cr>", "file tree" },
	c = {
		name = "code",
		c = { ":SlimeConfig>cr>", "slime config" },
	},
	g = {
		name = "git",
		l = { ":LazyGit<cr>", "LazyGit" },
	},
	l = {
		name = "lsp",
		s = { "<cmd>Telescope lsp_document_symbols<cr>", "symbols" },
		r = { "<cmd>Telescope lsp_references<cr>", "references" },
		R = { vim.lsp.buf.rename, "rename" },
		D = { vim.lsp.buf.type_definition, "type definition" },
		a = { vim.lsp.buf.code_action, "code action" },
		e = { vim.diagnostic.open_float, "diagnostics" },
		f = { vim.lsp.buf.format, "format" },
		o = { ":SymbolsOutline<cr>", "outline" },
		l = { vim.diagnostic.open_float(), "open float" },
		d = {
			name = "diagnostics",
			d = { vim.diagnostic.disable, "disable" },
			e = { vim.diagnostic.enable, "enable" },
		},
		g = { ":Neogen<cr>", "neogen docstring" },
	},
	q = {
		name = "quarto",
		a = { ":QuartoActivate<cr>", "activate" },
		p = { ":lua require'quarto'.quartoPreview()<cr>", "preview" },
		q = { ":lua require'quarto'.quartoClosePreview()<cr>", "close" },
		h = { ":QuartoHelp ", "help" },
		e = { ":lua require'otter'.export()<cr>", "export" },
		E = { ":lua require'otter'.export(true)<cr>", "export overwrite" },
	},
	s = {
		name = "spellcheck",
		s = { "<cmd>Telescope spell_suggest<cr>", "spelling" },
		["/"] = { "<cmd>setlocal spell!<cr>", "spellcheck" },
		n = { "]s", "next" },
		p = { "[s", "previous" },
		g = { "zg", "good" },
		r = { "zg", "rigth" },
		w = { "zw", "wrong" },
		b = { "zw", "bad" },
		["?"] = { "<cmd>Telescope spell_suggest<cr>", "suggest" },
	},
	t = {
		name = "telescope",
		b = { "<cmd> Telescope buffers<cr>", "buffers" },
		c = { "<cmd> Telescope colorscheme", "colorscheme" },
		f = { "<cmd> Telescope find_files", "files" },
		g = { "<cmd> Telescope live_grep<cr>", "grep" },
		j = { "<cmd> Telescope jumplist<cr>", "marks" },
		k = { "<cmd> Telescope keymaps<cr>", "keymaps" },
		l = { "<cmd> Telescope loclist<cr>", "loclist" },
		m = { "<cmd> Telescope marks<cr>", "marks" },
		q = { "<cmd> Telescope quickfix<cr>", "quickfix" },
		r = { "<cmd> Telescope lsp_references<cr>", "references" },
		z = { "<cmd> Telescope current_buffer_fuzzy_find<cr>", "fuzzy" },
	},
	w = {
		name = "write",
		a = { ":wa<cr>", "write all" },
		q = { ":wq<cr>", "write and quit" },
		w = { ":w<cr>", "write" },
		x = { ":wqa<cr>", "write all and quit" },
	},
	d = {
		name = "dap",
		d = { ":lua require'dap-python'.debug_test()<cr>", "debug test" },
		b = { ":lua require'dap'.toggle_breakpoint()<cr>", "toggle break point" },
		c = { ":lua require'dap'.continue()<cr>", "continuue" },
		i = { ":lua require'dap'.step_into()<cr>", "step into" },
		o = { ":lua require'dap'.step_over()<cr>", "step over" },
		u = { ":lua require'dap'.step_out()<cr>", "step out" },
	},
	["z"] = { ":ZenMode<cr>", "zen mode" },
}, { mode = "n", prefix = "<leader>" })

wk.register({
	["ds"] = { "<ESC>:lua require('dap-python').debug_selection()<cr>", "debug selection" },
}, { mode = "v", prefix = "<leader>" })
