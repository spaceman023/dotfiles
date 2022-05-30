
--Remaps
--utility functions
function map(mode, shortcut, command)
	vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

function nmap(shortcut, command)
	map("n", shortcut, command)
end

function imap(shortcut, command)
	map("i", shortcut, command)
end
--adding the Remaps
vim.g.mapleader = ";"
imap("jj", "<Esc>")
imap("zz", "<Esc>:update<cr>gi")
nmap("<leader>k", ":LspHover<CR>")
nmap("zz", ":update<cr>")
nmap("<leader>t", ":NERDTree<CR>")
nmap("U", "<C-R>")
nmap("<Tab>", ":bnext<CR>")
nmap("<leader>r", ":Prettier<CR>")
nmap("s", "<C-w>")
nmap("<leader>ff", "<cmd>Telescope find_files<cr>")
nmap("<leader>fg", "<cmd>Telescope live_grep<cr>")
nmap("<leader>fb", "<cmd>Telescope buffers<cr>")
nmap("<leader>fh", "<cmd>Telescope help_tags<cr>")

nmap("<leader>fl", [[<cmd>lua require("stylua-nvim").format_file()<CR>]])
