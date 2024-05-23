local M = {
  'b0o/incline.nvim',
  event = 'BufReadPre',
}

function M.config()
  require("incline").setup({
    window = {
      margin = {
        horizontal = 0,
        vertical = 0,
      },
      padding = 0,
    },
    render = function(props)
      local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':t')
      if filename == '' then
        filename = '[No Name]'
      end
      local modified = vim.bo[props.buf].modified
      return {
        modified and '[ + ' or '[ ✓ ',
        filename,
        ']',
        gui = 'bold',
        guibg = '#282c34',
        guifg = modified and '#61afef' or '#98c379',
      }
    end,
  })
end

return M
