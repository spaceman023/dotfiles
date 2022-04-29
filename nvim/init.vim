let mapleader = ";"
"Remaps
:inoremap jj <Esc>
:nnoremap <leader>s <C-w>
:nnoremap <leader>k :LspHover<CR>
"PLUGINS
call plug#begin()
Plug 'relastle/bluewery.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
Plug 'gosukiwi/vim-atom-dark'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fireplace'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

call plug#end() 
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
colorscheme bluewery
set termguicolors
highlight clear LineNr
hi Normal guibg=NONE ctermbg=NONE
hi StatusLine ctermbg=NONE guibg=NONE
set signcolumn=no
set relativenumber
let g:airline_theme='minimalist'
