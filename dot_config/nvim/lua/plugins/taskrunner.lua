return {
  {
    'folke/which-key.nvim',
    optional = true,
    opts = {
      defaults = {
        ['<leader>o'] = { name = '+overseer (taskrunner)' },
      },
    },
  },
  {
    'stevearc/overseer.nvim',
    opts = {},
    keys = {
      { '<leader>or', '<cmd>OverseerRun<cr>', desc = 'Overseer Run' },
      { '<leader>ot', '<cmd>OverseerToggle<cr>', desc = 'Overseer Toggle' },
    },
  },
}
