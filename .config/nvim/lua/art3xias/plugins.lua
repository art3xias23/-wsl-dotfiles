return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = {":TSUpdate"},
		lazy = true
	},
	{"nvim-treesitter/playground", lazy = false},

	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		-- or                            , branch = '0.1.x',
		dependencies = { "nvim-lua/plenary.nvim" },
	},

{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		dependencies = {
			-- LSP Support
			{ 'neovim/nvim-lspconfig',            event = { "BufReadPre", "BufNewFile" }, lazy = true }, -- Required
			{
				-- Optional
				'williamboman/mason.nvim',
				build = function()
					pcall(vim.cmd, 'MasonUpdate')
				end,
			},
			{ 'williamboman/mason-lspconfig.nvim' }, -- Optional

			-- Autocompletion
			{ 'hrsh7th/nvim-cmp',                 lazy = true }, -- Required
			{ 'hrsh7th/cmp-nvim-lsp',             lazy = true }, -- Required
			{ 'L3MON4D3/LuaSnip',                 lazy = true } -- Required
		},
		lazy = false
	},

	--Themes
	{ "rose-pine/neovim", as = "rose-pine" },
	{ "dracula/vim", as = "dracula" },

{ 'jose-elias-alvarez/null-ls.nvim', lazy = true },

	{
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "williamboman/mason.nvim", "jose-elias-alvarez/null-ls.nvim",
		},
	},

	{
		"nvim-tree/nvim-tree.lua",
		dependencies = {
			"nvim-tree/nvim-web-devicons", -- optional
		},
	},

	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	},


	{ "ThePrimeagen/harpoon" },

	"mbbill/undotree",

	"tpope/vim-fugitive",

	{
		-- amongst your other plugins
		{ "akinsho/toggleterm.nvim", version = "*", config = true },
	},


	{
		"SmiteshP/nvim-navic",
		dependencies = "neovim/nvim-lspconfig",
	},
	"Hoffs/omnisharp-extended-lsp.nvim",

	{
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "williamboman/mason.nvim", "nvimtools/none-ls.nvim" },
	},

	"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
	"kosayoda/nvim-lightbulb",
	"onsails/lspkind.nvim",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-nvim-lua",
	"Issafalcon/lsp-overloads.nvim",
	"ray-x/lsp_signature.nvim",
	{
		"akinsho/bufferline.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		version = "*",
	},
	"rmagatti/goto-preview",
	"aznhe21/actions-preview.nvim",
	"tpope/vim-surround",
	"tpope/vim-repeat",
	"rcarriga/nvim-notify",
	"lukas-reineke/indent-blankline.nvim",
	"numToStr/Comment.nvim",
	"windwp/nvim-autopairs",
	"karb94/neoscroll.nvim",
	"norcalli/nvim-colorizer.lua",
	"HiPhish/rainbow-delimiters.nvim",
}
