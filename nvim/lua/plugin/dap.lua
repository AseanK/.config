local M = {
	'mfussenegger/nvim-dap',
	dependencies = {
		'nvim-neotest/nvim-nio',
		'rcarriga/nvim-dap-ui',
		-- Installs the debug adapters for you
		'williamboman/mason.nvim',
		'jay-babu/mason-nvim-dap.nvim',

		-- Add your own debuggers here
		'leoluz/nvim-dap-go',
	}
}

function M.config()
	local dap = require("dap")
	local dapui = require("dapui")
	vim.keymap.set("n", "<F5>", function() dap.continue() end)
	vim.keymap.set("n", "<F2>", function() dap.step_into() end)
	vim.keymap.set("n", "<F3>", function() dap.step_over() end)
	vim.keymap.set("n", "<F4>", function() dap.step_out() end)
	vim.keymap.set("n", "<F1>", function() dap.toggle_breakpoint() end)
	vim.keymap.set("n", "<F12>", function() dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ') end)
	vim.keymap.set("n", "<F6>", function() dapui.toggle() end)

	require("mason-nvim-dap").setup({
		automatic_installation = true,
	})

	dapui.setup()

	dap.listeners.after.event_initialized['dapui_config'] = dapui.open
	dap.listeners.before.event_terminated['dapui_config'] = dapui.close
	dap.listeners.before.event_exited['dapui_config'] = dapui.close

	require('dap-go').setup {
		delve = {
			detached = vim.fn.has 'win32' == 0,
		},
	}
end

return M
