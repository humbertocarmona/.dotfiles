-- PdfAnnots
function PdfAnnots()
    local ok, pdf = pcall(vim.api.nvim_eval, "vimtex#context#get().handler.get_actions().entry.file")
    if not ok then
        vim.notify("No file found")
        return
    end

    local cwd = vim.fn.getcwd()
    vim.fn.chdir(vim.b.vimtex.root)

    if vim.fn.isdirectory("Annotations") == 0 then vim.fn.mkdir("Annotations") end

    local md = vim.fn.printf("Annotations/%s.md", vim.fn.fnamemodify(pdf, ":t:r"))
    vim.fn.system(vim.fn.printf('pdfannots -o "%s" "%s"', md, pdf))
    vim.cmd.split(vim.fn.fnameescape(md))

    vim.fn.chdir(cwd)
end
