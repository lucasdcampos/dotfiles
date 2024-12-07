return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use "rebelot/kanagawa.nvim"
    use "ellisonleao/gruvbox.nvim"
    use {
      'nvim-treesitter/nvim-treesitter',
      run = function()
          local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
          ts_update()
      end,
    }
  
    use {
      'nvim-telescope/telescope.nvim', tag = '0.1.8',
      requires = { {'nvim-lua/plenary.nvim'} }
    }

    use {
      'nvim-tree/nvim-tree.lua',
      requires = {
        'nvim-tree/nvim-web-devicons', -- optional
      },
    }
    
    require("nvim-tree").setup()
    require'lspconfig'.pyright.setup{}
    
  end)
  