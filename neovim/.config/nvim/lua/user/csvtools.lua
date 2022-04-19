#require("csvtools").setup({})

require("csvtools").setup({
    -- this will clear the highlight of buf after move
 	before = 10000,
 	after = 10000,
    clearafter = false,
    -- this will provide a overflow show
    showoverflow =false,
 	titelflow = false,
 })
