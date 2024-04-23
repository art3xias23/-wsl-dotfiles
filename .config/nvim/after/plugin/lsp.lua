local lsp_zero = require("lsp-zero")
lsp_zero.on_attach(function(_, bufnr)
	lsp_zero.default_keymaps({ buffer = bufnr })
end)

require("neodev").setup({
	library = {
		plugins = {
			"nvim-dap-ui",
		},
		types = true,
	},
})
local lspconfig = require("lspconfig")

local cmp = require("cmp")
cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		["<Tab>"] = cmp.mapping.confirm({ select = true }),
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "omnisharp" },
		{ name = "tsserver" },
		{ name = "lua_ls" },
	}),
})

-- Set up Mason, a package manager for LSP servers, formatters, and linters
require("mason").setup({})
-- add any options here, or leave empty to use the default settings

require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		"omnisharp",
		"html",
		"cssls",
		"tsserver",
		"emmet_ls",
		"tailwindcss",
		"gopls",
		"templ",
		"html",
	},
	handlers = {
		lsp_zero.default_setup,

		omnisharp = function()
			lspconfig.omnisharp.setup({
				handlers = { ["textDocument/definition"] = require("omnisharp_extended").handler },
				settings = {
					["omnisharp"] = {
						enable_roslyn_analysers = true,
						enable_import_completion = true,
						organize_imports_on_format = true,
						filetypes = { "cs", "vb", "csproj", "sln", "slnx", "props" },
					},
				},
			})
		end,

		lua_ls = function()
			lspconfig.lua_ls.setup({
				on_attach = lsp_zero.on_attach,
				settings = {
					Lua = {
						callSnippet = "Replace",
						runtime = {
							version = "LuaJIT",
						},
						diagnostics = {
							globals = { "vim" },
						},
						workspace = {
							library = vim.api.nvim_get_runtime_file("", true),
						},
						telemetry = {
							enabled = false,
						},
					},
				},
			})
		end,

		emmet_ls = function()
			lspconfig.emmet_ls.setup({
				on_attach = lsp_zero.on_attach,
				capabilities = lsp_zero.capabilities,
				filetypes = {
					"css",
					"eruby",
					"html",
					"javascript",
					"javascriptreact",
					"less",
					"sass",
					"scss",
					"svelte",
					"pug",
					"typescriptreact",
					"vue",
				},
				init_options = {
					html = {
						options = {
							-- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
							["bem.enabled"] = true,
						},
					},
				},
			})
		end,

		templ = function()
			lspconfig.templ.setup({
				on_attach = lsp_zero.on_attach,
				capabilities = lsp_zero.capabilities,
			})
		end,

		html = function()
			lspconfig.html.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				filetypes = { "html", "templ" },
			})
		end,

		tailwindcss = function()
			lspconfig.tailwindcss.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				filetypes = { "templ", "astro", "javascript", "typescript", "react" },
				init_options = { userLanguages = { templ = "html" } },
			})
		end,

		gopls = function()
			lspconfig.gopls.setup({
				on_attach = on_attach_vim,
				capabilities = capabilities,
				cmd = { "gopls", "serve" },
				settings = {
					gopls = {
						analyses = {
							unusedparams = true,
							shadow = true, -- enable shadow variable checks
						},
						staticcheck = true,
						linksInHover = false,
						codelenses = {
							generate = true,
							gc_details = true,
							regenerate_cgo = true,
							tidy = true,
							upgrade_dependency = true,
							vendor = true,
						},
						usePlaceholders = true,
						experimentalPostfixCompletions = true,
						hoverKind = "FullDocumentation",
					},
				},
			})
		end,
	},
})
