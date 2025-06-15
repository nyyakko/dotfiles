local cpp = {}

function cpp.configure(dap)
    local masonHome = vim.fn.expand('$MASON')

    dap.adapters.cppdbg = {
        id = 'cppdbg',
        type = 'executable',
        command = masonHome .. '/OpenDebugAD7'
    }

    dap.configurations.cpp = {
        {
            name = 'Launch file',
            type = 'cppdbg',
            request = 'launch',
            setupCommands = {{
                text = '-enable-pretty-printing',
                description =  'enable pretty printing',
                ignoreFailures = false
            }},
            cwd = '${workspaceFolder}',
            stopAtEntry = true,
            program = function()
                return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
            end,
        }
    }
end

table.insert(DEBUGGERS.registered, cpp)
