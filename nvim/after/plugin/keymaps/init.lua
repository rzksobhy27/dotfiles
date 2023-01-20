local Remap = require("map")
local inoremap = Remap.inoremap
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap

nnoremap("<leader>e", ":Ex<CR>")

nnoremap("gq", ":tabclose<CR>")
nnoremap("]g", ":tabnext<CR>")
nnoremap("[g", ":tabprevious<CR>")

vnoremap("<", "<gv")
vnoremap(">", ">gv")

vnoremap("<M-j>", ":m '>+1<CR>gv=gv")
vnoremap("<M-k>", ":m '<-2<CR>gv=gv")

-- better escape
inoremap("<C-c>", "<ESC>")
vnoremap("<C-c>", "<ESC>")
nnoremap("<C-c>", "<ESC>")
