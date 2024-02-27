require("actions-preview").setup({
})
vim.keymap.set({ "v", "n" }, "<leader>ga", require("actions-preview").code_actions)
