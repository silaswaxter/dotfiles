require('telescope').setup({
  pickers = {find_files = {hidden = true}},
  extensions = {['ui-select'] = {require('telescope.themes').get_dropdown {}}},
  defaults = {file_ignore_patterns = {'.git', '.cache', "release", "node_modules"}}
})

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

vim.keymap.set('n', '<leader>/', function()
  -- disable previewer when searching in current buffer
  require('telescope.builtin').current_buffer_fuzzy_find(require(
                                                             'telescope.themes').get_dropdown(
                                                             {previewer = false}))
end)
-- vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers)
vim.keymap.set('n', '<leader>sp', require('telescope.builtin').oldfiles)
vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files)
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string)
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep)
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics)
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags)

-- To get ui-select loaded and working with telescope
require('telescope').load_extension('ui-select')
