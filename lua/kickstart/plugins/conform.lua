return { -- Autoformat
  'stevearc/conform.nvim',
  opts = {
    notify_on_error = false,
    format_on_save = function(bufnr)
      -- Disable "format_on_save lsp_fallback" for languages that don't
      -- have a well standardized coding style. You can add additional
      -- languages here or re-enable it for the disabled ones.
      local disable_filetypes = { c = true, cpp = true }
      return {
        timeout_ms = 500,
        lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
      }
    end,
    formatters_by_ft = {
      lua = { 'stylua' },
      -- Conform can also run multiple formatters sequentially
      -- python = { "isort", "black" },
      --
      -- You can use a sub-list to tell conform to run *until* a formatter
      -- is found.
      -- javascript = { { "prettierd", "prettier" } },
    },
    formatters = {
      stylua = function(_)
        -- Specify config to use the same formatting local, per-project config files
        -- as in all config files
        local path = vim.api.nvim_buf_get_name(0)
        if path then
          local name = vim.fs.basename(path)
          if name == '.nvim.lua' then
            local stylua_config_path = vim.fn.stdpath 'config' .. '/.stylua.toml'
            return { prepend_args = { '--config-path', stylua_config_path } }
          end
        end

        return nil
      end,
    },
  },
}

-- vim: ts=2 sts=2 sw=2 et
