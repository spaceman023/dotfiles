require("bufferline").setup({
	options = {
		show_buffer_close_icons = false,
    color_icons = true,
		offsets = {
			{
				filetype = "nerdtree",
				text = "File Explorer",
				highlight = "Directory",
				text_align = "left",
			},
		},
		show_close_icon = false,
    separator_style = "slant",
	},
})
