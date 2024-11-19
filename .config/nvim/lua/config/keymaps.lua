vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") --Move line to bottom
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") --Move line to top


vim.keymap.set("n", "J", "mzJ`z") -- Keep cursor at the same place when pressing J
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv") -- Activate search and keep cursor on the middle of the screen
vim.keymap.set("n", "N", "Nzzzv")


vim.keymap.set("x", "<leader>p", "\"_dP") -- When copying something and remove another on pasting the first, the first isn't losing of the copy buffer

vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

