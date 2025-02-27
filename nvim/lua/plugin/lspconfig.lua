local M = {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"folke/neodev.nvim" }
}

function M.config()
	require('mason').setup()
	require('mason-lspconfig').setup()
	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "rounded", -- Use single-line border
	})


	local lspconfig = require('lspconfig')
	local on_attach = function(_, bufnr)
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
	end

	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

	-- Enable the following language servers
	local servers = { 'clangd', 'rust_analyzer', 'pyright', 'ts_ls' }
	for _, lsp in ipairs(servers) do
		lspconfig[lsp].setup {
			on_attach = on_attach,
			capabilities = capabilities,
		}
	end

	require('neodev').setup {}
	lspconfig.lua_ls.setup {
		on_attach = on_attach,
		capabilities = capabilities,
		settings = {
			Lua = {
				completion = {
					callSnippet = 'Replace',
				},
				diagnostics = { disable = { "missing-fields" } },
			},
		},
	}

	-- lspconfig["dartls"].setup({
	-- 	capabilities = capabilities,
	-- 	cmd = {
	-- 		"dart",
	-- 		"language-server",
	-- 		"--protocol=lsp",
	-- 		-- "--port=8123",
	-- 		-- "--instrumentation-log-file=/users/robertbrunhage/desktop/lsp-log.txt",
	-- 	},
	-- 	filetypes = { "dart" },
	-- 	init_options = {
	-- 		onlyAnalyzeProjectsWithOpenFiles = false,
	-- 		suggestFromUnimportedLibraries = true,
	-- 		closingLabels = true,
	-- 		outline = false,
	-- 		flutterOutline = false,
	-- 	},
	-- 	settings = {
	-- 		dart = {
	-- 			-- analysisExcludedFolders = dartExcludedFolders,
	-- 			updateImportsOnRename = true,
	-- 			completeFunctionCalls = true,
	-- 			showTodos = true,
	-- 		},
	-- 	},
	-- })
end

return M
