local dap = require("dap")
dap.set_log_level('TRACE')
dap.adapters.coreclr = {
  type = 'executable',
  command = '/usr/local/netcoredbg',
  args = {'--interpreter=vscode'}
}
