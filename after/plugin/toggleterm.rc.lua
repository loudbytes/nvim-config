local s, toggleterm = pcall(require, "toggleterm")
if not s then
	return
end

toggleterm.setup({
	open_mapping = [[<C-\>t]],
	hide_numbers = true,
	close_on_exit = true,
	direction = "float",
	shell = vim.o.shell,
})

vim.keymap.set("n", "tt", ":ToggleTerm size=15 direction=horizontal<CR>", { silent = true })
vim.keymap.set("n", "<Leader>tt", ":ToggleTerm direction=tab<CR>", { silent = true })
vim.keymap.set("n", "<Leader>tf", ":ToggleTerm direction=float<CR>", { silent = true })

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({
	cmd = "lazygit",
	dir = "git_dir",
	direction = "float",
	float_opts = {
		border = "curved",
	},
	close_on_exit = true,
	hidden = true,
	on_open = function(term)
		vim.cmd("startinsert!")
		vim.keymap.set("n", "q", ":close<CR>", { noremap = true, silent = true, buffer = term.bufnr })
	end,
	on_close = function(_term)
		vim.cmd("startinsert!")
	end,
})

function _lazygit_toggle()
	lazygit:toggle()
end

vim.keymap.set("n", "<leader>gt", ":lua _lazygit_toggle()<CR>", { noremap = true, silent = true })
