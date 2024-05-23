local M = {}

M.todo = function(args)
	local command = string.format("!%s %s", vim.fn.expand("$HOME/Projects/Todos/rust/todo/target/debug/testi"), args)
	require("noice").redirect(string.format(command))
end

return M
