return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")

		---@diagnostic disable-next-line: missing-parameter
		harpoon:setup()

		local function map(lhs, rhs, opts)
			vim.keymap.set("n", lhs, rhs, opts or {})
		end

		map("<leader>a", function()
			harpoon:list():add()
		end, { desc = "Add file to harpoon" })
		map("<leader>h", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "Open harpoon menu" })
		map("<leader>jh", function()
			harpoon:list():select(1)
		end, { desc = "Harpoon file 1" })
		map("<leader>jj", function()
			harpoon:list():select(2)
		end, { desc = "Harpoon file 2" })
		map("<leader>jk", function()
			harpoon:list():select(3)
		end, { desc = "Harpoon file 3" })
		map("<leader>jl", function()
			harpoon:list():select(4)
		end, { desc = "Harpoon file 4" })
		map("<leader>jc", function()
			harpoon:list():clear()
		end, { desc = "Clear harpoon" })
	end,
}
