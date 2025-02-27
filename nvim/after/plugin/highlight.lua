-- local colors = {
--   black = "#282c34",
--   red = "#e06c75",
--   green = "#98c379",
--   yellow = "#e5c07b",
--   blue = "#61afef",
--   magenta = "#be5046",
--   cyan = "#56b6c2",
--   white = "#979eab",
--   black1 = "#393e48",
--   red1 = "#d19a66",
--   green1 = "#56b6c2",
--   yellow1 = "#e5c07b",
--   blue1 = "#61afef",
--   magenta1 = "#be5046",
--   cyan1 = "#56b6c2",
--   white1 = "#abb2bf",
-- }

local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})
