require("nvim-treesitter.configs").setup({
    ensure_installed = "all",
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    textobjects = {
        select = {
            enable = true,
            keymaps = {
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",
            },
        },
    },
})
