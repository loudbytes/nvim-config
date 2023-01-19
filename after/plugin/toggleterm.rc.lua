local s, toggleterm = pcall(require, "toggleterm")
if not s then
	return
end

toggleterm.setup({
	open_mapping = [[<C-\>t]],
	hide_numbers = true,
	close_on_exit = true,
	shell = vim.o.shell,
})

--local Terminal = require("toggleterm.terminal").Terminal
--local lazygit = Terminal:new({
--	cmd = "lazygit",
--	dir = "git_dir",
--	direction = "float",
--	float_opts = {
--		border = "double",
--	},
--	close_on_exit = true,
--	hidden = true,
--	on_open = function(term)
--		vim.cmd("startinsert!")
--		vim.keymap.set("n", "q", ":close<CR>", { noremap = true, silent = true, buffer = term.bufnr })
--	end,
--	on_close = function(term)
--		vim.cmd("startinsert!")
--	end,
--})
--
--function _lazygit_toggle()
--	lazygit:toggle()
--end
--
--vim.keymap.set("n", "<leader>g", ":lua _lazygit_toggle()<CR>", { noremap = true, silent = true })
