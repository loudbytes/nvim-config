local keyset = vim.keymap.set

-- Don't yank with x
keyset("n", "x", '"_x')
keyset("n", "X", '"_X')
keyset("v", "x", '"_x')
keyset("v", "X", '"_X')

keyset("n", "dw", 'vb"_d')

keyset("n", "<C-a>", "gg<S-v>G")

keyset("n", "te", ":tabedit<CR>", { silent = true })
keyset("n", "<S-Tab>", ":tabprev<CR>", { silent = true })
keyset("n", "<Tab>", ":tabnext<CR>", { silent = true })

keyset("n", "<Space>", ":nohlsearch<CR>", { silent = true })

-- Resize splits
keyset("n", "<C-w><left>", "<C-w><")
keyset("n", "<C-w><right>", "<C-w>>")
keyset("n", "<C-w><up>", "<C-w>+")
keyset("n", "<C-w><down>", "<C-w>-")

keyset("t", "<Esc>", [[<C-\><C-n>]], { noremap = true })
