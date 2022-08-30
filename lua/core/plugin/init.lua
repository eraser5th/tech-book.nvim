local packer = require("packer")

local M = {}

local init_packer = function ()
  packer.init({
    clone_timeout = 500, -- Timeout, in seconds, for git clones
  })
end

M.setup = function(packer_bootstrap)
  init_packer()
  return packer.startup(function(use)
    use("wbthomason/packer.nvim")

    use({
      "rcarriga/nvim-notify",
      config = function ()
        require("core.plugin.nvim-notify").setup()
      end
    })

    use({
      "kyazdani42/nvim-tree.lua",
      requires = { { "kyazdani42/nvim-web-devicons" } },
      config = function ()
        require("core.plugin.nvim-tree").setup()
      end,
    })

    use({
      "EdenEast/nightfox.nvim",
      config = function ()
        require("core.plugin.nightfox").setup()
      end,
    })

    use({
      "lewis6991/gitsigns.nvim",
      config = function ()
        require("core.plugin.gitsigns").setup()
      end,
    })

    use({
      "RRethy/vim-illuminate",
      config = function ()
        require("core.plugin.vim-illuminate").setup()
      end,
    })

    use({
      "petertriho/nvim-scrollbar",
      config = function ()
        require("core.plugin.nvim-scrollbar").setup()
      end,
    })

    use({
      "nvim-treesitter/nvim-treesitter",
      run = function()
        require("nvim-treesitter.install").update({
          async = true
        })
      end,
      config = function()
        require("core.plugin.nvim-treesitter").setup()
      end
    })

    use({
      "nvim-treesitter/nvim-treesitter-context",
      config = function()
        require("core.plugin.nvim-treesitter-context").setup()
      end,
      requires = {
        "nvim-treesitter",
      },
    })
    use({
      "nvim-telescope/telescope.nvim",
      tag = "0.1.0",
      requires = {
        -- required
        { "nvim-lua/plenary.nvim" },
        -- optional
        { "nvim-treesitter/nvim-treesitter" },
        { "kyazdani42/nvim-web-devicons" },
        -- extensions
        { "xiyaowong/telescope-emoji.nvim" },
        { "LinArcX/telescope-command-palette.nvim" },
      },
      config = function ()
        require("core.plugin.telescope").setup()
      end,
    })

    use({
      'kevinhwang91/nvim-ufo',
      requires = 'kevinhwang91/promise-async',
      config = function ()
        require("core.plugin.nvim-ufo").setup()
      end,
    })

    use({
      "gelguy/wilder.nvim",
      config = function ()
        require("core.plugin.wilder").setup()
      end,
    })

    use({
      "phaazon/hop.nvim",
      branch = "v2",
      config = function ()
        require("core.plugin.hop").setup()
      end,
    })

    use({
      "folke/which-key.nvim",
      config = function ()
        require("core.plugin.which-key").setup()
      end,
    })

    use({
      "neovim/nvim-lspconfig",
      config = function ()
        require("core.plugin.nvim-lspconfig").setup()
      end,
      requires = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "folke/lua-dev.nvim",
      }
    })

    use({
      "glepnir/lspsaga.nvim",
      branch = "main",
      config = function ()
        require("core.plugin.lspsaga").setup()
      end,
    })

    use({
      "j-hui/fidget.nvim",
      config = function ()
        require("fidget").setup({})
      end
    })

    use({
      "ray-x/lsp_signature.nvim",
      config = function ()
        require("core.plugin.lsp_signature").setup()
      end
    })

    use({
      "hrsh7th/nvim-cmp",
      config = function ()
        require("core.plugin.nvim-cmp").setup()
      end,
      requires = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "onsails/lspkind-nvim",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-emoji"
      },
    })

    use({
      "nvim-lualine/lualine.nvim",
      config = function ()
        require("core.plugin.lualine").setup()
      end,
      requires = {
        'kyazdani42/nvim-web-devicons',
      },
    })

    use({
      'sidebar-nvim/sidebar.nvim',
      config = function ()
        require("core.plugin.sidebar-nvim").setup()
      end,
    })

    use({
      "pwntester/octo.nvim",
      requires = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim",
        "kyazdani42/nvim-web-devicons",
      },
      config = function ()
        require("core.plugin.octo").setup()
      end
    })

    use({
      'numToStr/Comment.nvim',
      config = function()
        require('Comment').setup()
      end
    })

    if packer_bootstrap then
      require("packer").sync()
    end
  end)
end

return M
