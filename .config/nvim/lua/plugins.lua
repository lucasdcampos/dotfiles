return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use "rebelot/kanagawa.nvim"
    use "ellisonleao/gruvbox.nvim"
    use(
      'nvim-treesitter/nvim-treesitter',
      {run = ':TSUpdate'}
    )
  
    use {
      'nvim-telescope/telescope.nvim', tag = '0.1.8',
      requires = { {'nvim-lua/plenary.nvim'} }
    }
  end)
  