local lualine_places = { 'statusline', 'winbar', 'tabline' }

return {
  {
    'folke/zen-mode.nvim',
    dependencies = { 'folke/twilight.nvim', 'nvim-lualine/lualine.nvim' },
    opts = {
      plugins = {
        wezterm = {
          enabled = true,
          font = '+1',
        },
      },
      on_open = function(_)
        require('lualine').hide { unhide = false, place = lualine_places }
        vim.o.statusline = ' '
      end,
      on_close = function()
        require('lualine').hide { unhide = true, place = lualine_places }
      end,
    },
    keys = {
      { '<leader>z', '<cmd>ZenMode<cr>', desc = 'Toggle Zen Mode' },
    },
  },
}
