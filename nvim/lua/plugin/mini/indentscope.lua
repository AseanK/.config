local M = { 'echasnovski/mini.indentscope', version = false }

function M.config()
	local m = require('mini.indentscope')
	m.setup(
		{
			-- Draw options
			draw = {
				delay = 100,
				animation = m.gen_animation.none(),
				priority = 2,
			},

			-- Module mappings. Use `''` (empty string) to disable one.
			mappings = {
				-- Textobjects
				object_scope = 'ii',
				object_scope_with_border = 'ai',

				-- Motions (jump to respective border line; if not present - body line)
				goto_top = '[i',
				goto_bottom = ']i',
			},

			-- Options which control scope computation
			options = {
				-- Type of scope's border: which line(s) with smaller indent to
				-- categorize as border. Can be one of: 'both', 'top', 'bottom', 'none'.
				border = 'both',

				-- Whether to use cursor column when computing reference indent.
				-- Useful to see incremental scopes with horizontal cursor movements.
				indent_at_cursor = true,

				-- Maximum number of lines above or below within which scope is computed
				n_lines = 10000,

				-- Whether to first check input line to be a border of adjacent scope.
				-- Use it if you want to place cursor on function header to get scope of
				-- its body.
				try_as_border = false,
			},

			-- Which character to use for drawing scope indicator
			symbol = '╎',
		}
	)
end

return M
