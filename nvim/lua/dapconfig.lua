local dap, dapui = require('dap'), require('dapui')
local dapgo = require('dap-go')
local dappy = require('dap-python')
dapui.setup()
dapgo.setup()
dappy.setup()
-- Need to run this when using python dap
-- lua require('dap-python').setup('.venv/bin/python')

-- configure for dapui event listeners
dap.listeners.before.attach.dapui_config = function()
 dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
 dapui.open()
end

vim.keymap.set('n', '<Leader>r', function() require('dap').continue() end)
vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end)
vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.toggle() end)
vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)
vim.keymap.set('n', '<Leader>w', function() dapui.toggle() end)

-- setup for c
dap.adapters.lldb = {
  type = 'executable',
  command = '/home/thechef/.local/share/nvim/mason/bin/codelldb',
  name = 'lldb'
}
dap.configurations.c = {
  {
    name = 'Launch',
    type = 'lldb',
    request = 'launch',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},
  },
}
dap.configurations.cpp = {
  {
    name = 'Launch',
    type = 'lldb',
    request = 'launch',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},
  },
}

