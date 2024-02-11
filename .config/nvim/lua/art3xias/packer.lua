-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.5',
		-- or                            , branch = '0.1.x',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}

	--Themes
	use { "rose-pine/neovim", as = "rose-pine" }
	use { "dracula/vim", as = "dracula" }

	--NvimTree
	use {
		'nvim-tree/nvim-tree.lua',
		requires = {
			'nvim-tree/nvim-web-devicons', -- optional
		},
	}


	use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }

	use(
		'nvim-treesitter/nvim-treesitter',
		{ run = ':TSUpdate'
		})
	use('nvim-treesitter/playground')

	use("ThePrimeagen/harpoon")

	use('mbbill/undotree')

	use('tpope/vim-fugitive')

	use { "akinsho/toggleterm.nvim", tag = '*', config = function()
		require("toggleterm").setup()
	end }

	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		requires = {
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
	}

	use({
		"SmiteshP/nvim-navic",
		requires = "neovim/nvim-lspconfig"
	})

	use('Hoffs/omnisharp-extended-lsp.nvim')

	use('jose-elias-alvarez/null-ls.nvim')

	use({
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "williamboman/mason.nvim", "jose-elias-alvarez/null-ls.nvim",
		}
	})

	use('https://git.sr.ht/~whynothugo/lsp_lines.nvim')
	use('kosayoda/nvim-lightbulb')
	use('onsails/lspkind.nvim')
	use('hrsh7th/cmp-path')
	use('hrsh7th/cmp-nvim-lua')
	use('Issafalcon/lsp-overloads.nvim')
	use('ray-x/lsp_signature.nvim')
	use({'akinsho/bufferline.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		version = "*"})
	use('rmagatti/goto-preview')
	use('aznhe21/actions-preview.nvim')
	use('tpope/vim-surround')
	use('tpope/vim-repeat')
	use('rcarriga/nvim-notify')
	use('lukas-reineke/indent-blankline.nvim')
	use('numToStr/Comment.nvim')
	use('windwp/nvim-autopairs')
	use('karb94/neoscroll.nvim')
	use('norcalli/nvim-colorizer.lua')
	use('HiPhish/rainbow-delimiters.nvim')
	use('')
	use('')
	use('')
	use('')
	use('')
	use('')
	use('')
	use('')
end)
