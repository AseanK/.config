local M = {
	-- Highlight, edit, and navigate code
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,
	build = ":TSUpdate",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
		branch = "main",
	},
}

function M.config()
	local ts = require("nvim-treesitter")
	ts.install({
		"c",
		"cpp",
		"go",
		"lua",
		"python",
		"rust",
		"tsx",
		"javascript",
		"typescript",
		"markdown",
		"java",
	})

	vim.api.nvim_create_autocmd("FileType", {
		callback = function(args)
			pcall(vim.treesitter.start, args.buf)
		end,
	})

	require("nvim-treesitter-textobjects").setup({
		select = {
			lookahead = true,},
            move = { set_jumps = true,},
            })

            local select = require("nvim-treesitter-textobjects.select")
            local move = require("nvim-treesitter-textobjects.move")
            local swap = require("nvim-treesitter-textobjects.swap")

            vim.keymap.set({ "x", "o" }, "aa", function()
                select.select_textobject("@parameter.outer", "textobjects")
            end)

            vim.keymap.set({ "x", "o" }, "ia", function()
                select.select_textobject("@parameter.inner", "textobjects")
            end)

            vim.keymap.set({ "x", "o" }, "af", function()
                select.select_textobject("@function.outer", "textobjects")
            end)

            vim.keymap.set({ "x", "o" }, "if", function()
                select.select_textobject("@function.inner", "textobjects")
            end)

            vim.keymap.set({ "x", "o" }, "ac", function()
                select.select_textobject("@class.outer", "textobjects")
            end)

            vim.keymap.set({ "x", "o" }, "ic", function()
                select.select_textobject("@class.inner", "textobjects")
            end)

            vim.keymap.set("n", "]m", function()
                move.goto_next_start("@function.outer", "textobjects")
            end)

            vim.keymap.set("n", "]M", function()
                move.goto_next_end("@function.outer", "textobjects")
            end)

            vim.keymap.set("n", "[m", function()
                move.goto_previous_start("@function.outer", "textobjects")
            end)

            vim.keymap.set("n", "[M", function()
                move.goto_previous_end("@function.outer", "textobjects")
            end)
            -- vim.keymap.set("n", "<leader>a", function()
            --     swap.swap_next("@parameter.inner")
            -- end)
            --
            -- vim.keymap.set("n", "<leader>A", function()
            --     swap.swap_previous("@parameter.inner")
            -- end)
	vim.lsp.document_color.enable(true)
end

-- function M.config()
-- 	require("nvim-treesitter.configs").setup({
-- 		ensure_installed = {
-- 			"c",
-- 			"cpp",
-- 			"go",
-- 			"lua",
-- 			"python",
-- 			"rust",
-- 			"tsx",
-- 			"javascript",
-- 			"typescript",
-- 			"vimdoc",
-- 			"vim",
-- 			"bash",
-- 			"markdown",
-- 			"java",
-- 		},
--
-- 		auto_install = true,
--
-- 		highlight = { enable = true },
-- 		indent = { enable = true },
-- 		incremental_selection = {
-- 			enable = true,
-- 			keymaps = {
-- 				init_selection = "<c-space>",
-- 				node_incremental = "<c-space>",
-- 				scope_incremental = "<c-s>",
-- 				node_decremental = "<M-space>",
-- 			},
-- 		},
-- 		textobjects = {
-- 			select = {
-- 				enable = true,
-- 				lookahead = true,
-- 				keymaps = {
-- 					-- You can use the capture groups defined in textobjects.scm
-- 					["aa"] = "@parameter.outer",
-- 					["ia"] = "@parameter.inner",
-- 					["af"] = "@function.outer",
-- 					["if"] = "@function.inner",
-- 					["ac"] = "@class.outer",
-- 					["ic"] = "@class.inner",
-- 				},
-- 			},
-- 			move = {
-- 				enable = true,
-- 				set_jumps = true, -- whether to set jumps in the jumplist
-- 				goto_next_start = {
-- 					["]m"] = "@function.outer",
-- 					["]]"] = "@class.outer",
-- 				},
-- 				goto_next_end = {
-- 					["]M"] = "@function.outer",
-- 					["]["] = "@class.outer",
-- 				},
-- 				goto_previous_start = {
-- 					["[m"] = "@function.outer",
-- 					["[["] = "@class.outer",
-- 				},
-- 				goto_previous_end = {
-- 					["[M"] = "@function.outer",
-- 					["[]"] = "@class.outer",
-- 				},
-- 			},
-- 			swap = {
-- 				enable = true,
-- 				swap_next = {
-- 					["<leader>a"] = "@parameter.inner",
-- 				},
-- 				swap_previous = {
-- 					["<leader>A"] = "@parameter.inner",
-- 				},
-- 			},
-- 		},
-- 	})
-- end

return M
