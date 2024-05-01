return {
  { -- You can easily change to a different colorscheme.
    -- Change the name of the colorscheme plugin below, and then
    -- change the command in the config to whatever the name of that colorscheme is
    --
    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`
    'folke/tokyonight.nvim',
    event = 'VeryLazy',
    -- priority = 1000, -- make sure to load this before all the other start plugins
    -- init = function()
    --   -- Load the colorscheme here.
    --   -- Like many other themes, this one has different styles, and you could load
    --   -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
    --   vim.cmd.colorscheme 'tokyonight-night'
    --
    --   -- You can configure highlights by doing something like
    --   vim.cmd.hi 'Comment gui=none'
    -- end,
  },
  {
    'catppuccin/nvim',
    event = 'VeryLazy',
    --   name = 'catppuccin',
    --   priority = 1000,
    --   -- opts = {
    --   --   flavour = 'mocha',
    --   -- },
    --   config = function()
    --     require('catppuccin').setup { flavour = 'macchiato' }
    --     vim.cmd.colorscheme 'catppuccin'
    --   end,
  },
  {
    'ribru17/bamboo.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('bamboo').setup {
        -- optional configuration here
      }
      require('bamboo').load()
    end,
  },
}

-- vim: ts=2 sts=2 sw=2 et
