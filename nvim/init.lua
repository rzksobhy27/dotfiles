--" load lua modules faster
pcall(require, "impatient")

return require("packer").startup(function(use)
    use("wbthomason/packer.nvim")
    use("nvim-lua/plenary.nvim")
    use("lewis6991/impatient.nvim")
    use("numToStr/Comment.nvim")
    use("mg979/vim-visual-multi")
    use("tpope/vim-fugitive")
    use("junegunn/vim-easy-align")
    use("gruvbox-community/gruvbox")
    use("nvim-tree/nvim-web-devicons")
    use("jose-elias-alvarez/null-ls.nvim")
    use({
        "nvim-telescope/telescope.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
        "nvim-telescope/telescope-ui-select.nvim",
    })
    use({
        "nvim-treesitter/nvim-treesitter",
        "nvim-treesitter/nvim-treesitter-textobjects",
    })
    use({
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
    })
    use({
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
    })
    use({
        "neovim/nvim-lspconfig",
        "onsails/lspkind-nvim",
    })
    use("b0o/SchemaStore.nvim")
    use("williamboman/mason.nvim")
end)
