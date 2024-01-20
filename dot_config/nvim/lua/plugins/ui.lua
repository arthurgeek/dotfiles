return {
  {
    'nvimdev/dashboard-nvim',
    opts = function(_, opts)
      local logo = [[
            ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
            ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
            ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
            ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
            ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
            ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝

                [ Arthur Zapparoli ]
      ]]

      logo = string.rep('\n', 8) .. logo .. '\n\n'

      opts.config.header = vim.split(logo, '\n')
    end,
  },
  {
    'mrjones2014/smart-splits.nvim',
    keys = {
      {
        '<A-h>',
        function()
          require('smart-splits').resize_left()
        end,
        'resize pane to the left',
      },
      {
        '<A-j>',
        function()
          require('smart-splits').resize_down()
        end,
        'resize pane to the bottom',
      },
      {
        '<A-k>',
        function()
          require('smart-splits').resize_up()
        end,
        'resize pane to the top',
      },
      {
        '<A-l>',
        function()
          require('smart-splits').resize_right()
        end,
        'resize pane to the right',
      },
      {
        '<C-h>',
        function()
          require('smart-splits').move_cursor_left()
        end,
        'move to the left pane',
      },
      {
        '<C-j>',
        function()
          require('smart-splits').move_cursor_down()
        end,
        'move to the bottom pane',
      },
      {
        '<C-k>',
        function()
          require('smart-splits').move_cursor_up()
        end,
        'move to the top pane',
      },
      {
        '<C-l>',
        function()
          require('smart-splits').move_cursor_right()
        end,
        'move to the right pane',
      },
      {
        '<leader><leader>h',
        function()
          require('smart-splits').swap_buf_left()
        end,
        'swap with left pane',
      },
      {
        '<leader><leader>j',
        function()
          require('smart-splits').swap_buf_down()
        end,
        'swap with bottom pane',
      },
      {
        '<leader><leader>k',
        function()
          require('smart-splits').swap_buf_up()
        end,
        'swap with top pane',
      },
      {
        '<leader><leader>l',
        function()
          require('smart-splits').swap_buf_right()
        end,
        'swap with right pane',
      },
    },
  },
}
