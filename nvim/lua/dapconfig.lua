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
      local source_file = vim.fn.input('Name of source code: ', 'main.c')
      local bin_file = string.sub(source_file, 0, -3)
      local cwd_ = vim.fn.getcwd()
      local compile_command = string.format("g++ %s/src/%s -o %s/target/%s", cwd_, source_file, cwd_, bin_file)
      os.execute(compile_command)
      return string.format("%s/target/%s", cwd_, bin_file)
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
      local source_file = vim.fn.input('Name of source code: ', 'main.cpp')
      local bin_file = string.sub(source_file, 0, -3)
      local cwd_ = vim.fn.getcwd()
      local compile_command = string.format("g++ %s/src/%s -o %s/target/%s", cwd_, source_file, cwd_, bin_file)
      os.execute(compile_command)
      return string.format("%s/target/%s", cwd_, bin_file)
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},
  },
}
dap.configurations.py = {
    dappy.setup(".venv*/bin/python")
}
