-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- save keystrokes, so we don't need to press the Shift key
vim.keymap.set('n', ';', ':', { noremap = true })

-- remap Y to Y as normal vim
vim.keymap.set('n', 'Y', 'Y', { noremap = true })
