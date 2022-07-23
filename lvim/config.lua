lvim.plugins = {
  { "lunarvim/colorschemes" },
  { "mhartington/oceanic-next" },
  { 'lervag/vimtex' },
  { 'github/copilot.vim' },
}
-- general
lvim.format_on_save = true
lvim.colorscheme = "OceanicNext"
lvim.leader = ";"
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
local function nmap(shortcut, command)
  lvim.keys.normal_mode[shortcut] = command
end

nmap("zz", ":update<cr>")
nmap("<leader>t", ":NvimTreeToggle<cr>:NvimTreeResize 40<cr>")
nmap("U", "<C-R>")
nmap("<Tab>", ":bnext<cr>")
nmap("s", "<C-w>")
nmap("E", ":lua vim.diagnostic.open_float()<cr>")
nmap("<C-A>", "ggVGy")
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.mappings = {
  custom_only = false,
  list = {
    { key = "s", cb = "<C-w>" }, --tree_cb and the cb property are deprecated
  },
}
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
}

-- enable css-modules in neovim
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true
vim.cmd([[
autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
]])


vim.cmd([[set clipboard=unnamedplus]])
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "denols" })
local denoOpts = {
  root_dir = function(fname)
    local util = require("lspconfig/util")
    return util.root_pattern("import_map.json")(fname)
  end,
} -- check the lspconfig documentation for a list of all possible options
require("lvim.lsp.manager").setup("denols", denoOpts)

-- need to override tsserver initroot because it will match any git repo
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "tsserver" })
local tsOpts = {
  root_dir = function(fname)
    local util = require("lspconfig/util")
    return util.root_pattern("tsconfig.json")(fname) or util.root_pattern("package.json", "jsconfig.json")(fname)
  end,
}
require("lvim.lsp.manager").setup("tsserver", tsOpts)
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
  {
    command = "prettierd",

    filetypes = {
      "typescript",
      "typescriptreact",
      "javascript",
      "javascriptreact",
      "jsonc",
      "json",
      "markdown",
      "yaml",
      "css",
      "html",
      "mdx",
    },
    condition = function(utils)
      return utils.root_has_file({ "tsconfig.json", "package.json", "jsconfig.json" })
    end,
  },
  {
    command = "deno_fmt",

    filetypes = {
      "typescript",
      "typescriptreact",
      "javascript",
      "javascriptreact",
    },
    condition = function(utils)
      return utils.root_has_file({ "import_map.json" })
    end,
  },

  init_options = {
    enable = true,
    lint = true,
    unstable = true,
  } })
vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
