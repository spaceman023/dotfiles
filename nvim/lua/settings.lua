--Misc Settings
vim.opt.spell = false
vim.opt.wrap = false
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.scrolloff = 15
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.rnu = true
vim.cmd("set clipboard+=unnamedplus")
-- Prettier Settings
vim.cmd([[let g:prettier#config#tab_width = '2']])
vim.cmd([[let g:prettier#config#use_tabs = 'false']])
vim.cmd("colorscheme nightfox")
vim.g.airline_theme = "minimalist"

--Augroups
vim.cmd([[
augroup remember_folds
  autocmd!
  autocmd BufWinLeave *.* mkview
  autocmd BufWinEnter *.* silent! loadview
augroup END
]])
