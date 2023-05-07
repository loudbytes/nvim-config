local keyset = vim.keymap.set

-- Don't yank with x
keyset("n", "x", '"_x')
keyset("n", "X", '"_X')
keyset("v", "x", '"_x')
keyset("v", "X", '"_X')

-- Tab controls
keyset("n", "te", ":tabedit<CR>", { silent = true })
keyset("n", "<S-Tab>", ":tabprev<CR>", { silent = true })
keyset("n", "<Tab>", ":tabnext<CR>", { silent = true })

-- Resize splits
keyset("n", "<C-w><left>", "<C-w><")
keyset("n", "<C-w><right>", "<C-w>>")
keyset("n", "<C-w><up>", "<C-w>+")
keyset("n", "<C-w><down>", "<C-w>-")

-- Format with Alt-F
keyset("n", "<M-f>", vim.lsp.buf.format)

-- Ctrl-q to quit buffer
keyset("n", "<C-q>", ":bd<CR>")
