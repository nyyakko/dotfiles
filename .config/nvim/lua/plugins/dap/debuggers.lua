DEBUGGERS = {
    registered = {}
}

require('plugins/dap/debuggers/cpp')

function DEBUGGERS.configure(dap)
    for _, debugger in ipairs(DEBUGGERS.registered) do
        debugger.configure(dap)
    end
end
