--Maintainer:	Kostantin Milchev <konstantin.milchev@gmail.com>
-- Last change:	2023 May 19
--Local Lua Variables: {{{
local api=vim.api 
local cmd=vim.cmd
local autocmd=api.nvim_create_autocmd
local customcmd=api.nvim_add_user_command
local Plug = vim.fn['plug#']
local call=vim.call
--}}}

-- Local Lua Config Functions: {{{
local function map(mode, combo, mapping, opts)
  local options = {noremap = true}
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, combo, mapping, options)
end

function map(mode, shortcut, command)
	vim.api.nvim_set_keymap(mode, shortcut, command, {noremap=true, silent=true})
end

function nmap(shortcut, command)
	map('n', shortcut, command)
end

function imap(shortcut, command)
	map('i', shortcut, command)
end

function omap(shortcut, command)
	map('o', shortcut, command)
end
-- }}}

--Options: {{{
vim.opt.number = true
vim.opt.autoindent=true
vim.opt.tabstop= 4
vim.opt.shiftwidth= 4
vim.opt.smarttab =true
vim.opt.softtabstop = -1
vim.opt.mouse="a"
vim.opt.encoding="utf-8"

vim.opt.backspace=indent,eol,start
vim.opt.expandtab = true
vim.opt.shiftround = true
vim.opt.shiftwidth=4
vim.opt.softtabstop=-1
vim.opt.tabstop=8
vim.opt.textwidth=80
vim.opt.title = true
vim.opt.hidden = true
--vim.opt.nofixendofline=true
----vim.opt.nostartofline=true
--vim.opt.splitbelow=true
--vim.opt.splitright=true
--cmd
--vim.opt.nohlsearch=true
--vim.opt.incsearch=true
--vim.opt.laststatus=2
--vim.opt.nonumber=true
--vim.opt.noruler=true
--vim.opt.noshowmode=true
--vim.opt.signcolumn='yes'
--vim.opt.mouse=a
--vim.opt.updatetime=1000
--}}}

-- Plugs: {{{
call('plug#begin', '~/.config/nvim/plugged')

	-- Surrounding ysw
	Plug 'https://github.com/tpope/vim-surround.git'
	-- For Commenting gcc & gc
	Plug 'https://github.com/tpope/vim-commentary'
	Plug 'https://github.com/dhruvasagar/vim-table-mode.git'
	Plug ('instant-markdown/vim-instant-markdown', {['for']= 'markdown', ['do']= 'yarn install'})
	-- Lean and mean status/tabline for vim
	Plug 'vim-airline/vim-airline'
	Plug 'sheerun/vim-polyglot'
	Plug ('junegunn/fzf', { ['do'] = vim.fn['fzf#install']})
 	Plug 'OmniSharp/omnisharp-vim'
	-- Pup up menu for autocompletions
	Plug ('neoclide/coc.nvim', {branch = 'release'})
  Plug 'ellisonleao/gruvbox.nvim'
	-- automatic balancing for lisp parantheses
	Plug 'gpanders/nvim-parinfer'
	Plug 'nvim-tree/nvim-tree.lua'
  Plug 'nvim-tree/nvim-web-devicons'
	-- Dev tools for support of nvlime
	Plug 'monkoose/parsley'
	-- Common lisp dev environment for nvim
	Plug 'monkoose/nvlime'
	-- Autocompletion
	Plug 'https://github.com/hrsh7th/nvim-cmp'


call('plug#end')
-- }}}
 

-- Settings: {{{
cmd('filetype indent plugin on')

cmd 
[[
	if !exists('g:syntax_on') | syntax enable | endif
]]

-- Use truecolor in the terminal, when it is supported
cmd [[
if has('termguicolors')
  set termguicolors
endif
]]

vim.fn.scriptencoding="utf-8"
-- }}}

-- Auto Commands: {{{
autocmd("Bufenter", {command=[[silent! lcd %:p:hE]]})
---}}}

--- Colors: {{{

--These preferences clear some gruvbox background colours, allowing transparency
local colorGrp = api.nvim_create_augroup("ColorschemePreferences", {clear=true})

autocmd("ColorScheme", {
	command = "highlight SignColumn ctermbg=NONE guibg=NONE",
	group = colorGrp})

autocmd("ColorScheme", {
	command = "highlight Todo ctermbg=NONE guibg=NONE",
	group = colorGrp})


cmd([[
	colorscheme gruvbox
]])

vim.o.background="dark"
vim.g.gruvbox_contrast_dark = 'hard'
-- }}}

-- Mappings: {{{

nmap("gt", [[
:execute "rightbelow split " . bufname("#")<cr>
]])

-- operator mapping replacing p with i( which stands for change inside paranthesis'
--useful with cp or dp mappings

omap('p','i(')

-- use jk and kj to save a file in insert mode
imap('jk', '<esc>:w<cr>')
imap('kj', '<esc>:w<cr>')

-- Unmap esc in insert mode, nop is no operation
imap('<esc>', '<nop>')

--map leader
vim.g.mapleader = ","

--Open vimrc in normal mode with leader ev
nmap('<leader>ev', ':split $MYVIMRC<cr>')

--Refresh vimrc in normal mode with leader sv
nmap('<leader>sv',':source $MYVIMRC<cr>')

nmap('<leader>te', ':term ++close<cr>')
nmap('/', [[/\c]])
nmap('?', [[?\c]])
nmap('<leader>n', ':nohlsearch<cr>')

--look in re
nmap('fz',':FZF <CR>')

-- Buffers
--Move to the previous buffer with "gp"
nmap('gp',  ':bp<CR>')
-- Move to the next buffer with "gn"
nmap('gn', ':bn<CR>')
-- List all possible buffers with "gl"
nmap('gl', ':ls<CR>')

-- List all possible buffers with "gb" and accept a new buffer argument [1]
nmap('gb', ':ls<CR>:b')
--}}}

--Abreviation: {{{
cmd([[iabbrev esle else]])
--}}}

--VimScript file: {{{
local filetype_grp = api.nvim_create_augroup("filetype_vim", {clear = true})

vim.o.foldenable=true

autocmd("BufEnter", { 
		command = [[setlocal foldmethod=marker]],
		pattern='init.lua',
		group = filetype_grp
	})
--}}}

-- nvim-tree {{{
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()
-- }}}
-- Coc Config: {{{
vim.cmd([[inoremap <silent><expr> <CR>
                    \ coc#pum#visible() ? coc#pum#confirm()
                    \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]])

vim.cmd([[inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()]])

-- }}}
