local success, nvim_tree = pcall(require, "nvim-tree")
if not success then
	return
end

nvim_tree.setup({
	hijack_netrw = false,
})

vim.keymap.set("n", "<C-f>", ":NvimTreeToggle<CR>", { silent = true })
