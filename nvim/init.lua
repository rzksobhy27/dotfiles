-- load lua modules faster
pcall(require, "impatient")

return require("packer").startup(function(use)
    use("wbthomason/packer.nvim")
    use("nvim-lua/plenary.nvim")
    use("lewis6991/impatient.nvim")
    use("numToStr/Comment.nvim")
    use("mg979/vim-visual-multi")
    use("tpope/vim-fugitive")
    use("gruvbox-community/gruvbox")
    use({
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path"
    })
    use({
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip"
    })
    use({
        "neovim/nvim-lspconfig",
        "onsails/lspkind-nvim"
    })
    use("b0o/SchemaStore.nvim")
    use("williamboman/mason.nvim")
end)
