local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
-- lazy.vim plugins
require("lazy").setup({
	-- Git related plugins
	"tpope/vim-fugitive",
	"tpope/vim-rhubarb",
	-- Detect tabstop and shiftwidth automatically
	"tpope/vim-sleuth",

	-- smooth scroll [Not activate]
	-- "karb94/neoscroll.nvim",

	-- file explorer
	-- "stevearc/oil.nvim",

	-- "gc" to comment visual regions/lines
	{ "numToStr/Comment.nvim", opts = {} },

	require("plugin.lualine"),
	require("plugin.lspconfig"),
	require("plugin.whichkey"),
	require("plugin.treesitter"),
	require("plugin.telescope"),
	require("plugin.theme"),
	require("plugin.cmp"),
	require("plugin.nvimtree"),
	require("plugin.incline"),
	require("plugin.surround"),
	require("plugin.navigator"),
	require("plugin.colorizer"),
	require("plugin.autopairs"),
	require("plugin.illuminate"),
	require("plugin.indentline"),
	require("plugin.conform"),
	require("plugin.alpha"),
	-- require("plugin.noice"),
	require("plugin.leap"),
	-- require("plugin.java"),
}, {})
