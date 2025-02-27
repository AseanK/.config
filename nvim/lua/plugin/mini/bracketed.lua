local M = { "echasnovski/mini.bracketed", version = false }

function M.config()
	require("mini.bracketed").setup({
		-- See `:h MiniBracketed.config` for more info.
		buffer = { suffix = "b", options = {} },
		comment = { suffix = "c", options = {} },
		conflict = { suffix = "x", options = {} },
		diagnostic = { suffix = "d", options = {} },
		file = { suffix = "f", options = {} },
		indent = { suffix = "i", options = {} },
		jump = { suffix = "j", options = {} },
		location = { suffix = "l", options = {} },
		oldfile = { suffix = "o", options = {} },
		quickfix = { suffix = "q", options = {} },
		treesitter = { suffix = "t", options = {} },
		undo = { suffix = "u", options = {} },
		window = { suffix = "w", options = {} },
		yank = { suffix = "y", options = {} },
	})
end

return M
