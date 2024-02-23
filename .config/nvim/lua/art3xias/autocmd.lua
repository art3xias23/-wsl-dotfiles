local my_group =vim.api.nvim_create_augroup('MyAutoCmdGroup', {clear = true})

vim.api.nvim_create_autocmd('VimEnter',{
	command = "NvimTreeToggle | Alpha",
	group= my_group,
	pattern="*",
	once = true
})


-- vim.api.nvim_create_autocmd('BufEnter', {
-- 	pattern = "*",
-- 	command = "silent! lcd %:p:h"
-- })


