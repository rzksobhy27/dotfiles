local lsp = require("lspconfig")
local nnoremap = require("map").nnoremap

local def_opts = {
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
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
    },
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
                globals = { "vim" },
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

local group = vim.api.nvim_create_augroup("LspAttach", { clear = true })
vim.api.nvim_create_autocmd("LspAttach", {
    group = group,
    callback = function(args)
        if not (args.data and args.data.client_id) then
            return
        end

        local bufnr = args.buf
        local bufopts = { buffer = bufnr }
        nnoremap("K", vim.lsp.buf.hover, bufopts)
        nnoremap("<C-k>", vim.lsp.buf.signature_help, bufopts)
        nnoremap("gr", vim.lsp.buf.references, bufopts)
        nnoremap("gd", vim.lsp.buf.definition, bufopts)
        nnoremap("gD", vim.lsp.buf.declaration, bufopts)
        nnoremap("gi", vim.lsp.buf.implementation, bufopts)
        nnoremap("<leader>lD", vim.lsp.buf.type_definition, bufopts)
        nnoremap("<leader>lr", vim.lsp.buf.rename, bufopts)
        nnoremap("<leader>la", vim.lsp.buf.code_action, bufopts)
        nnoremap("<leader>ld", vim.diagnostic.open_float, bufopts)
        nnoremap("<leader>lf", vim.lsp.buf.format, bufopts)
    end,
})
