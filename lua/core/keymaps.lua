-- [[
-- keymaps.lua
-- Contains my personal keybindings.
-- ]]

local bind = vim.keymap.set

-- Don't yank with x
bind("n", "x", '"_x')
bind("n", "X", '"_X')
bind("v", "x", '"_x')
bind("v", "X", '"_X')

-- Move around in insert mode by holding ctrl and using the movement keys
bind("i", "<C-h>", "<C-o>h", { noremap = true, silent = true })
bind("i", "<C-j>", "<C-o>j", { noremap = true, silent = true })
bind("i", "<C-k>", "<C-o>k", { noremap = true, silent = true })
bind("i", "<C-l>", "<C-o>l", { noremap = true, silent = true })

-- Insert lambda character with <C-\>
bind("i", "<C-\\>", "λ", { noremap = true, silent = true })

-- Tab controls
bind("n", "te", ":tabedit<CR>", { noremap = true, silent = true, desc = "Open a new tab" })
bind("n", "<S-Tab>", ":tabprev<CR>", { silent = true })
bind("n", "<Tab>", ":tabnext<CR>", { silent = true })

-- Don't exit visual mode when we change indent of selection
bind("v", "<", "<gv", { noremap = true, silent = true })
bind("v", ">", ">gv", { noremap = true, silent = true })

-- Resize splits
bind("n", "<C-w><left>", "<C-w><")
bind("n", "<C-w><right>", "<C-w>>")
bind("n", "<C-w><up>", "<C-w>+")
bind("n", "<C-w><down>", "<C-w>-")

-- Format with Alt-F
bind("n", "<M-f>", vim.lsp.buf.format)

-- Close the current buffer.
bind("n", "<leader>bx", ":bd<CR>", { noremap = true, silent = true, desc = "Close current buffer" })

bind("n", "<A-j>", ":MoveLine(1)<CR>", { noremap = true, silent = true })
bind("n", "<A-k>", ":MoveLine(-1)<CR>", { noremap = true, silent = true })
bind("n", "<A-h>", ":MoveWord(-1)<CR>", { noremap = true, silent = true })
bind("n", "<A-l>", ":MoveWord(1)<CR>", { noremap = true, silent = true })

bind("v", "<A-j>", ":MoveBlock(1)<CR>", { noremap = true, silent = true })
bind("v", "<A-k>", ":MoveBlock(-1)<CR>", { noremap = true, silent = true })
bind("v", "<A-h>", ":MoveHBlock(-1)<CR>", { noremap = true, silent = true })
bind("v", "<A-l>", ":MoveHBlock(1)<CR>", { noremap = true, silent = true })

-- Conjure
--bind("n", ",e", "<Cmd>ConjureEval<CR>", { noremap = true, silent = true })
--bind("n", ",l", "<Cmd>ConjureLogVSplit<CR>", { noremap = true, silent = true })

-- LSP controls
bind("n", "<C-j>", "<Cmd>Lspsaga diagnostic_jump_next<cr>", { noremap = true, silent = true })
bind("n", "<C-k>", "<Cmd>Lspsaga show_cursor_diagnostics<cr>", { noremap = true, silent = true })
bind("n", "K", "<Cmd>Lspsaga hover_doc<cr>", { noremap = true, silent = true })
bind("n", "<leader>sg", "<Cmd>Lspsaga lsp_finder<cr>", { noremap = true, silent = true, desc = "Goto definition" })
bind(
	"n",
	"<leader>sp",
	"<Cmd>Lspsaga preview_definition<cr>",
	{ noremap = true, silent = true, desc = "Preview definition" }
)
bind("n", "<leader>sr", "<Cmd>Lspsaga rename<cr>", { noremap = true, silent = true, desc = "Rename symbol" })
bind("n", "gl", "<Cmd>Lspsaga show_line_diagnostics<cr>", { noremap = true, silent = true })

bind("n", "<leader>dt", function()
	if vim.diagnostic.is_enabled() then
		vim.diagnostic.enable(false)
	else
		vim.diagnostic.enable()
	end
end, { noremap = true, silent = true, desc = "Toggle diagnostics" })

-- Neogit
bind("n", "<leader>go", "<CMD>Neogit<CR>", { noremap = true, silent = true, desc = "Open neogit" })

-- Like emacs' compile mode
bind("n", "<leader>mc", "<CMD>vertical Compile ./build.sh<CR>", { noremap = true, silent = true, desc = "Compile" })
bind("n", "<leader>mr", "<CMD>vertical Recompile<CR>", { noremap = true, silent = true, desc = "Recompile" })
bind(
	"n",
	"<leader>bm",
	"<CMD>buffer *compilation*<CR>",
	{ noremap = true, silent = true, desc = "Open compilation buffer" }
)

bind("n", "<leader>en", "<CMD>NextError<CR>", { noremap = true, silent = true, desc = "Jump to next compile error" })
bind(
	"n",
	"<leader>ep",
	"<CMD>PrevError<CR>",
	{ noremap = true, silent = true, desc = "Jump to previous compile error" }
)

-- Toggle wrapping
bind("n", "<leader>tw", function()
	vim.wo.wrap = not vim.wo.wrap
end, { noremap = true, silent = true, desc = "Toggle wrap" })

local SCRATCH_BUFFER_NAME = "*scratch*"
bind("n", "<leader>bs", function()
	local scratch_buffer = vim.fn.bufnr(SCRATCH_BUFFER_NAME)
	if scratch_buffer ~= -1 then
		local windownum = vim.fn.bufwinnr(scratch_buffer)
		if windownum ~= -1 then
			vim.cmd(windownum .. " wincmd w")
		else
			vim.cmd("buffer " .. scratch_buffer)
		end
	else
		-- create scratch buf
		local bufnr = vim.api.nvim_create_buf(true, true)
		vim.api.nvim_buf_set_name(bufnr, SCRATCH_BUFFER_NAME)
		vim.cmd("buffer " .. bufnr)
	end
end, { noremap = true, silent = true, desc = "Open scratch buffer" })

-- Journaling

local function get_journal_directory()
	return "~/journal/"
end

local function get_todays_journal_path()
	local file_path = get_journal_directory() .. "./daily/" .. vim.fn.strftime("%Y-%m-%d") .. ".md"
	return file_path
end

local function get_todo_path()
	return get_journal_directory() .. "./todo.md"
end

local function get_gripes_file()
	return "~/gripes.md"
end

bind("n", "<leader>jd", function()
	vim.cmd("e " .. get_todays_journal_path())
	-- TODO: If no entry is found, open the file and add a header with the date
end, { noremap = true, silent = true, desc = "Open today's daily journal" })

bind("n", "<leader>jt", function()
	vim.cmd("e " .. get_todo_path())
end, { noremap = true, silent = true, desc = "Open TODO file" })

bind("n", "<leader>je", function()
	vim.cmd("e " .. get_journal_directory())
end, { noremap = true, silent = true, desc = "Open journal directory" })

bind("n", "<leader>jg", function()
	vim.cmd("e " .. get_gripes_file())
end, { noremap = true, silent = true, desc = "Open gripes file" })
