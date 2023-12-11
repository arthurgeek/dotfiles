return {
  {
    'cshuaimin/ssr.nvim',
    keys = {
      {
        '<leader>s/',
        function()
          require('ssr').open()
        end,
        desc = 'Structural Search and Replace',
        mode = { 'n', 'v' },
      },
    },
  },
}
