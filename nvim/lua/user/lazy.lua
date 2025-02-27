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
	-- "tpope/vim-sleuth",

	require("plugin.lualine"),
	require("plugin.lspconfig"),
	require("plugin.whichkey"),
	require("plugin.treesitter"),
	require("plugin.telescope"),
	require("plugin.theme"),
	require("plugin.cmp"),
	require("plugin.colorizer"),
	require("plugin.illuminate"),
	require("plugin.alpha"),
	-- require("plugin.java"),
	require("plugin.dressing"),
	require("plugin.flutter"),
	require("plugin.harpoon"),
	require("plugin.dap"),
	require("plugin.trouble"),
	-- MINI
	require("plugin.mini.files"),
	require("plugin.mini.surround"),
	require("plugin.mini.pairs"),
	require("plugin.mini.comment"),
	require("plugin.mini.ai"),
	require("plugin.mini.splitjoin"),
	require("plugin.mini.bracketed"),
	require("plugin.mini.jump"),
	require("plugin.mini.indentscope"),
}, {})
