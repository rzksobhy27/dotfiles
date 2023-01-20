local M = {}

local function bind(mode, outer_opts)
    outer_opts = outer_opts or { noremap = true, silent = true }

    return function (lhs, rhs, opts)
        opts = opts or {}
        opts = vim.tbl_extend("force", opts, outer_opts)

        vim.keymap.set(mode, lhs, rhs, opts)
    end
end

M.nnoremap = bind("n")
M.inoremap = bind("i")
M.vnoremap = bind("v")

return M
