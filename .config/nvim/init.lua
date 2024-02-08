require("art3xias")

vim.lsp.set_log_level('debug')

if vim.fn.has('wsl') == 1 then
	vim.g.clipboard = {
		name = 'WslClipboard',
		copy = {
			['+'] = 'clip.exe',
			['*'] = 'clip.exe',
		},
		paste = {
			['+'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
			['*'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
		},
		cache_enabled = 0,
	}
end

function CheckLsp()
	if vim.lsp.buf.server_ready() then
	print("LSP is attached to the current buffer.")
	else
	print("No LSP attached to the current buffer.")
	end
end

vim.cmd('command! Lsp call v:lua.CheckLsp()')
