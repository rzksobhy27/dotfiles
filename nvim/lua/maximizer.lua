local M = {}

---@param winid number
local function is_float(winid)
    if vim.api.nvim_win_get_config(winid).relative == "" then
        return false
    end

    return true
end

local function restore()
    vim.cmd.wincmd("=")
    vim.t.maximizer_maximized = false
end

local function maximize()
    vim.api.nvim_win_set_width(0, 10000)
    vim.api.nvim_win_set_height(0, 10000)

    vim.t.maximizer_maximized = true
end

function M.toggle()
    if vim.t.maximizer_maximized then
        restore()
    else
        maximize()
    end
end

local group = vim.api.nvim_create_augroup("maximizer", { clear = true })

local from_float = false
vim.api.nvim_create_autocmd("WinLeave", {
    group = group,
    callback = function()
        from_float = is_float(0)
    end,
})

vim.api.nvim_create_autocmd("WinEnter", {
    group = group,
    callback = function()
        if is_float(0) or from_float then
            return
        end

        if vim.t.maximizer_maximized then
            restore()
        end
    end,
})

return M
