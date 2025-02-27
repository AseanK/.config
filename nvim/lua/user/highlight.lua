-- Colors Fix
vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6CC644" })
vim.api.nvim_set_hl(0, "CmpItemKindSnippet", { fg = "#6CC644" })
vim.api.nvim_set_hl(0, "CmpItemKindTabnine", { fg = "#CA42F0" })
vim.api.nvim_set_hl(0, "CmpItemKindEmoji", { fg = "#FDE030" })
vim.api.nvim_set_hl(0, "CmpItemKindText", { fg = "#FDE030" })

vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE", fg = "#56b6c2" })

vim.api.nvim_set_hl(0, "Pmenu", { bg = "NONE" })

-- MiniFiles
vim.api.nvim_set_hl(0, "MiniFilesNormal", { bg = "NONE" })
-- vim.api.nvim_set_hl(0, "MiniFilesDirectory", { bg = "NONE" })
-- vim.api.nvim_set_hl(0, "MiniFilesFile", { bg = "NONE" })
vim.api.nvim_set_hl(0, "MiniFilesTitle", { fg = "#547c45" })
vim.api.nvim_set_hl(0, "MiniFilesTitleFocused", { fg = "#98c379", bold = true })
-- vim.api.nvim_set_hl(0, "MiniFilesCursorLine", { bg = "NONE" })
vim.api.nvim_set_hl(0, "MiniFilesBorder", { fg = "#56b6c2", bg = "NONE" })

vim.diagnostic.config({
  float = {
    border = "rounded", -- Add a single-line border
  },
})

