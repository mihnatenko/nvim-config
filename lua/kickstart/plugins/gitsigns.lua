-- Here is a more advanced example where we pass configuration
-- options to `gitsigns.nvim`. This is equivalent to the following lua:
--    require('gitsigns').setup({ ... })
--
-- See `:help gitsigns` to understand what the configuration keys do
return { -- Adds git related signs to the gutter, as well as utilities for managing changes
  'lewis6991/gitsigns.nvim',
  opts = {
    signs = {
      add = { text = '▊' },
      change = { text = '▊' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
      untracked = { text = '┆' },
    },
    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns

      local function map(mode, l, r, desc)
        vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
      end

      -- Navigation
      map('n', ']h', gs.next_hunk, 'Next hunk')
      map('n', '[h', gs.prev_hunk, 'Previous hunk')

      -- Actions
      -- TODO: maybe it would make sense to modify descriptions to make `which-key` prettieer?
      map('n', '<leader>hp', gs.preview_hunk, 'Preview hunk')
      map('n', '<leader>hr', gs.reset_hunk, 'Reset hunk')
      map('n', '<leader>hb', gs.blame_line, 'Blame line')
      map('n', '<leader>hB', function()
        gs.blame_line { full = true }
      end, 'Blame line with diff')
    end,
  },
}

-- vim: ts=2 sts=2 sw=2 et
