return {
  {
    'williamboman/mason.nvim',
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        'proselint',
        'write-good',
        'alex',
      })
    end,
  },

  {
    'nvimtools/none-ls.nvim',
    optional = true,
    opts = function(_, opts)
      local null_ls = require 'null-ls'
      opts.sources = vim.list_extend(opts.sources or {}, {
        null_ls.builtins.code_actions.proselint,
        null_ls.builtins.diagnostics.proselint,
        null_ls.builtins.diagnostics.write_good,
        null_ls.builtins.diagnostics.alex,
      })
    end,
  },
}
