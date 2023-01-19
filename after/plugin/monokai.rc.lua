local s, monokai = pcall(require, "monokai")
s = false -- disable monokai
if not s then
	return
end

monokai.setup({})

vim.cmd([[colorscheme monokai]])
