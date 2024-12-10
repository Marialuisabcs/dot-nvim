return {
	"catppuccin/nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "mocha",
			transparent_background = true,
			show_end_of_buffer = false,
			term_colors = false,
			default_integrations = true,
			integrations = {
				alpha = true,
			},
			custom_highlights = function(colors)
				return {
					AlphaHeader = { fg = colors.mauve },
				}
			end,
		})
		vim.cmd("colorscheme catppuccin")
	end,
}
