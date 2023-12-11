return {
  {
    'ThePrimeagen/refactoring.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
      'nvim-telescope/telescope.nvim',
    },
    opts = {},
    config = function(_, opts)
      require('refactoring').setup(opts)
      require('telescope').load_extension 'refactoring'
    end,
    keys = {
      {
        '<leader>r',
        function()
          require('telescope').extensions.refactoring.refactors()
        end,
        mode = { 'n', 'x' },
        desc = 'Refactor',
      },
    },
  },

  {
    'nvimtools/none-ls.nvim',
    optional = true,
    opts = function(_, opts)
      local null_ls = require 'null-ls'
      opts.sources = vim.list_extend(opts.sources or {}, {
        null_ls.builtins.code_actions.refactoring,
      })
    end,
  },
}
