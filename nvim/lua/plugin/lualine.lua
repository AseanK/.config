local M = {
	-- Set lualine as statusline
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		'arkav/lualine-lsp-progress',
		"letieu/harpoon-lualine",
	},
}

function M.config()
	-- FileName
	local custom_fname = require('lualine.components.filename'):extend()
	local highlight = require 'lualine.highlight'
	local default_status_colors = { saved = '#98c379', modified = '#61afef' }

	function custom_fname:init(options)
		custom_fname.super.init(self, options)
		self.status_colors = {
			saved = highlight.create_component_highlight_group(
				{ bg = default_status_colors.saved, gui = 'bold' }, 'filename_status_saved', self.options),
			modified = highlight.create_component_highlight_group(
				{ bg = default_status_colors.modified, gui = 'bold' }, 'filename_status_modified', self.options),
		}
		if self.options.color == nil then self.options.color = '' end
	end

	function custom_fname:update_status()
		local data = custom_fname.super.update_status(self)
		data = highlight.component_format_highlight(vim.bo.modified
			and self.status_colors.modified
			or self.status_colors.saved) .. data
		return data
	end

	require("lualine").setup({
		options = {
			icons_enabled = true,
			theme = "auto",
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
			disabled_filetypes = {
				statusline = {},
				winbar = {},
			},
			ignore_focus = {},
			always_divide_middle = true,
			globalstatus = false,
			refresh = {
				statusline = 100,
				tabline = 100,
				winbar = 100,
			},
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch", "diff" },
			lualine_c = { },
			lualine_x = {
				{
					'lsp_progress',
					display_components = { 'lsp_client_name', 'spinner', { 'percentage' } },
					timer = { progress_enddelay = 100, spinner = 150, lsp_client_name_enddelay = 100 },
					spinner_symbols = { " ", "▏", "▎", "▍", "▌", "▋", "▊", "▉", "█" },
				},
			},
			lualine_y = { "filetype", "filesize" },
			lualine_z = { "location" },
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = {},
			lualine_x = { "location" },
			lualine_y = {},
			lualine_z = {},
		},
		tabline = {
			lualine_c = {
				{"harpoon2",
					icon = ' ',
					indicators = { "h", "j", "k", "l" },
					active_indicators = { "[h]", "[j]", "[k]", "[l]" },
					color_active = { fg = '#98c379' },
					_separator = " ",
					no_harpoon = "Harpoon not loaded",}
			},
			lualine_y = { 'diagnostics' },
			lualine_z = { custom_fname },
		},
		winbar = {},
		inactive_winbar = {},
		extensions = {},
	})
end

return M
