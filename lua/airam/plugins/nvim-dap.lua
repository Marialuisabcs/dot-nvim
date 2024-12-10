return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"mfussenegger/nvim-dap-python",
		"nvim-neotest/nvim-nio",
	},
	config = function()
		local keymap = vim.keymap

		local dap, dapui, dap_python = require("dap"), require("dapui"), require("dap-python")

		-- dap python config
		local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
		dap_python.setup(path)

		-- dap ui config
		dapui.setup()

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		-- keymaps configs
		keymap.set("n", "<Leader>db", ":DapToggleBreakpoint<CR>")
		keymap.set("n", "<F5>", ":DapContinue<CR>")
		keymap.set("n", "<Leader>dx", ":DapTerminate<CR>")
		keymap.set("n", "<Leader>do", ":DapStepOver<CR>")
	end,
}
