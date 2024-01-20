return {
  {
    'williamboman/mason.nvim',
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        'deno',
      })
    end,
  },

  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        denols = {
          settings = {
            unstable = true,
            codeLens = {
              implementations = true,
              references = true,
              referencesAllFunctions = true,
            },
          },
        },
      },
    },
  },
}
