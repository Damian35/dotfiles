local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local do_packer_sync = nil

if fn.empty(fn.glob(install_path)) > 0 then
  do_packer_sync = fn.system({
    "git", "clone", "--depth", "1",
    "https://github.com/wbthomason/packer.nvim", install_path
  })
end

return require("packer").startup({
  function(use)

    use("wbthomason/packer.nvim")

    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

    use "navarasu/onedark.nvim"

    use {
      "akinsho/bufferline.nvim",
      tag = "v2.*",
      requires = "kyazdani42/nvim-web-devicons"
    }

    use({
      "glepnir/galaxyline.nvim",
      branch = 'main',
      requires = { "kyazdani42/nvim-web-devicons", opt = true }
    })

    use("jiangmiao/auto-pairs")

    -- use("lukas-reineke/indent-blankline.nvim")

   use("ap/vim-css-color")

 --   use({
 --     "iamcco/markdown-preview.nvim",
 --     run = "cd app && npm install",
 --     setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
 --     ft = { "markdown" }
 --   })

   use("kyazdani42/nvim-tree.lua")

   use('kyazdani42/nvim-web-devicons')

   use("Pocco81/AutoSave.nvim")

   use("jose-elias-alvarez/typescript.nvim")
    -- LSP
   use("neovim/nvim-lspconfig")
   use({
     "williamboman/nvim-lsp-installer",
     require = "neovim/nvim-lspconfig"
   })

    -- Completion
   use("hrsh7th/nvim-cmp")

    -- Completion sources
   local completion_sources = {
     "hrsh7th/cmp-nvim-lsp", -- nvim-cmp source for neovim's built-in language server client.
     "hrsh7th/cmp-buffer", -- nvim-cmp source for buffer words.
     "hrsh7th/cmp-path", -- nvim-cmp source for filesystem paths.
     "hrsh7th/cmp-cmdline", -- nvim-cmp source for vim's cmdline.
     "hrsh7th/cmp-nvim-lua" -- nvim-cmp source for neovim Lua API.
   }
   for _, plugin in ipairs(completion_sources) do
     use({ plugin, requires = { "hrsh7th/nvim-cmp" } })
   end

    -- Snippets luasnip
   use("L3MON4D3/LuaSnip")
   use({
     "saadparwaiz1/cmp_luasnip",
     requires = { "L3MON4D3/LuaSnip", "hrsh7th/nvim-cmp" }
   })

   use "terrortylor/nvim-comment"

    -- use("onsails/lspkind.nvim")

   use {
     "akinsho/toggleterm.nvim",
     tag = 'v2.*',
     config = function() require("toggleterm").setup() end
   }

 --   use("andrejlevkovitch/vim-lua-format")

 --   use {
 --     'filipdutescu/renamer.nvim',
 --     branch = 'master',
 --     requires = { { 'nvim-lua/plenary.nvim' } }
 --   }


    if do_packer_sync then require("packer").sync() end
  end,

  config = {
    display = {
      open_fn = function()
        return require('packer.util').float({ border = 'rounded' })
      end
    },
    auto_clean = true
  }
})
