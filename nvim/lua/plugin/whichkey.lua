local M = {
	"folke/which-key.nvim",
	event = "VeryLazy",
}

function M.config()
	local which_key = require("which-key")
	which_key.setup({
		preset = "modern",
		delay = 500,
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
		win = {
			-- don't allow the popup to overlap with the cursor
			no_overlap = true,
			padding = { 0, 0 }, -- extra window padding [top/bottom, right/left]
			title = false,
			zindex = 1000,
			wo = {
				winblend = 0,
			},
		},
		layout = {
			spacing = 3,
			align = "center",
		},
		show_help = false,
		show_keys = false,
	})
end

return M
