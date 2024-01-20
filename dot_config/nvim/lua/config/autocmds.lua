-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Auto apply chezmoi when saving
vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
  group = vim.api.nvim_create_augroup('auto_apply_chezmoi', { clear = true }),
  pattern = '~/.local/share/chezmoi/*',
  command = '!chezmoi apply --source-path %',
})
