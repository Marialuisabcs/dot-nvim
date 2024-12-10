return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")

		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			-- list of servers for mason to install
			ensure_installed = {
				-- "tsserver",
				-- "html",
				-- "cssls",
				-- "tailwindcss",
				-- "svelte",
				-- "lua_ls",
				-- "graphql",
				-- "emmet_ls",
				-- "prismals",
				"pyright",
				"ruff",
			},
		})

		mason_tool_installer.setup({
			ensure_installed = {
				-- "prettier",
				-- "eslint_d",
				"stylua",
				"debugpy",
				"black", -- python formatter - code formatter
				"python-lsp-server",
				-- "deno",
				-- "mypy",
				-- "isort", -- python formatter - sort imports
				-- "ltex-ls",
				-- "sqlfluff",
				-- "jsonlint",
				-- "codespell",
			},
		})
	end,
}
