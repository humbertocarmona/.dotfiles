local ok, pretty_fold = pcall(require, "pretty-fold")
if not ok then
    return
end

pretty_fold.setup()
