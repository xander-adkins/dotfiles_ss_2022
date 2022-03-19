local opts = { noremap = true, silent = true }

--> Shorten function name
local keymap = vim.api.nvim_set_keymap

keymap("n", "<C-h>", [[<cmd>lua require('tmux').move_left()<cr>]], opts)
keymap("n", "<C-j>", [[<cmd>lua require('tmux').move_down()<cr>]], opts)
keymap("n", "<C-k>", [[<cmd>lua require('tmux').move_up()<cr>]], opts)
keymap("n", "<C-l>", [[<cmd>lua require('tmux').move_right()<cr>]], opts)
