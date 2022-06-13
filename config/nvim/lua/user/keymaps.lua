local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

--> Shorten function name
local keymap = vim.api.nvim_set_keymap

--> Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--> Modes

--> Normal --> "n"
--> Quicker window movement
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
--> Jump cursor to the start and end of lines
keymap("n", "<S-l>", "$", opts)
keymap("n", "<S-h>", "0", opts)
--> Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
--> Telescope Advanced Search
keymap("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes'))<cr>", opts)
keymap("n", "<c-t>", "<cmd>Telescope live_grep<cr>", opts)
--> Spectre Search
keymap("n", "<leader>S", "<cmd>lua require('spectre').open()<cr>", opts)
--> Search current word
keymap("n", "<leader>sw", "<cmd>lua require('spectre').open_visual({select_world=true})<cr>", opts)
-->  Search in current file
keymap("n", "<leader>sp", "viw:lua require('spectre').open_file_search()<cr>", opts)
--> Nvimtree
keymap("n", "<leader>n", ":NvimTreeToggle<cr>", opts)
--> Easier Repeat Key
keymap("n", "<leader>r", ".", opts)

--> Insert --> "i"
--> Remap jk for quicker exit
keymap("i", "jk", "<ESC>", opts)

--> Visual --> "v"
--> Remap jk for quicker exit
keymap("v", "jk", "<ESC>", opts)
--> Spectre
--> Search current word
keymap("v", "<leader>s", "<cmd>lua require('spectre').open_visual()<cr>", opts)
--> Stay in indent mode
keymap("v", "H", "<gv", opts)
keymap("v", "L", ">gv", opts)
--> Move text up and down
keymap("v", "J", ":m .+1<CR>==", opts)
keymap("v", "K", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)
--> Sort selection alphabetically
keymap("v", "<leader>o", ":'<,'>sort u<cr>", opts)

--> Visual Block --> "x"
--> Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

--> Terminal --> "t"
--> Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

--> Commands --> "c"
