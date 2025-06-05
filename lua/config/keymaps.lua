local map = LazyVim.safe_keymap_set

map("n", "gb", "<cmd>Gitsigns blame<cr>", { desc = "Go to Left Window", remap = true })

map("n", "ss", ":split<Return>", {})
map("n", "sv", ":vsplit<Return>", {})

map("n", "<C-S-Down>", ":resize +2<CR>", { desc = "Resize Horizontal Split Down" })
map("n", "<C-S-Up>", ":resize -2<CR>", { desc = "Resize Horizontal Split Up" })
map("n", "<C-S-Right>", ":vertical resize -1<CR>", { desc = "Resize Vertical Split Down" })
map("n", "<C-S-Left>", ":vertical resize +2<CR>", { desc = "Resize Vertical Split Up" })

-- Unbind F1
map("n", "<F1>", "<Nop>", { noremap = true, silent = true })
map("i", "<F1>", "<Nop>", { noremap = true, silent = true })

-- Move up and down visual selected lines
map("v", "<C-K>", ":m '<-2<CR>gv=gv", { desc = "[P]Move line up in visual mode" })
map("v", "<C-J>", ":m '>+1<CR>gv=gv", { desc = "[P]Move line down in visual mode" })
