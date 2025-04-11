return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
		"leoluz/nvim-dap-go"
	},
	config = function()
		local dap = require('dap')
		local dapui = require('dapui')
		dapui.setup()

		require("dap-go").setup()
		require("dapui").setup()

		dap.listeners.after.event_initialized['dapui_config'] = function()
			dapui.open()
		end

		dap.listeners.before.event_terminated['dapui_config'] = function()
			dapui.close()
		end

		dap.listeners.before.event_exited['dapui_config'] = function()
			dapui.close()
		end

    vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
    vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end)
    vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint() end)
	end
}
