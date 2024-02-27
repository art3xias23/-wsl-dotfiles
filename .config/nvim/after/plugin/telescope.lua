local telescope = require('telescope')

telescope.setup({
	defaults = {
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
			"--hidden", -- add this 
		},

		file_ignore_patterns = {"bin", "obj", ".vs", "node_modules"}
		-- your other options
	},

	pickers = {

		find_files = {

			hidden = true,

			no_ignore=true

		}

	}
})

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set("n", "<leader>pg", builtin.live_grep, {})
