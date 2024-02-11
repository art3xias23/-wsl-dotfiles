vim.opt.clipboard = "unnamedplus"

vim.g.clipboard = {
  name = 'win32yank-wsl',
  copy = {
    ['+'] = '/mnt/c/ProgramData/chocolatey/lib/win32yank/tools/win32yank.exe -i --crlf',
    ['*'] = '/mnt/c/ProgramData/chocolatey/lib/win32yank/tools/win32yank.exe -i --crlf',
  },
  paste = {
    ['+'] = '/mnt/c/ProgramData/chocolatey/lib/win32yank/tools/win32yank.exe -o --lf',
    ['*'] = '/mnt/c/ProgramData/chocolatey/lib/win32yank/tools/win32yank.exe -o --lf',
  },
  cache_enabled = 0,
}
