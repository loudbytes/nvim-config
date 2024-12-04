-- Don't yank with x
vim.keymap.set("n", "x", '"_x')
vim.keymap.set("n", "X", '"_X')
vim.keymap.set("v", "x", '"_x')
vim.keymap.set("v", "X", '"_X')

-- Tab controls
vim.keymap.set("n", "te", ":tabedit<CR>", { silent = true })
vim.keymap.set("n", "<S-Tab>", ":tabprev<CR>", { silent = true })
vim.keymap.set("n", "<Tab>", ":tabnext<CR>", { silent = true })

-- Resize splits
vim.keymap.set("n", "<C-w><left>", "<C-w><")
vim.keymap.set("n", "<C-w><right>", "<C-w>>")
vim.keymap.set("n", "<C-w><up>", "<C-w>+")
vim.keymap.set("n", "<C-w><down>", "<C-w>-")

-- Format with Alt-F
vim.keymap.set("n", "<M-f>", vim.lsp.buf.format)

vim.keymap.set("n", "<leader>bx", ":bd<CR>", { noremap = true, silent = true, desc = "Close current buffer" })
