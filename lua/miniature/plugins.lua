local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
  profile = {
    enable = true,
    threshold = 1,
  },
}

return packer.startup(function(use)
  -- No lazy-loading plugins
  use "wbthomason/packer.nvim"
  use "lewis6991/impatient.nvim"
  use "echasnovski/mini.nvim"
  -- rest
  use {
    "nvim-lua/popup.nvim",
    module = "popup",
  }
  use {
    "nvim-lua/plenary.nvim",
    module = "plenary",
  }

  use {
    "lewis6991/gitsigns.nvim",
    event = "BufRead",
    config = function ()
      require("miniature.gitsigns")
    end
  }
  use {
    "kyazdani42/nvim-web-devicons",
    module = "nvim-web-devicons",
    config = function ()
      require("nvim-web-devicons").setup({default = true})
    end
  }

  -- cmp plugins
  use {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    config = function ()
      require("miniature.cmp")
    end
  }
  use {
    "hrsh7th/cmp-buffer",
    after = "nvim-cmp",
  }
  use {
    "hrsh7th/cmp-path",
    after = "nvim-cmp",
  }
  use {
    "hrsh7th/cmp-cmdline",
    after = "nvim-cmp",
  }
  use {
    "saadparwaiz1/cmp_luasnip",
    after = "nvim-cmp",
  }
  use {
    "hrsh7th/cmp-nvim-lsp",
    module = "cmp_nvim_lsp", -- Need by lspconfig
  }
  use {
    "hrsh7th/cmp-nvim-lua",
    after = "nvim-cmp",
  }

  -- snippets
  use {
    "L3MON4D3/LuaSnip",
    wants = "friendly-snippets",
    after = "nvim-cmp",
  }
  use {
    "rafamadriz/friendly-snippets",
    opt = true,
  }

  -- LSP
  use {
    "neovim/nvim-lspconfig",
    wants = "cmp-nvim-lsp",
    event = "VimEnter",
    config = function()
      require("miniature.lsp")
    end,
  }
  use {
    "williamboman/nvim-lsp-installer",
    module = "nvim-lsp-installer",
    cmd = { "LspInstall", "LspInstallInfo" },
  }
  use {
    "tamago324/nlsp-settings.nvim",
    after = "nvim-lspconfig",
  }
  use {
    "jose-elias-alvarez/null-ls.nvim",
    after = "nvim-lspconfig",
  }
  use {
    "folke/lsp-colors.nvim",
    after = "nvim-lspconfig",
    config = function ()
      require("lsp-colors").setup()
    end
  }

  -- TS
  use {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufRead", "BufNewFile" },
    run = ":TSUpdate",
    config = function()
      require("miniature.treesitter")
    end
  }
  use {
    "JoosepAlviste/nvim-ts-context-commentstring",
    after = "nvim-treesitter",
  }

  use {
    "goolord/alpha-nvim",
    event = "VimEnter",
    config = function ()
      require("miniature.alpha")
    end
  }
  use {
    "kyazdani42/nvim-tree.lua",
    cmd = "NvimTreeToggle",
    config = function ()
      require("miniature.nvim-tree")
    end
  }
  use {
    "folke/which-key.nvim",
    event = "VimEnter",
    config = function ()
      require("miniature.which-key")
    end
  }
  use {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
    config = function ()
      require("miniature.diag")
    end
  }
  use {
    "antoinemadec/FixCursorHold.nvim",
    event = "VimEnter",
  }
  use {
    "norcalli/nvim-colorizer.lua",
    event = "BufRead",
    config = function ()
      require("colorizer").setup()
    end
  }
  use {
    "akinsho/toggleterm.nvim",
    cmd = "ToggleTerm",
    module = "toggleterm.terminal",
    config = function ()
      require("miniature.toggleterm")
    end
  }
  use {
    "ahmedkhalf/project.nvim",
    event = "VimEnter",
    config = function ()
      require("miniature.project")
    end
  }
  -- Telescope
  use {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    config = function()
      require("miniature.telescope")
    end
  }
  -- neogit
  use {
    "TimUntersberger/neogit",
    module = "neogit",
    config = function ()
      require("miniature.neogit")
    end
  }
  -- Symbols
  use {
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
    config = function ()
      require("miniature.symbols-outline")
    end
  }
end)
