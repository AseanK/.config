-- Set highlight on search
vim.o.hlsearch = false
vim.opt.incsearch = true

-- Make line numbers default
vim.wo.number = true

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = "yes"

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect,preview"

vim.o.termguicolors = true

-- Custom
vim.opt.scrolloff = 8
vim.o.relativenumber = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.numberwidth = 2 -- set number column width to 2 {default 4}
vim.opt.cursorline = true -- highlight the current line
vim.opt.updatetime = 100 -- faster completion (4000ms default)
vim.opt.smartindent = true -- make indenting smarter again
vim.opt.termguicolors = true -- set term gui colors (most terminals support this)
vim.opt.colorcolumn = "120"
vim.opt.smartindent = true
vim.opt.title = true
vim.opt.breakindent = true
vim.opt.smarttab = true
vim.opt.wildignore:append({ "*/node_modules/*" })
vim.opt.mouse = ""
