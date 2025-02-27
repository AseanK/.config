local M = {
  'b0o/incline.nvim',
  event = 'BufReadPre',
  dependencies = { "SmiteshP/nvim-navic" },
}

function M.config()
  local navic = require 'nvim-navic'
  navic.setup({ lsp = { auto_attach = true } })

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

      local function get_filename()
        local label = {}

        if modified then
          table.insert(label, { ' ', guifg = '#61afef' })
          table.insert(label, { ' ' .. filename, guibg = '#61afef', guifg = '#282c34' })
        else
          table.insert(label, { ' ', guifg = '#98c379' })
          table.insert(label, { ' ' .. filename, guibg = '#98c379', guifg = '#282c34' })
        end

        return label
      end

      local function get_harpoon()
        local label = {}
        return label
      end

      return {
        { get_harpoon() },
        { get_filename() },
        gui = 'bold',
        guibg = '#282c34',
        guifg = modified and '#61afef' or '#98c379',
      }
    end,
  })
end

return M
