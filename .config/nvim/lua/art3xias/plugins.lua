return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = { ":TSUpdate" },
		lazy = true,
	},
	{ "nvim-treesitter/playground", lazy = false },

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
			{ "neovim/nvim-lspconfig", event = { "BufReadPre", "BufNewFile" }, lazy = false }, -- Required
			{
				-- Optional
				"williamboman/mason.nvim",
				build = function()
					pcall(vim.cmd, "MasonUpdate")
				end,
			},
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional

			-- Autocompletion
			{ "hrsh7th/nvim-cmp", lazy = true }, -- Required
			{ "hrsh7th/cmp-nvim-lsp", lazy = true }, -- Required
			{ "L3MON4D3/LuaSnip", lazy = true }, -- Required
			{ "saadparwaiz1/cmp_luasnip" },
		},
		lazy = false,
	},

	--Themes
	{ "rose-pine/neovim", as = "rose-pine" },
	{ "dracula/vim", as = "dracula" },
	{ "Mofiqul/vscode.nvim", as = "vscode" },

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

	-- "tpope/vim-fugitive",

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
	{ "aznhe21/actions-preview.nvim", lazy = true },

	-- Nice looking intro page
	{ "goolord/alpha-nvim", dependencies = { "nvim-tree/nvim-web-devicons" }, lazy = true },

	--pair brackets etc
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {}, -- this is equalent to setup({}) function
	},

	--open buffers in tabs and style them
	{ "akinsho/bufferline.nvim", version = "*", dependencies = "nvim-tree/nvim-web-devicons" },

	--autoclose html tags
	{ "windwp/nvim-ts-autotag", lazy = true },

	-- search highlight and additional helpers
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		---@type Flash.Config
		opts = {},
		-- stylua: ignore
		keys = {
		},
	},
	--markdown visualiser
	{ "ellisonleao/glow.nvim", config = true, cmd = "Glow" },

	--highligh redo items
	{
		"tzachar/highlight-undo.nvim",
		opts = {
			...,
		},
	},
	{ "kosayoda/nvim-lightbulb" },
	{ "mfussenegger/nvim-dap" },
	--Currently not working. Issue is open on github for WSL
	{
		"https://github.com/adelarsq/image_preview.nvim",
		event = "VeryLazy",
		config = function()
			require("image_preview").setup()
		end,
	},
	-- Signature help, docs and completion for the nvim lua api
	{ "folke/neodev.nvim", opts = {} }
}
