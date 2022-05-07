"Remaps
let mapleader = ";"

inoremap jj <Esc>
inoremap zz <Esc>:update<cr>gi
nnoremap <leader>k :LspHover<CR>
nnoremap zz :update<cr>
nnoremap <leader>t :NERDTree<CR>
nnoremap U <C-R>
nnoremap <Tab> :bnext<CR>
nnoremap <leader>r :Prettier<CR>
nnoremap s <C-w>
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

"PLUGINS
call plug#begin()

"Themes
Plug 'EdenEast/nightfox.nvim'
Plug 'relastle/bluewery.vim'
Plug 'projekt0n/github-nvim-theme'
Plug 'morhetz/gruvbox'
Plug 'gosukiwi/vim-atom-dark'

Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }
Plug 'github/copilot.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fireplace'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'kyazdani42/nvim-web-devicons' " Recommended (for coloured icons)
Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }

"Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

call plug#end() 

"Misc Settings
set nospell
set nowrap
set tabstop=2
set shiftwidth=2
set expandtab
set signcolumn=no
set relativenumber
set scrolloff=10

" Prettier Settings
let g:prettier#config#print_width = 'auto'
let g:prettier#config#tab_width = '2' 
let g:prettier#config#use_tabs = 'false'
let g:prettier#config#parser = ''
let g:prettier#config#config_precedence = 'file-override'
let g:prettier#config#prose_wrap = 'preserve'
let g:prettier#config#html_whitespace_sensitivity = 'css'
let g:prettier#config#require_pragma = 'false'
let g:prettier#config#end_of_line = get(g:, 'prettier#config#end_of_line', 'lf') 

" Clipboard Settings
set clipboard+=unnamedplus

" Color Settings
colorscheme nordfox 
set termguicolors
highlight clear LineNr
hi Normal guibg=NONE ctermbg=NONE
hi StatusLine ctermbg=NONE guibg=NONE
let g:airline_theme='minimalist'

" TreeSitter Settings
lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
    disable = {},
  },
  ensure_installed = {
    "tsx",
    "toml",
    "fish",
    "php",
    "json",
    "yaml",
    "swift",
    "html",
  },
  autotag = {
    enable = true,
  }
}
local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
EOF

" Bufferline Settings
lua << EOF
require("bufferline").setup{}
EOF
" NerdTree Settings
let NERDTreeMapOpenVSplit = 'v'
" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
