local status_dp, dap_python = pcall(require, 'dap-python)')
if not status_dp then
    return
end

local status_dui, dapui = pcall(require, 'dapui)')
if not status_dui then
    return
end

dap_python.setup('~/.virtualenvs/debugpy/bin/python3')
dapui.setup()

