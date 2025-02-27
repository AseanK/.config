local M = { "echasnovski/mini.files", version = false }

function M.config()
	vim.api.nvim_create_autocmd('User', {
		pattern = 'MiniFilesWindowOpen',
		callback = function(args)
			local win_id = args.data.win_id

			local config = vim.api.nvim_win_get_config(win_id)
			config.border, config.title_pos = 'single', 'left'
			vim.api.nvim_win_set_config(win_id, config)
		end,
	})

	vim.api.nvim_create_autocmd('User', {
		pattern = 'MiniFilesWindowUpdate',
		callback = function(args)
			local config = vim.api.nvim_win_get_config(args.data.win_id)

			-- Ensure fixed height
			config.height = 20

			vim.api.nvim_win_set_config(args.data.win_id, config)
		end,
	})

	require("mini.files").setup({
		vim.keymap.set("n", "<Leader>t", function()
			MiniFiles.open()
		end, { desc = "Mini Files", noremap = true }),
		content = {
			-- Predicate for which file system entries to show
			filter = nil,
			-- What prefix to show to the left of file system entry
			prefix = nil,
			-- In which order to show file system entries
			sort = nil,
		},

		-- Use `''` (empty string) to not create one.
		mappings = {
			close = "q",
			go_in = "L",
			go_in_plus = "l",
			go_out = "H",
			go_out_plus = "h",
			mark_goto = "g",
			mark_set = "m",
			reset = "<BS>",
			reveal_cwd = "@",
			show_help = "g?",
			synchronize = "<CR>",
			trim_left = "<",
			trim_right = ">",
		},

		-- General options
		options = {
			-- Whether to delete permanently or move into module-specific trash
			permanent_delete = true,
			-- Whether to use for editing directories
			use_as_default_explorer = false,
		},

		-- Customization of explorer windows
		windows = {
			-- Maximum number of windows to show side by side
			max_number = math.huge,
			-- Whether to show preview of file/directory under cursor
			preview = false,
			-- Width of focused window
			width_focus = 50,
			-- Width of non-focused window
			width_nofocus = 15,
			-- Width of preview window
			width_preview = 30,
		},
	})
end

return M
