require("actions-preview").setup({
})
vim.keymap.set({ "v", "n" }, "<leader>la", require("actions-preview").code_actions)
