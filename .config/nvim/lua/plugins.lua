vim.cmd [[packadd packer.nvim]]
local use = require('packer').use
require('packer').startup(function()
  use 'wbthomason/packer.nvim' -- Package manager

  -- Navigation
  use {
      'nvim-telescope/telescope.nvim', tag = '0.1.0',
-- or                            , branch = '0.1.x',
      requires = { {'nvim-lua/plenary.nvim'} }
  } 

  use {
  'kyazdani42/nvim-tree.lua',
  requires = {
    'kyazdani42/nvim-web-devicons', -- optional, for file icons
  },
  tag = 'nightly' -- optional, updated every week. (see issue #1193)
}

  -- LSP
  use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP
  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  use 'hrsh7th/cmp-path' -- Autocompletion for file system
  use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
  use 'williamboman/nvim-lsp-installer'
  use 'L3MON4D3/LuaSnip' -- Snippets plugin
  
  -- ColorScheme
  use 'joshdick/onedark.vim'
  use { 'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
    config = function()
        require('lualine').setup()
    end, }
  

  -- Other
  use { 'numToStr/Comment.nvim',
  config = function() require('Comment').setup() end }
  use 'dense-analysis/ale'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
end)
