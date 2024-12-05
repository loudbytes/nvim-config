return {
	{
		"akinsho/toggleterm.nvim",
		config = function()
			local s, toggleterm = pcall(require, "toggleterm")
			if not s then
				return
			end

			local Terminal = require("toggleterm.terminal").Terminal

			toggleterm.setup({
				open_mapping = [[<C-\>t]],
				hide_numbers = true,
				close_on_exit = true,
				direction = "float",
				shell = vim.o.shell,
			})

			vim.keymap.set("n", "<Leader>tf", ":ToggleTerm direction=float<CR>", { silent = true })

			local tab_term = Terminal:new({
				dir = "git_dir",
				direction = "tab",
				close_on_exit = true,
				hidden = true,
				start_in_insert = true,
				persist_size = false,
				on_open = function(term)
					vim.keymap.set("n", "q", ":close<CR>", { noremap = true, silent = true, buffer = term.bufnr })
				end,
			})

			local bottom_term = Terminal:new({
				dir = "git_dir",
				direction = "horizontal",
				size = 15,
				close_on_exit = true,
				hidden = true,
				start_in_insert = true,
				persist_size = false,
				on_open = function(term)
					vim.keymap.set("n", "q", ":close<CR>", { noremap = true, silent = true, buffer = term.bufnr })
				end,
			})

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
				on_close = function(_)
					vim.cmd("startinsert!")
				end,
			})

			vim.keymap.set("n", "<leader>gt", function()
				lazygit:toggle()
			end, { noremap = true, silent = true })

			vim.keymap.set("n", "tt", function()
				bottom_term:toggle()
			end, { noremap = true, silent = true })

			vim.keymap.set("n", "<leader>tt", function()
				tab_term:toggle()
			end, { noremap = true, silent = true })
		end,
	},
}
