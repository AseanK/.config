local M = {
	'nvim-flutter/flutter-tools.nvim',
	lazy = false,
	dependencies = {
		'nvim-lua/plenary.nvim',
		'stevearc/dressing.nvim', -- optional for vim.ui.select
		"dart-lang/dart-vim-plugin"
	},
	config = true,
}

function M.config()
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
	-- alternatively you can override the default configs
	require("flutter-tools").setup {
		ui = {
			-- the border type to use for all floating windows, the same options/formats
			-- used for ":h nvim_open_win" e.g. "single" | "shadow" | {<table-of-eight-chars>}
			border = "rounded",
			-- This determines whether notifications are show with `vim.notify` or with the plugin's custom UI
			-- please note that this option is eventually going to be deprecated and users will need to
			-- depend on plugins like `nvim-notify` instead.
		},
		decorations = {
			statusline = {
				-- set to true to be able use the 'flutter_tools_decorations.app_version' in your statusline
				-- this will show the current version of the flutter app from the pubspec.yaml file
				app_version = false,
				-- set to true to be able use the 'flutter_tools_decorations.device' in your statusline
				-- this will show the currently running device if an application was started with a specific
				-- device
				device = false,
				-- set to true to be able use the 'flutter_tools_decorations.project_config' in your statusline
				-- this will show the currently selected project configuration
				project_config = false,
			}
		},
		debugger = { -- integrate with nvim dap + install dart code debugger
			enabled = false,
			-- if empty dap will not stop on any exceptions, otherwise it will stop on those specified
			-- see |:help dap.set_exception_breakpoints()| for more info
			exception_breakpoints = {},
			-- Whether to call toString() on objects in debug views like hovers and the
			-- variables list.
			-- Invoking toString() has a performance cost and may introduce side-effects,
			-- although users may expected this functionality. null is treated like false.
			evaluate_to_string_in_debug_views = true,
			register_configurations = function(_)
				require("dap").configurations.dart = {
					type = "executable",
					command = vim.fn.stdpath("data") .. "/mason/bin/dart-debug-adapter",
					args = { "flutter" }
				}
				-- If you want to load .vscode launch.json automatically run the following:
				-- require("dap.ext.vscode").load_launchjs()
			end,
		},
		closing_tags = {
			-- highlight = "ErrorMsg", -- highlight for the closing tag
			prefix = "// ", -- character to use for close tag e.g. > Widget
			priority = 10, -- priority of virtual text in current line
			-- consider to configure this when there is a possibility of multiple virtual text items in one line
			-- see `priority` option in |:help nvim_buf_set_extmark| for more info
			enabled = true -- set to false to disable
		},
		dev_log = {
			enabled = false,
			filter = nil, -- optional callback to filter the log
			open_cmd = "15split", -- command to use to open the log buffer
		},
		dev_tools = {
			autostart = false, -- autostart devtools server if not detected
			auto_open_browser = false, -- Automatically opens devtools in the browser
		},
		outline = {
			open_cmd = "30vnew", -- command to use to open the outline buffer
			auto_open = false -- if true this will open the outline automatically when it is first populated
		},
		lsp = {
			color = { -- show the derived colours for dart variables
				enabled = false, -- whether or not to highlight color variables at all, only supported on flutter >= 2.10
				background = false, -- highlight the background
				background_color = nil, -- required, when background is transparent (i.e. background_color = { r = 19, g = 17, b = 24},)
				foreground = false, -- highlight the foreground
				virtual_text = true, -- show the highlight using virtual text
				virtual_text_str = "■", -- the virtual text character to highlight
			},
			-- on_attach = require("lspconfig").common_on_attach,
			on_attach = function(_, bufnr)
				-- your keymaps here
				local attach_opts = { silent = true, buffer = bufnr }
				vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, attach_opts)
				vim.keymap.set('n', 'gd', vim.lsp.buf.definition, attach_opts)
				vim.keymap.set('n', 'K', vim.lsp.buf.hover, attach_opts)
				vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, attach_opts)
				vim.keymap.set('n', '<C-s>', vim.lsp.buf.signature_help, attach_opts)
				vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, attach_opts)
				vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, attach_opts)
				vim.keymap.set('n', '<leader>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end,
					attach_opts)
				vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, attach_opts)
				vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, attach_opts)
				vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, attach_opts)
			end,
			capabilities = capabilities,
			settings = {
				dart = {
					tabSize = 4,
				}
			}
		}
	}
end

return M
