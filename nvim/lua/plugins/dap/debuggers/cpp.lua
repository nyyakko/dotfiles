local cpp = {}

function cpp.configure(dap)
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
        },
        {
            name = 'Attach to gdbserver :1234',
            type = 'cppdbg',
            request = 'launch',
            MIMode = 'gdb',
            miDebuggerServerAddress = 'localhost:1234',
            miDebuggerPath = '/usr/bin/gdb',
            cwd = '${workspaceFolder}',
            setupCommands = {{
                text = '-enable-pretty-printing',
                description =  'enable pretty printing',
                ignoreFailures = false
            }},
            program = function()
                return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
            end,
        },
    }
end

table.insert(DEBUGGERS.registered, cpp)
