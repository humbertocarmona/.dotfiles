vim.cmd [[
try
  colorscheme ayu-dark
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
