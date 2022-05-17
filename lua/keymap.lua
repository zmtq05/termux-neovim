vim.g.mapleader = " "

-- n: Normal
-- v: Visual, Select
-- x: Visual
-- s: Select
-- o: Operator-pending
-- i: Insert
-- l: Insert, Command-line, Lang-Arg
-- c: Command-line
-- t: Terminal

local set = vim.keymap.set

set("i", "<C-a>", "<Home>")
set("i", "<C-e>", "<End>")
set("i", "<C-v>", "<C-o>p")
set("i", "<C-s>", "<Cmd>w<CR>")

set("n", "<C-q>", "<Cmd>bdelete<CR>")
set("n", "ga", "ggVG", { desc = "select all" })

set("n", "cw", "caw")

set("x", "<Tab>", ">gv")
set("x", "<S-Tab>", "<gv")

set("t", "<esc>", [[<C-\><C-n>]])

set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
