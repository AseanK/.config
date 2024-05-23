local M = {
	"folke/which-key.nvim",
}

function M.config()
	local which_key = require("which-key")
	which_key.setup({
		plugins = {
			marks = true,
			registers = true,
			spelling = {
				enabled = true,
				suggestions = 20,
			},
			presets = {
				operators = false,
				motions = false,
				text_objects = false,
				windows = true,
				nav = false,
				z = false,
				g = false,
			},
		},
		motions = {
			count = true,
		},
		window = {
			border = "none",
			position = "bottom",
			margin = { 10, 10, 2, 10 },
			padding = { 2, 2, 2, 2 },
			winblend = 0,
		},
		layout = {
			spacing = 3,
			align = "center",
		},
		show_help = false,
		show_keys = false,
		triggers = "auto",
	})
end

return M
