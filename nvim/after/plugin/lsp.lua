local lsp = require("lspconfig")

local def_opts = {
    capabilities = require("cmp_nvim_lsp").default_capabilities()
}

local function setup(server, opts)
    opts = opts or {}
    opts = vim.tbl_deep_extend("keep", opts, def_opts)

    lsp[server].setup(opts)
end

setup("gopls")

setup("rust_analyzer")

setup("html")
setup("cssls")
setup("tsserver")
setup("jsonls", {
    settings = {
        json = {
            schemas = require("schemastore").json.schemas(),
            validate = { enable = true },
        },
    },
})

setup("cmake")
setup("clangd", {
    cmd = {
        "clangd",
        "--background-index",
        "--pch-storage=memory",
        "--clang-tidy",
        "--suggest-missing-includes",
        "--all-scopes-completion",
        "--pretty",
        "--header-insertion=never",
        "-j=4",
        "--inlay-hints",
        "--header-insertion-decorators",
    }
})

setup("bashls")
setup("pyright")
setup("dartls")

setup("sumneko_lua", {
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
            },
            diagnostics = {
                globals = {"vim"},
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = {
                enable = false,
            },
        },
    },
})
