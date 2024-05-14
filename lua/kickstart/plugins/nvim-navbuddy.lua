return {
  'SmiteshP/nvim-navbuddy',
  dependencies = {
    'SmiteshP/nvim-navic',
    'MunifTanjim/nui.nvim',
  },
  opts = { lsp = { auto_attach = true } },
  config = function(_, opts)
    local navbuddy = require 'nvim-navbuddy'
    navbuddy.setup(opts)
    vim.keymap.set('n', '<leader>cn', function()
      navbuddy.open()
    end, { desc = 'LSP: [C]ode [N]avigation' })
  end,
}
