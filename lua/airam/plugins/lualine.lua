return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	opts = function()
		local utils = require("airam.core.utils")
		local copilot_colors = {
			[""] = utils.get_hlgroup("Comment"),
			["Normal"] = utils.get_hlgroup("Comment"),
			["Warning"] = utils.get_hlgroup("DiagnosticError"),
			["InProgress"] = utils.get_hlgroup("DiagnosticWarn"),
		}

		return {
			options = {
				component_separators = { left = " ", right = " " },
				section_separators = { left = " ", right = " " },
				theme = "auto",
				globalstatus = true,
				disabled_filetypes = { statusline = { "dashboard", "alpha" } },
			},
			sections = {
				lualine_a = { { "mode", icon = "" } },
				lualine_b = { { "branch", icon = "" } },
				lualine_c = {
					{
						"diagnostics",
						symbols = {
							error = " ",
							warn = " ",
							info = " ",
							hint = "󰝶 ",
						},
					},
					{ "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
					{
						"filename",
						symbols = { modified = "  ", readonly = "", unnamed = "" },
					},
					{
						function()
							return require("nvim-navic").get_location()
						end,
						cond = function()
							return package.loaded["nvim-navic"] and require("nvim-navic").is_available()
						end,
						color = utils.get_hlgroup("Comment", nil),
					},
				},
				lualine_x = {
					{
						require("lazy.status").updates,
						cond = require("lazy.status").has_updates,
						color = utils.get_hlgroup("DiffAdd"),
					},
					{
						function()
							local icon = " "
							local status = require("copilot.api").status.data
							return icon .. (status.message or "")
						end,
						cond = function()
							local ok, clients = pcall(vim.lsp.get_clients, { name = "copilot", bufnr = 0 })
							return ok and #clients > 0
						end,
						color = function()
							if not package.loaded["copilot"] then
								return
							end
							local status = require("copilot.api").status.data
							return copilot_colors[status.status] or copilot_colors[""]
						end,
					},
					{ "diff" },
				},
				lualine_y = {
					{
						"progress",
					},
					{
						"location",
						color = utils.get_hlgroup("DiffChange"),
					},
				},
				lualine_z = {
					function()
						return "  " .. os.date("%X") .. " 🚀 "
					end,
				},
			},

			extensions = { "lazy", "toggleterm", "mason", "neo-tree", "trouble" },
		}
	end,
	-- [ALTERNATIVE CONFIG]
	-- "nvim-lualine/lualine.nvim",
	-- dependencies = { "nvim-tree/nvim-web-devicons" },
	-- config = function()
	-- 	local lualine = require("lualine")
	-- 	local lazy_status = require("lazy.status") -- to configure lazy pending updates count
	--
	-- 	local colors = {
	-- 		blue = "#65D1FF",
	-- 		green = "#3EFFDC",
	-- 		violet = "#FF61EF",
	-- 		yellow = "#FFDA7B",
	-- 		red = "#FF4A4A",
	-- 		fg = "#c3ccdc",
	-- 		bg = "#112638",
	-- 		inactive_bg = "#2c3043",
	-- 	}
	--
	-- 	local my_lualine_theme = {
	-- 		normal = {
	-- 			a = { bg = colors.blue, fg = colors.bg, gui = "bold" },
	-- 			b = { bg = colors.bg, fg = colors.fg },
	-- 			c = { bg = colors.bg, fg = colors.fg },
	-- 			z = { bg = colors.bg, fg = colors.fg },
	-- 		},
	-- 		insert = {
	-- 			a = { bg = colors.green, fg = colors.bg, gui = "bold" },
	-- 			b = { bg = colors.bg, fg = colors.fg },
	-- 			c = { bg = colors.bg, fg = colors.fg },
	-- 			z = { bg = colors.bg, fg = colors.fg },
	-- 		},
	-- 		visual = {
	-- 			a = { bg = colors.violet, fg = colors.bg, gui = "bold" },
	-- 			b = { bg = colors.bg, fg = colors.fg },
	-- 			c = { bg = colors.bg, fg = colors.fg },
	-- 			z = { bg = colors.bg, fg = colors.fg },
	-- 		},
	-- 		command = {
	-- 			a = { bg = colors.yellow, fg = colors.bg, gui = "bold" },
	-- 			b = { bg = colors.bg, fg = colors.fg },
	-- 			c = { bg = colors.bg, fg = colors.fg },
	-- 			z = { bg = colors.bg, fg = colors.fg },
	-- 		},
	-- 		replace = {
	-- 			a = { bg = colors.red, fg = colors.bg, gui = "bold" },
	-- 			b = { bg = colors.bg, fg = colors.fg },
	-- 			c = { bg = colors.bg, fg = colors.fg },
	-- 			z = { bg = colors.bg, fg = colors.fg },
	-- 		},
	-- 		inactive = {
	-- 			a = { bg = colors.inactive_bg, fg = colors.semilightgray, gui = "bold" },
	-- 			b = { bg = colors.inactive_bg, fg = colors.semilightgray },
	-- 			c = { bg = colors.inactive_bg, fg = colors.semilightgray },
	-- 			z = { bg = colors.bg, fg = colors.fg },
	-- 		},
	-- 	}
	--
	-- 	-- configure lualine with modified theme
	-- 	lualine.setup({
	-- 		options = {
	-- 			theme = my_lualine_theme,
	-- 		},
	-- 		sections = {
	-- 			lualine_x = {
	-- 				{
	-- 					lazy_status.updates,
	-- 					cond = lazy_status.has_updates,
	-- 					color = { fg = "#ff9e64" },
	-- 				},
	-- 				{ "encoding" },
	-- 				{ "fileformat" },
	-- 				{ "filetype" },
	-- 			},
	-- 			lualine_z = {
	-- 				{
	-- 					"datetime",
	-- 					style = "%H:%M",
	-- 				},
	-- 			},
	-- 		},
	-- 	})
	-- end,
}
