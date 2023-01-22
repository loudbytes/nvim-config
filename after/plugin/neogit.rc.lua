local success, neogit = pcall(require, "neogit")
if not success then
	return
end

neogit.setup({})

vim.keymap.set("n", "<Leader>g", ":Neogit<CR>")
vim.keymap.set("n", "<Leader>c", ":Neogit commit<CR>")
