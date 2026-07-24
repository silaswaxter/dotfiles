-- ABOUT: Key mappings for neovim core
--------------------------------------------------------------------------------
vim.keymap.set('n', '<leader>e', vim.cmd.Ex)

vim.keymap.set('n', '<leader>h', "<Cmd>-tabnext<CR>")
vim.keymap.set('n', '<leader>l', "<Cmd>+tabnext<CR>")

-- vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)
