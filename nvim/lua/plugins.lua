--plugins
local Plug = vim.fn["plug#"]
vim.call("plug#begin")
Plug("ckipp01/stylua-nvim")
Plug("prettier/vim-prettier", { ["do"] = vim.fn["yarn install --frozen-lockfile --production"] })
Plug("vim-airline/vim-airline")
Plug("vim-airline/vim-airline-themes")
Plug("scrooloose/nerdtree")
Plug("nvim-treesitter/nvim-treesitter", { ["do"] = vim.fn[":TSUpdate"] })
Plug("kyazdani42/nvim-web-devicons")
Plug("akinsho/bufferline.nvim", { ["tag"] = "v2.*" })
--themes
Plug("EdenEast/nightfox.nvim")
Plug("relastle/bluewery.vim")
Plug("projekt0n/github-nvim-theme")
Plug("morhetz/gruvbox")
Plug("gosukiwi/vim-atom-dark")
--Telescope
Plug("nvim-lua/plenary.nvim")
Plug("nvim-telescope/telescope.nvim")
--LSP and Autocomplete
Plug("neovim/nvim-lspconfig")
Plug("mattn/emmet-vim")
Plug("hrsh7th/cmp-nvim-lsp")
Plug("hrsh7th/cmp-buffer")
Plug("hrsh7th/cmp-path")
Plug("hrsh7th/cmp-cmdline")
Plug("hrsh7th/nvim-cmp")
Plug("hrsh7th/cmp-vsnip")
Plug("hrsh7th/vim-vsnip")
--Language Specific
Plug("fatih/vim-go", { ["do"] = vim.fn[":GoUpdateBinaries"] })
vim.call("plug#end")

