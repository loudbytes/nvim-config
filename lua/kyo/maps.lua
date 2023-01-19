local keymap = vim.keymap

-- Don't yank with x
keymap.set("n", "x", '"_x')
keymap.set("n", "X", '"_X')
keymap.set("v", "x", '"_x')
keymap.set("v", "X", '"_X')

keymap.set("n", "dw", 'vb"_d')

keymap.set("n", "<C-a>", "gg<S-v>G")

keymap.set("n", "te", ":tabedit<CR>", { silent = true })
keymap.set("n", "<S-Tab>", ":tabprev<CR>", { silent = true })
keymap.set("n", "<Tab>", ":tabnext<CR>", { silent = true })

keymap.set("n", "<Space>", ":nohlsearch<CR>", { silent = true })

keymap.set("n", "tt", ":ToggleTerm size=15 direction=horizontal<CR>", { silent = true })
keymap.set("n", "<Leader>tt", ":ToggleTerm direction=tab<CR>", { silent = true })
keymap.set("n", "<Leader>tf", ":ToggleTerm direction=float<CR>", { silent = true })

keymap.set("n", "<Leader>g", ":Neogit<CR>")
keymap.set("n", "<Leader>c", ":Neogit commit<CR>")

-- Resize splits
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

vim.keymap.set("n", "<leader>rn", function()
	return ":IncRename " .. vim.fn.expand("<cword>")
end, { expr = true })

function adjustFontSize(delta)
	vim.g["fontsize"] = vim.g["fontsize"] + delta
	vim.opt.guifont = { "Hack NF", ":h" .. vim.g["fontsize"] }
end

keymap.set("n", "<C-p>", ":lua adjustFontSize(1)<CR>", { silent = true })
keymap.set("n", "<C-m>", ":lua adjustFontSize(-1)<CR>", { silent = true })

vim.cmd([[tnoremap <Esc> <C-\><C-n>]])
