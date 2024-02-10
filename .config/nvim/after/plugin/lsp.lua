local lsp_zero = require("lsp-zero")
lsp_zero.on_attach(function(_, bufnr)
	lsp_zero.default_keymaps({buffer = bufnr})
end)

local lua_opts = lsp_zero.nvim_lua_ls()

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
  mapping = cmp.mapping.preset.insert({
    -- `Enter` key to confirm completion
    ['<CR>'] = cmp.mapping.confirm({select = false}),

    -- Ctrl+Space to trigger completion menu
    ['<C-Space>'] = cmp.mapping.complete(),

    -- Navigate between snippet placeholder
    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
    ['<C-b>'] = cmp_action.luasnip_jump_backward(),

    -- Scroll up and down in the completion documentation
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
  })
})


local lsp_config = require('lspconfig')
lsp_config.lua_ls.setup(lua_opts)

require("mason").setup({})

require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		"omnisharp",
	},
	handlers = {
		lsp_zero.default_setup,

		omnisharp = function()
			lsp_config.omnisharp.setup({
				handlers = { ['textDocument/definition'] = require('omnisharp_extended').handler }
			})
		end

	}
})
