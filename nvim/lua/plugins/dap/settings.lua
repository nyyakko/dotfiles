local dapui = require('dapui')
dapui.setup()
local dap = require('dap')

require('plugins/dap/debuggers')

dap.listeners.before.attach.dapui_config = function() dapui.open() end
dap.listeners.before.launch.dapui_config = function() dapui.open() end
dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
dap.listeners.before.event_exited.dapui_config = function() dapui.close() end

local map = vim.keymap.set

map({ "n" }, "<F4>", function () dapui.toggle() end)
map({ "n" }, "<F5>", function () dap.toggle_breakpoint() end)
map({ "n" }, "<F9>", function () dap.continue() end)
map({ "n" }, "<F1>", function () dap.step_over() end)
map({ "n" }, "<F2>", function () dap.step_into() end)
map({ "n" }, "<F3>", function () dap.step_out() end)
map({ "n" }, "<Leader>dsc", function () dap.continue() end)
map({ "n" }, "<Leader>dsv", function () dap.step_over() end)
map({ "n" }, "<Leader>dsi", function () dap.step_into() end)
map({ "n" }, "<Leader>dso", function () dap.step_out() end)
map({ "n" }, "<Leader>dhh", function () dapui.eval() end)
map({ "n" }, "<Leader>dbc", function () dap.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end)
map({ "n" }, "<Leader>dbm", function () dap.set_breakpoint({ nil, nil, vim.fn.input('Log point message: ') }) end)
map({ "n" }, "<Leader>dbt", function () dap.toggle_breakpoint() end)
map({ "n" }, "<Leader>di", function () dapui.toggle() end)

DEBUGGERS.configure(dap)
