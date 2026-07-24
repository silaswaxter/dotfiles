-- ABOUT: Declare plugins with packer.
-- This file DOES need to be required (manually loaded) because bootstrapping is
-- used. See https://github.com/wbthomason/packer.nvim#compiling-lazy-loaders
--------------------------------------------------------------------------------
-- Load plugins:
require('packer').startup(function(use)
  -- Packer itself:
  use({'wbthomason/packer.nvim'})

  -- Theming:
  use({'ellisonleao/gruvbox.nvim'})
  use({'nvim-lualine/lualine.nvim'})
  use({'lukas-reineke/indent-blankline.nvim'})

  -- Navigation:
  use({
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    requires = {'nvim-lua/plenary.nvim'}
  })
  use({
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'make',
    cond = (vim.fn.executable('make') == 1)
  })
  -- let core neovim populate telescope for `vim.ui.select`
  use {'nvim-telescope/telescope-ui-select.nvim'}
  -- TODO: add harpoon

  -- Treesitter
  use({
    'nvim-treesitter/nvim-treesitter',
    run = function()
      pcall(require('nvim-treesitter.install').update({with_sync = true}))
    end
  })
  -- TODO: uncomment once syntax-aware shortcuts via treesitter are configured
  -- use({
  --  "nvim-treesitter/nvim-treesitter-textobjects",
  --  after = "nvim-treesitter",
  --  requires = "nvim-treesitter/nvim-treesitter"
  -- })

  -- Language Server Protocols (LSPs):
  -- collection of configurations for built-in LSP client
  use({'neovim/nvim-lspconfig'})
  -- graphic that displays LSP status
  use {'j-hui/fidget.nvim', tag = 'legacy'}
  -- external tooling (LSP, DAP, linter, formatter) installer
  use({
    'williamboman/mason.nvim',
    run = ':MasonUpdate' -- updates registry contents
  })
  use({
    'williamboman/mason-lspconfig.nvim',
    requires = {'williamboman/mason.nvim', 'neovim/nvim-lspconfig'}
  })

  -- Autocompletion:
  use({
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp', -- (optional) source
      'hrsh7th/cmp-buffer', -- (optional) source
      'hrsh7th/cmp-path', -- (optional) source
      'hrsh7th/cmp-cmdline', -- (optional) source; sources cmp-path & cmp-buffer
      'saadparwaiz1/cmp_luasnip', -- (optional) source; depends on LuaSnip
      'hrsh7th/cmp-calc', -- (optional) source
      'alexander-born/cmp-bazel' -- (optional) source
    }
  })
  use({'L3MON4D3/LuaSnip'})

  -- Formatter/Linter:
  -- null-ls deprecated use community hot replacement none-ls
  use({'nvimtools/none-ls.nvim', requires = {'nvim-lua/plenary.nvim'}})

  -- Git-related:
  use({'lewis6991/gitsigns.nvim'})
  -- intentionally not using a git-integrating plugin because I want to practice
  -- and become very competent at CLI git before I experiment with abstractions.

  -- Compiler-Explorer:
  use({'krady21/compiler-explorer.nvim'})

  -- Writing documentation:
  use({
    'iamcco/markdown-preview.nvim',
    run = 'cd app && npm install',
    setup = function() vim.g.mkdp_filetypes = {'markdown'} end,
    ft = {'markdown'}
  })
  -- use({
  --   'silaswaxter/inkscape-figure-manager.nvim',
  --   ft = {'markdown'},
  --   rocks = {'inotify', 'luaposix'}
  -- })

  -- Misc:
  use({'mbbill/undotree'})
  use {
    'nmac427/guess-indent.nvim',
    config = function() require('guess-indent').setup {} end
  }
  -- add file-type based commenting commands
  use({'numToStr/Comment.nvim'})
  -- improve my vim movements
  use({
    'm4xshen/hardtime.nvim',
    -- config = function() require('hardtime').setup() end
  })
  use {
    'johmsalas/text-case.nvim',
    config = function() require('textcase').setup {} end
  }
  -- Finish Setup:
  -- Sync packer after boot-strapping.
  -- (MUST BE DONE LAST IN THIS FUNCTION.)
  if IS_PACKER_BOOSTRAPPED_FOR_THIS_SESSION then require('packer').sync() end
end)
