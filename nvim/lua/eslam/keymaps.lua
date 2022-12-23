local keymap = vim.keymap.set

--Remap space as leader key
keymap("", "<Space>", "<Nop>")
vim.g.mapleader = " "

-- Normal --
-- Better window navigation
-- keymap("n", "<C-h>", "<C-w>h")
-- keymap("n", "<C-j>", "<C-w>j")
-- keymap("n", "<C-k>", "<C-w>k")
-- keymap("n", "<C-l>", "<C-w>l")

-- increment/decrement numbers
keymap("n", "<leader>+", "<C-a>") -- increment
keymap("n", "<leader>-", "<C-x>") -- decrement

-- window management
keymap("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
keymap("n", "<leader>sx", ":close<CR>") -- close current split window

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>")
keymap("n", "<C-Down>", ":resize +2<CR>")
keymap("n", "<C-Left>", ":vertical resize -2<CR>")
keymap("n", "<C-Right>", ":vertical resize +2<CR>")

-- Navigate buffers
keymap("n", "<S-l>", ":BufferNext<CR>")
keymap("n", "<S-h>", ":BufferPrevious<CR>")

-- Close buffers
keymap("n", "<S-q>", "<cmd>BufferClose!<CR>")

-- Clear highlights
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>")

-- Better paste
keymap("v", "p", '"_dP')

-- Search And Replace
keymap("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gcI<Left><Left><Left>")

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>")

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

-- Move text up and down
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv")
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv")

-- Terminal --
-- Better terminal navigation
keymap("t", "<esc>", [[<C-\><C-n>]])
keymap("t", "jk", [[<C-\><C-n>]])
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h")
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j")
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k")
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l")

-- Plugins --

-- NvimTree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>")

-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files<CR>")
keymap("n", "<leader>ft", ":Telescope live_grep<CR>")
keymap("n", "<leader>fp", ":Telescope projects<CR>")
keymap("n", "<leader>fb", ":Telescope buffers<CR>")

-- Git
keymap("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>")

-- Comment
keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>")
keymap("x", "<leader>/", '<ESC><CMD>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>')

-- Lsp
keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>")

-- ToggleTerm
keymap("n", "<C-t>", ":ToggleTerm<CR>")
