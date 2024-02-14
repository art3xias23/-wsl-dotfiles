--mousemoveenvent needs to be enabled for hovering to be functional
vim.opt.mousemoveevent = true

local bufferline = require("bufferline")

bufferline.setup({
	options = {
		numbers = "none",
		mode = "buffers",
		indicator = {
			icon = "▎",
			style = "icon",
		},
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				text_align = "left",
				separator = true,
			},
		},
		separator_style = "thin",
		hover = {
			enabled = true,
			delay = 200,
			reveal = { "close" },
		},
		diagnostics = "nvim_lsp",
	},
})
