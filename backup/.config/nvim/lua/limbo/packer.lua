-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use({
	  'nvim-telescope/telescope.nvim', tag = '0.1.5',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  })
  use({ 
	  "rose-pine/neovim", 
	  as = "rose-pine" 
  })

  use({
          'nvim-treesitter/nvim-treesitter',
          {run = ':TSUpdate'}
  })

  use('nvim-treesitter/playground')
  use('theprimeagen/harpoon')
  use('mbbill/undotree')
  use('tpope/vim-fugitive')

  use {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v3.x',
  requires = {
    --- Uncomment the two plugins below if you want to manage the language servers from neovim
    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},

    -- LSP Support
    {'neovim/nvim-lspconfig'},
    -- Autocompletion
    {'hrsh7th/nvim-cmp'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'L3MON4D3/LuaSnip'},
  }
}

  use({
  "epwalsh/obsidian.nvim",
  tag = "*",  -- recommended, use latest release instead of latest commit
  requires = {
    -- Required.
    "nvim-lua/plenary.nvim",

    -- see below for full list of optional dependencies 👇
  },
  config = function()
    require("obsidian").setup({
      workspaces = {
        {
          name = "general",
          path = "/mnt/c/Users/connor/Documents/obsidian/general",
        },
        {
          name = "vestige",
          path = "/mnt/c/Users/connor/Documents/obsidian/vestige",
        },
        {
          name = "cyberpunk_fate",
          path = "/mnt/c/Users/connor/Documents/obsidian/cyberpunk_fate",
        },
      },

      -- see below for full list of options 👇
    })
  end,
  })
  
  use({
  "epwalsh/pomo.nvim",
  tag = "*",  -- Recommended, use latest release instead of latest commit
  requires = {
    -- Optional, but highly recommended if you want to use the "Default" timer
    "rcarriga/nvim-notify",
  },
  config = function()
    require("pomo").setup({
      -- See below for full list of options 👇
    })
  end,
  })
end)
