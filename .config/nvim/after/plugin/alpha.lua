local alpha = require('alpha')
local dashboard = require('alpha.themes.dashboard')


local name = {
[[]],
[[]],
[[]],
[[|\     /|\__   __/     \__   __/\__   __/( (    /|(  ___  )]],
[[| )   ( |   ) (           ) (      ) (   |  \  ( || (   ) |]],
[[| (___) |   | |           | |      | |   |   \ | || |   | |]],
[[|  ___  |   | |           | |      | |   | (\ \) || |   | |]],
[[| (   ) |   | |           | |      | |   | | \   || |   | |]],
[[| )   ( |___) (___ _      | |   ___) (___| )  \  || (___) |]],
[[|/     \|\_______/( )     )_(   \_______/|/    )_)(_______)]],
[[                  |/                                       ]],
[[]],
[[]],
[[]],

}

dashboard.section.header.val = name

dashboard.section.buttons.val = {
	dashboard.button('n', "  New file", ":ene <BAR> startinsert <CR>"),
	dashboard.button('f', " Find file", "<leader>sf"),
	dashboard.button('r', " Recently opened files", "<leader>so"),
	dashboard.button('p', " Recently opened projects", "<leader>sP"),
	dashboard.button('t', " Find text", "<leader>sg"),
	-- dashboard.button('p', "ﴬ"),
	-- dashboard.button('p', ""),
	-- dashboard.button('p', ""),
	dashboard.button('q', " Quit", ":qa<CR>")
}

dashboard.section.footer.val = " art3xias23"

alpha.setup(dashboard.config)

vim.keymap.set('n', '<leader>;', ":Alpha<CR>", { desc = "Toggle Alpha", silent = true })
