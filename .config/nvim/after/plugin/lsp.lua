vim.lsp.set_log_level("debug")

local lsp_zero = require("lsp-zero")
local lspconfig = require("lspconfig")
lsp_zero.on_attach(function(_, bufnr)
	lsp_zero.default_keymaps({ buffer = bufnr })
end)

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }

local cmp_mappings = lsp_zero.defaults.cmp_mappings({
	['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
	['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
	-- ['<leader>.'] = cmp.mapping.complete_common_string(),
	-- ['<C-f>'] = cmp.mapping.scroll_docs(4),
	['<C-y>'] = cmp.mapping.confirm({ select = true }),
	['<CR>'] = cmp.mapping.confirm({ select = true }),
	['<Tab>'] = cmp.mapping.confirm({ select = true }),
	-- ['<C-space>'] = cmp.mapping.complete(),
})

lsp_zero.setup_nvim_cmp({
mapping = cmp_mappings,
select_behaviour = 'insert'
})

local lua_opts = lsp_zero.nvim_lua_ls()
lspconfig.lua_ls.setup(lua_opts)

lspconfig.omnisharp.setup({
	settings = {
		["omnisharp"] = {
			enable_roslyn_analysers = true,
			enable_import_completion = true,
			organize_imports_on_format = true,
			filetypes = { "cs", "vb", "csproj", "sln", "slnx", "props" },
		},
	}
})

require("mason").setup({})

require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		"omnisharp",
	},
	handlers = {
		lsp_zero.default_setup,

		omnisharp = function()
			lspconfig.omnisharp.setup({
				handlers = { ["textDocument/definition"] = require("omnisharp_extended").handler },
			})
		end,
	},
})
