require("nvim-tree").setup({
	sort = {
		sorter = "case_sensitive"
	},
	view = {
		width = 30,
	},
})

vim.keymap.set("n", "<leader>t", "<cmd>:NvimTreeToggle<CR>", {desc = "Open/Close nvim tree"})
