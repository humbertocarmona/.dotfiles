local ok, nvim_notify = pcall(require, "notify")
if not ok then
    return
end

nvim_notify.setup({
    background_colour = "#000000",
})
