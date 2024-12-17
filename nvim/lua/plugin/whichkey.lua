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
		win = {
			-- don't allow the popup to overlap with the cursor
			no_overlap = true,
			padding = { 2, 2 }, -- extra window padding [top/bottom, right/left]
			title = false,
			zindex = 1000,
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
