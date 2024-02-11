--Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
-- Set <space> as the leaderkey
-- See :h mapleader for more info
-- NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

return require('lazy').setup({

	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.5',
		-- or                            , branch = '0.1.x',
		dependencies = { 'nvim-lua/plenary.nvim'
		}
	},

	--Themes
{ "rose-pine/neovim", as = "rose-pine" },
	{ "dracula/vim",      as = "dracula" },

	--NvimTree
	{
		'nvim-tree/nvim-tree.lua',
		dependencies = {
			'nvim-tree/nvim-web-devicons', -- optional
		}
	},


	{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' },

	{
		'nvim-treesitter/nvim-treesitter',
		 build = ':TSUpdate'},
	'nvim-treesitter/playground',

	{ "ThePrimeagen/harpoon" },

	'mbbill/undotree',

	'tpope/vim-fugitive',

{
  -- amongst your other plugins
  {'akinsho/toggleterm.nvim', version = "*", config = true}
},

	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		dependencies = {
			--- Uncomment the two plugins below if you want to manage the language servers from neovim
			{ 'williamboman/mason.nvim' },
			{ 'williamboman/mason-lspconfig.nvim' },

			-- LSP Support
			{ 'neovim/nvim-lspconfig' },
			-- Autocompletion
			{ 'hrsh7th/nvim-cmp' },
			{ 'hrsh7th/cmp-nvim-lsp' },
			{ 'L3MON4D3/LuaSnip' },
		}
	},

	{
		"SmiteshP/nvim-navic",
		dependencies = "neovim/nvim-lspconfig"
	},

	'Hoffs/omnisharp-extended-lsp.nvim',

	'nvimtools/none-ls.nvim',

	{
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "williamboman/mason.nvim", "nvimtools/none-ls.nvim",
		}
	},

	'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
	'kosayoda/nvim-lightbulb',
	'onsails/lspkind.nvim',
	'hrsh7th/cmp-path',
	'hrsh7th/cmp-nvim-lua',
	'Issafalcon/lsp-overloads.nvim',
	'ray-x/lsp_signature.nvim',
	{
		'akinsho/bufferline.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		version = "*"
	},
	'rmagatti/goto-preview',
	'aznhe21/actions-preview.nvim',
	'tpope/vim-surround',
	'tpope/vim-repeat',
	'rcarriga/nvim-notify',
	'lukas-reineke/indent-blankline.nvim',
	'numToStr/Comment.nvim',
	'windwp/nvim-autopairs',
	'karb94/neoscroll.nvim',
	'norcalli/nvim-colorizer.lua',
	'HiPhish/rainbow-delimiters.nvim'
})
