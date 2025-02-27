vim.g.mapleader = " "

vim.g.maplocalleader = " "

-- [[ Basic Keymaps ]]
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')
vim.keymap.set("x", "<leader>p", '"_dp')
-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })

-- more good
vim.keymap.set({ "n", "o", "x" }, "<s-h>", "^")
vim.keymap.set({ "n", "o", "x" }, "<s-l>", "g_")

vim.keymap.set("n", "<Leader>b", "<C-^>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { noremap = true })

vim.keymap.set({ "n", "x", "o" }, "s", "<Plug>(leap-forward)")
vim.keymap.set({ "n", "x", "o" }, "S", "<Plug>(leap-backward)")
vim.keymap.set({ "n", "x", "o" }, "gs", "<Plug>(leap-from-window)")

-- Custom plugins
vim.api.nvim_create_user_command("Todo", function(opts)
	package.loaded.custom = nil
	require("custom").todo(opts.args)
end, { nargs = "?" })
