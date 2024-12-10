return {
	"akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	version = "*",
	config = function()
		local mocha = require("catppuccin.palettes").get_palette("mocha")
		local bufferline = require("bufferline")
		bufferline.setup({
			options = {
				mode = "tabs",
			},
			highlights = require("catppuccin.groups.integrations.bufferline").get({
				custom = {
					mocha = {
						background = { fg = mocha.text }, -- cdd6f5
					},
				},
			}),
		})
	end,
}
