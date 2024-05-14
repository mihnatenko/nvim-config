return { -- Highlight, edit, and navigate code
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
  opts = {
    ensure_installed = { 'bash', 'c', 'html', 'lua', 'markdown', 'vim', 'vimdoc' },
    -- Autoinstall languages that are not installed
    auto_install = true,
    highlight = {
      enable = true,
      -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
      --  If you are experiencing weird indenting issues, add the language to
      --  the list of additional_vim_regex_highlighting and disabled languages for indent.
      additional_vim_regex_highlighting = { 'ruby' },
    },
    indent = { enable = true, disable = { 'ruby' } },
    textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ['if'] = { query = '@function.inner', desc = 'inner part of a function' },
          ['af'] = { query = '@function.outer', desc = 'outer part of a function' },
          ['ic'] = { query = '@class.inner', desc = 'inner part of a class' },
          ['ac'] = { query = '@class.outer', desc = 'outer part of a class' },
          ['il'] = { query = '@loop.inner', desc = 'inner part of a loop' },
          ['al'] = { query = '@loop.outer', desc = 'outer part of a loop' },
        },
      },
      swap = {
        -- not sure I will use it, but will see
        enable = true,
        swap_next = {
          ['<leader>cs'] = { query = '@parameter.inner', desc = '[C]ode: [S]wap with next parameter' },
        },
        swap_previous = {
          ['<leader>cS'] = { query = '@parameter.inner', desc = '[C]ode: [S]wap with previous parameter' },
        },
      },
    },
  },
  config = function(_, opts)
    -- [[ Configure Treesitter ]] See `:help nvim-treesitter`

    ---@diagnostic disable-next-line: missing-fields
    require('nvim-treesitter.configs').setup(opts)

    -- There are additional nvim-treesitter modules that you can use to interact
    -- with nvim-treesitter. You should go explore a few and see what interests you:
    --
    --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
    --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
    --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
  end,
}

-- vim: ts=2 sts=2 sw=2 et
