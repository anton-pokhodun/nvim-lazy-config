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

-- Close the window
-- map("n", "<leader>cl", "<Cmd>close<CR>", { noremap = true, silent = true })
