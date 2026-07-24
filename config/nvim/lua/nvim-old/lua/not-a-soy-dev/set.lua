-- ABOUT: Set neovim core options
--------------------------------------------------------------------------------
vim.g.mapleader = ' '

-- Colorize
vim.o.termguicolors = true
vim.cmd [[colorscheme gruvbox]]
vim.api.nvim_set_hl(0, 'Normal', {bg = 'none'})
vim.api.nvim_set_hl(0, 'NormalFloat', {bg = 'none'})

-- Hybrid relative line numbers:
vim.o.relativenumber = true
vim.o.number = true

vim.o.showcmd = true -- show command keystrokes in bottom right

-- set the colorcolumn as 80 by default and change it for filetypes that are 
-- exceptions
local dynamic_color_col_group = vim.api
                                    .nvim_create_augroup('DynamicColorColumn', {})
vim.api.nvim_create_autocmd('BufEnter', {
  pattern = {"*"},
  command = "set colorcolumn=80",
  group = dynamic_color_col_group
})
vim.api.nvim_create_autocmd('BufEnter', {
  pattern = {"*.py"},
  command = "set colorcolumn=88",
  group = dynamic_color_col_group
})

vim.o.signcolumn = 'auto'
vim.o.scrolloff = 12

-- use 2 spaces for indentation by default
-- (vim-sleuth adjusts these settings based on buffer context)
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.tabstop = 2

vim.o.spell = true
vim.o.clipboard = 'unnamedplus'

vim.o.mouse = 'a' -- enable mouse for all modes

-- Search options:
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = false -- don't highlight previous search matches
vim.o.incsearch = true -- highlight first match as pattern is being typed

vim.o.backup = false
vim.o.swapfile = false
vim.o.undofile = true

-- highlight text on yank
local highlight_group = vim.api.nvim_create_augroup('YankHighlight',
                                                    {clear = true})
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function() vim.highlight.on_yank() end,
  group = highlight_group,
  pattern = '*'
})
