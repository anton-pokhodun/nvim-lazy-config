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

-- Function to get the GitHub URL of the current file
local function get_github_url_of_current_file()
  local file_path = vim.fn.expand("%:p")
  if file_path == "" then
    vim.notify("No file is currently open", vim.log.levels.WARN)
    return nil
  end

  local git_root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
  if not git_root or git_root == "" then
    vim.notify("Could not determine the root directory for the GitHub repository", vim.log.levels.WARN)
    return nil
  end

  local origin_url = vim.fn.systemlist("git config --get remote.origin.url")[1]
  if not origin_url or origin_url == "" then
    vim.notify("Could not determine the origin URL for the GitHub repository", vim.log.levels.WARN)
    return nil
  end

  local branch_name = vim.fn.systemlist("git rev-parse --abbrev-ref HEAD")[1]
  if not branch_name or branch_name == "" then
    vim.notify("Could not determine the current branch name", vim.log.levels.WARN)
    return nil
  end

  local repo_url = origin_url:gsub("git@github.com[^:]*:", "https://github.com/"):gsub("%.git$", "")
  local relative_path = file_path:sub(#git_root + 2)
  return repo_url .. "/blob/" .. branch_name .. "/" .. relative_path
end

-- Open current file's GitHub repo link lamw25wmal
map("n", "<leader>fG", function()
  local github_url = get_github_url_of_current_file()
  if github_url then
    local command = "open " .. vim.fn.shellescape(github_url)
    vim.fn.system(command)
    print("Opened GitHub link: " .. github_url)
  end
end, { desc = "[P]Open current file's GitHub repo link" })
