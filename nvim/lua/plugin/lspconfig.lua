local M = {
    "neovim/nvim-lspconfig",
    dependencies = {
        "mason-org/mason.nvim",
        "mason-org/mason-lspconfig.nvim",
        "folke/lazydev.nvim",
        "hrsh7th/cmp-nvim-lsp",
    },
}

function M.config()
    require("mason").setup()

	local install = {'lua_ls', 'pyright', 'clangd', 'rust_analyzer', 'ts_ls', 'jdtls'}
    require("mason-lspconfig").setup({
        ensure_installed = install
    })

    require("lazydev").setup({})

    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    local on_attach = function(_, bufnr)
        local opts = { silent = true, buffer = bufnr }

        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K", function()
			vim.lsp.buf.hover({border = 'rounded'})
		end, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "<C-s>", vim.lsp.buf.signature_help, opts)
        vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set("n", "<leader>wl", function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    end


	for _, i in ipairs(install) do
		vim.lsp.config(i, {
			capabilities = capabilities,
			on_attach = on_attach,
		})

		vim.lsp.enable(i)
	end
end

return M

