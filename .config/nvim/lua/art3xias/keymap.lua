vim.g.mapleader = ' '
vim.keymap.set("n", "<leader>pe", vim.cmd.Ex)
vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("i", "jk", "<esc>:w<cr>")
vim.keymap.set("n", "<leader>f", "<cmd>lua vim.lsp.buf.format()<CR>")
vim.keymap.set("n", "<leader>ms", "<cmd>:w<CR>:so<CR>", {desc = "Shout Out"})
vim.keymap.set("n", "<leader>pi", "<cmd>:PackerInstall<CR>", {desc = "Install packer modules"})
