--TreeSitter
local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
require("nvim-treesitter.configs").setup({
	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
	},
	ensure_installed = {
    "go",
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
	},
})
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
