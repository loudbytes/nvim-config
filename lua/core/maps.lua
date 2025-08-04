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

--vim.keymap.set("n", "<leader>xx", ":TroubleToggle<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<C-j>", "<Cmd>Lspsaga diagnostic_jump_next<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-k>", "<Cmd>Lspsaga show_cursor_diagnostics<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "K", "<Cmd>Lspsaga hover_doc<cr>", { noremap = true, silent = true })
vim.keymap.set(
	"n",
	"<leader>sg",
	"<Cmd>Lspsaga lsp_finder<cr>",
	{ noremap = true, silent = true, desc = "Goto definition" }
)
vim.keymap.set(
	"n",
	"<leader>sp",
	"<Cmd>Lspsaga preview_definition<cr>",
	{ noremap = true, silent = true, desc = "Preview definition" }
)
vim.keymap.set("n", "<leader>sr", "<Cmd>Lspsaga rename<cr>", { noremap = true, silent = true, desc = "Rename symbol" })
vim.keymap.set("n", "gl", "<Cmd>Lspsaga show_line_diagnostics<cr>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>dt", function()
	if vim.diagnostic.is_enabled() then
		vim.diagnostic.enable(false)
	else
		vim.diagnostic.enable()
	end
end, { noremap = true, silent = true, desc = "Toggle diagnostics" })

vim.keymap.set("n", "<leader>go", "<CMD>Neogit<CR>", { noremap = true, silent = true, desc = "Open neogit" })

vim.keymap.set("n", "<leader>m", "<CMD>Compile<CR>", { noremap = true, silent = true, desc = "compile" })
vim.keymap.set(
	"n",
	"<leader>bm",
	"<CMD>buffer *compilation*<CR>",
	{ noremap = true, silent = true, desc = "open compilation buffer" }
)

-- to avoid typing norm everytime
vim.keymap.set("v", "<leader>n", ":norm ", { noremap = true })
