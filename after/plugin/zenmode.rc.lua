local success, zen = pcall(require, "zen-mode")
if not success then
	return
end

zen.setup({})

vim.keymap.set("n", "<Leader>z", ":ZenMode<CR>", { silent = true })
