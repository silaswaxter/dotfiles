-- Bootstrap Packer:
local install_path = vim.fn.stdpath('data') ..
                         '/site/pack/packer/start/packer.nvim'
IS_PACKER_BOOSTRAPPED_FOR_THIS_SESSION = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  IS_PACKER_BOOSTRAPPED_FOR_THIS_SESSION = true
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' ..
                     install_path)
  vim.cmd([[packadd packer.nvim]])
end

require('not-a-soy-dev.packer')

if IS_PACKER_BOOSTRAPPED_FOR_THIS_SESSION then
  print('|===================================================|')
  print('|  Packer Plugin Manager Bootstrapped               |')
  print('|---------------------------------------------------|')
  print('|  Plugins will be installed upon entering buffer.  |')
  print('|  After install completes, restart Neovim.         |')
  print('|                                                   |')
  print('|  Recall: hot-reloading is error prone             |')
  print('|===================================================|')
  return
end

require('not-a-soy-dev')
