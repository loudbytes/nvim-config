local success, trouble = pcall(require, "trouble")
if not success then
	return
end

trouble.setup({})

vim.keymap.set("n", "<leader>xx", ":TroubleToggle<CR>", { silent = true, noremap = true })
