local nnoremap = require("map").nnoremap

local telescope = require("telescope")
local builtin = require("telescope.builtin")

-- files
nnoremap("<C-p>", builtin.git_files)
nnoremap("<leader>pf", builtin.find_files)

-- grep
nnoremap("<leader>ps", function ()
    builtin.grep_string({ search = vim.fn.input("Grep for > ") })
end)
nnoremap("<leader>pw", function ()
    builtin.grep_string({ search = vim.fn.expand("<cword>") })
end)
nnoremap("<leader>pW", function ()
    builtin.grep_string({ search = vim.fn.expand("<cWORD>") })
end)

nnoremap("<leader>pb", builtin.buffers)

nnoremap("<leader>ph", builtin.help_tags)

nnoremap("<C-e>", function ()
    telescope.extensions.file_browser.file_browser({
        path = vim.fn.expand("%:p:h"),
    })
end)
