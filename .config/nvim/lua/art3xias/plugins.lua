return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = { ":TSUpdate" },
		lazy = true,
	},
	{ "nvim-treesitter/playground",      lazy = false },

	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		-- or                            , branch = '0.1.x',
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		dependencies = {
			-- LSP Support
			{ "neovim/nvim-lspconfig",            event = { "BufReadPre", "BufNewFile" }, lazy = true }, -- Required
			{
				-- Optional
				"williamboman/mason.nvim",
				build = function()
					pcall(vim.cmd, "MasonUpdate")
				end,
			},
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional

			-- Autocompletion
			{ "hrsh7th/nvim-cmp",                 lazy = true }, -- Required
			{ "hrsh7th/cmp-nvim-lsp",             lazy = true }, -- Required
			{ "L3MON4D3/LuaSnip",                 lazy = true }, -- Required
			{ "saadparwaiz1/cmp_luasnip" },
		},
		lazy = false,
	},

	--Themes
	{ "rose-pine/neovim",                as = "rose-pine" },
	{ "dracula/vim",                     as = "dracula" },
	{ "Mofiqul/vscode.nvim",             as = "vscode" },

	{ "jose-elias-alvarez/null-ls.nvim", lazy = true },

	{
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "williamboman/mason.nvim", "jose-elias-alvarez/null-ls.nvim" },
	},

	{
		"nvim-tree/nvim-tree.lua",
		dependencies = {
			"nvim-tree/nvim-web-devicons", -- optional
		},
	},

	{ "ThePrimeagen/harpoon" },

	"tpope/vim-fugitive",

	{
		-- amongst your other plugins
		{ "akinsho/toggleterm.nvim", version = "*", config = true },
	},

	"Hoffs/omnisharp-extended-lsp.nvim",
	"karb94/neoscroll.nvim",
	-- Commenting and Uncommenting

	{
		"numToStr/Comment.nvim",
		lazy = false,
	},

	-- Nice suggested actions previewer 
	{ 'aznhe21/actions-preview.nvim',        lazy = true },
}
