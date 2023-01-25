local nnoremap = require("map").nnoremap

local telescope = require("telescope")
local builtin = require("telescope.builtin")
local themes = require("telescope.themes")

-- files
nnoremap("<C-p>", builtin.git_files)
nnoremap("<leader>pf", builtin.find_files)

-- grep
nnoremap("<leader>ps", function()
    builtin.grep_string({ search = vim.fn.input("Grep for > ") })
end)
nnoremap("<leader>pw", function()
    builtin.grep_string({ search = vim.fn.expand("<cword>") })
end)
nnoremap("<leader>pW", function()
    builtin.grep_string({ search = vim.fn.expand("<cWORD>") })
end)

nnoremap("<leader>pb", function()
    builtin.buffers(themes.get_dropdown({
        previewer = false,
    }))
end)

nnoremap("<leader>ph", function()
    builtin.help_tags(themes.get_dropdown({
        previewer = false,
    }))
end)
