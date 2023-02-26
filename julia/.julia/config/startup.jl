using InteractiveUtils
using Revise

InteractiveUtils.define_editor(
   r"nvim", wait=true)  do cmd, path, line
   `$cmd +$line $path`
end

println("using revise...")
