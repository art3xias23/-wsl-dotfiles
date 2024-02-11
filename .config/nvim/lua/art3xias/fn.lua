function CheckLsp()
	if vim.lsp.buf.server_ready() and vim.lsp.buf_get_clients() ~= nil then
		print(string.format(" %s is attached to the current buffer.", vim.lsp.buf_get_clients()[1].name))
	else
		print("No LSP attached to the current buffer.")
	end
end

vim.cmd('command! L call v:lua.CheckLsp()')
