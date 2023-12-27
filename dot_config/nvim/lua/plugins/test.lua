return {
  {
    'folke/which-key.nvim',
    optional = true,
    opts = {
      defaults = {
        ['<leader>tw'] = { name = '+watch' },
      },
    },
  },
  {
    'nvim-neotest/neotest',
    dependencies = { 'marilari88/neotest-vitest', 'nvim-neotest/neotest-jest' },
    opts = {
      adapters = {
        ['neotest-vitest'] = {},
        ['neotest-jest'] = {},
        ['neotest-go'] = {},
      },
      consumers = {
        overseer = require 'neotest.consumers.overseer',
      },
    },
    keys = {
      {
        '<leader>tl',
        function()
          require('neotest').run.run_last()
        end,
        desc = 'Run Last Test',
      },
      {
        '<leader>twt',
        function()
          require('neotest').watch.toggle(vim.fn.expand '%')
        end,
        desc = 'Watch File',
      },
      {
        '<leader>twT',
        function()
          require('neotest').watch.toggle(vim.loop.cwd())
        end,
        desc = 'Watch All Test Files',
      },
    },
  },
}
