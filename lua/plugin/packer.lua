---@diagnostic disable: missing-parameter
return require("packer").startup(function(use_clean)
  local use = require("packer-tools.wrapper").new {
    inject_config = { enable = true, prefix = "plugin.config." },
  }
  use_clean("wbthomason/packer.nvim")
  use_clean("zmtq05/packer-tools.nvim")
  use_clean("Mofiqul/dracula.nvim")

  use_clean("lewis6991/impatient.nvim")
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }

  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
  }

  use {
    "neovim/nvim-lspconfig",
    config = "require'lsp'",
    requires = {
      "williamboman/nvim-lsp-installer",
      "hrsh7th/cmp-nvim-lsp",
      "folke/lua-dev.nvim",
    },
  }

  use {
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
  }
end)
