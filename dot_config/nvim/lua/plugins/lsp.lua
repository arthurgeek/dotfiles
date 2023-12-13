return {
  {
    'williamboman/mason.nvim',
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        'luacheck',
        'css-lsp',
      })
    end,
  },

  {
    'folke/which-key.nvim',
    optional = true,
    opts = {
      defaults = {
        ['<leader>cp'] = { name = '+peek' },
        ['<leader>cf'] = { name = '+find' },
        -- since all those keys are LSP Keys defined in a different way, this is the only way for the label to appear
        ['<leader>cpx'] = { name = 'which_key_ignore' },
        ['<leader>cfx'] = { name = 'which_key_ignore' },
      },
    },
  },

  {
    'nvimdev/lspsaga.nvim',
    lazy = true,
    event = 'LspAttach',
    config = function()
      require('lspsaga').setup {}
    end,
    opts = {
      finder = {
        methods = {
          tyd = 'textDocument/typeDefinition',
        },
      },
    },
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
    },
    keys = {
      { ']d', '<cmd>Lspsaga diagnostic_jump_next<cr>', { desc = 'Next Diagnostic' } },
      { '[d', '<cmd>Lspsaga diagnostic_jump_prev<cr>', { desc = 'Prev Diagnostic' } },
      {
        ']e',
        function()
          require('lspsaga.diagnostic'):goto_next { severity = vim.diagnostic.severity.ERROR }
        end,
        { desc = 'Next Error' },
      },
      {
        '[e',
        function()
          require('lspsaga.diagnostic'):goto_prev { severity = vim.diagnostic.severity.ERROR }
        end,
        { desc = 'Prev Error' },
      },
      {
        ']w',
        function()
          require('lspsaga.diagnostic'):goto_next { severity = vim.diagnostic.severity.WARN }
        end,
        { desc = 'Next Warning' },
      },
      {
        '[w',
        function()
          require('lspsaga.diagnostic'):goto_prev { severity = vim.diagnostic.severity.WARN }
        end,
        { desc = 'Prev Warning' },
      },
    },
  },

  {
    'folke/noice.nvim',
    opts = function(_, opts)
      local insert_route = function(find_string)
        table.insert(opts.routes, {
          filter = {
            event = 'lsp',
            kind = 'progress',
            find = find_string,
          },
          opts = { skip = true },
        })
      end

      insert_route 'code_action' -- skip all lsp progress containing the word code_action
      insert_route 'diagnosing' -- skip all lsp progress containing the word diagnosing
    end,
  },

  {
    'neovim/nvim-lspconfig',
    opts = {
      inlay_hints = {
        enabled = true,
      },
    },
    init = function()
      local keys = require('lazyvim.plugins.lsp.keymaps').get()
      keys[#keys + 1] = { '<leader>ca', '<cmd>Lspsaga code_action<cr>', desc = 'Code Action', mode = { 'n', 'v' } }
      keys[#keys + 1] = { '<leader>cpd', '<cmd>Lspsaga peek_definition<cr>', desc = 'Peek Definition' }
      keys[#keys + 1] = { '<leader>cpy', '<cmd>Lspsaga peek_type_definition<cr>', desc = 'Peek Type Definition' }
      keys[#keys + 1] = { '<leader>cfd', '<cmd>Lspsaga finder def<cr>', desc = 'Find Definition' }
      keys[#keys + 1] = { '<leader>cfy', '<cmd>Lspsaga finder tyd<cr>', desc = 'Find Type Definition' }
      keys[#keys + 1] = { '<leader>cfr', '<cmd>Lspsaga finder ref<cr>', desc = 'Find References' }
      keys[#keys + 1] = { '<leader>cfi', '<cmd>Lspsaga finder imp<cr>', desc = 'Find Implementation' }
      keys[#keys + 1] = { '<leader>cfa', '<cmd>Lspsaga finder def+ref+imp+tyd<cr>', desc = 'Find All' }
      keys[#keys + 1] = { '<leader>co', '<cmd>Lspsaga outline<cr>', desc = 'Outline' }
      keys[#keys + 1] = { '<leader>cr', '<cmd>Lspsaga rename<cr>', desc = 'Rename' }
      keys[#keys + 1] = { 'gd', '<cmd>Lspsaga goto_definition<cr>', desc = 'Goto Definition', has = 'definition' }
      keys[#keys + 1] = { 'gy', '<cmd>Lspsaga goto_type_definition<cr>', desc = 'Goto T[y]pe Definition' }
      keys[#keys + 1] = { 'K', '<cmd>Lspsaga hover_doc<cr>', desc = 'Hover' }
      keys[#keys + 1] = { 'H', '<cmd>Lspsaga hover_doc ++keep<cr>', desc = 'Hover (keep)' }
    end,
  },
}
