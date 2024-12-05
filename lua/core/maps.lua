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

vim.keymap.set("n", "<A-j>", ":MoveLine(1)<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-k>", ":MoveLine(-1)<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-h>", ":MoveWord(-1)<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-l>", ":MoveWord(1)<CR>", { noremap = true, silent = true })

vim.keymap.set("v", "<A-j>", ":MoveBlock(1)<CR>", { noremap = true, silent = true })
vim.keymap.set("v", "<A-k>", ":MoveBlock(-1)<CR>", { noremap = true, silent = true })
vim.keymap.set("v", "<A-h>", ":MoveHBlock(-1)<CR>", { noremap = true, silent = true })
vim.keymap.set("v", "<A-l>", ":MoveHBlock(1)<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>xx", ":TroubleToggle<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<C-j>", "<Cmd>Lspsaga diagnostic_jump_next<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-k>", "<Cmd>Lspsaga show_cursor_diagnostics<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "K", "<Cmd>Lspsaga hover_doc<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "gd", "<Cmd>Lspsaga lsp_finder<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "gp", "<Cmd>Lspsaga preview_definition<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "gr", "<Cmd>Lspsaga rename<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "gl", "<Cmd>Lspsaga show_line_diagnostics<cr>", { noremap = true, silent = true })
