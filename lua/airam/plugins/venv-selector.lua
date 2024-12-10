return {
	"linux-cultist/venv-selector.nvim",
	dependencies = {
		-- "neovim/nvim-lspconfig",
		-- "mfussenegger/nvim-dap",
		-- "mfussenegger/nvim-dap-python", --optional
		-- { "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
	},
	lazy = false,
	branch = "regexp", -- This is the regexp branch, use this for the new version
	options = {
		-- add options here
	},
	config = function()
		require("venv-selector").setup()
	end,
	keys = {
		{ "<leader>v", "<cmd>VenvSelect<cr>", desc = "Open python venv selector" },
	},
}
