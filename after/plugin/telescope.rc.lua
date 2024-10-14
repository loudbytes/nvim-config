local s, telescope = pcall(require, "telescope")
if not s then
	return
end

local actions = require("telescope.actions")

local function telescope_buffer_dir()
	return vim.fn.expand("%:p:h")
end

local fb_actions = require("telescope").extensions.file_browser.actions

telescope.setup({
	defaults = {
		mappings = {
			n = {
				["q"] = actions.close,
			},
		},
	},
	extensions = {
		file_browser = {
			--theme = "dropdown",
			sorting_strategy = "ascending",
			preview_cutoff = 1,
			hijack_netrw = true,
			initial_mode = "normal",
			hidden = true,
			grouped = true,
			max_colums = 200,
			mappings = {
				["i"] = {
					["<C-w>"] = function()
						vim.cmd("normal vbd")
					end,
				},
				["n"] = {
					["N"] = fb_actions.create,
					["h"] = fb_actions.goto_parent_dir,
					["/"] = function()
						vim.cmd("startinsert")
					end,
				},
			},
		},
	},
})

telescope.load_extension("file_browser")

local opts = { noremap = true, silent = true }

local telescope_builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>ff", function()
	telescope_builtin.find_files({ no_ignore = false, hidden = true })
end, { noremap = true, silent = true, desc = "Find files" })

vim.keymap.set("n", "<leader>fg", function()
	telescope_builtin.live_grep()
end, { noremap = true, silent = true, desc = "Live grep" })

vim.keymap.set("n", "<leader>fG", function()
	telescope_builtin.grep_string()
end, { noremap = true, silent = true, desc = "Grep string" })

vim.keymap.set("n", "<leader>fw", function()
	telescope_builtin.lsp_workspace_symbols()
end, { noremap = true, silent = true, desc = "Workspace symbols" })

vim.keymap.set("n", "<leader>fs", function()
	telescope_builtin.lsp_document_symbols()
end, { noremap = true, silent = true, desc = "Document symbols" })

vim.keymap.set("n", "<leader>fb", function()
	telescope_builtin.buffers({ initial_mode = "normal" })
end, { noremap = true, silent = true, desc = "Buffers" })

vim.keymap.set("n", "<leader>ft", function()
	telescope_builtin.help_tags()
end, { noremap = true, silent = true, desc = "Help tags" })

vim.keymap.set("n", ";;", function()
	telescope_builtin.resume()
end, { noremap = true, silent = true, desc = "Resume last" })

vim.keymap.set("n", "<leader>fd", function()
	telescope_builtin.diagnostics()
end, { noremap = true, silent = true, desc = "Diagnostics" })

vim.keymap.set("n", "<leader>fe", function()
	telescope.extensions.file_browser.file_browser({
		path = "%:p:h",
		cwd = telescope_buffer_dir(),
		respect_git_ignore = false,
		hidden = true,
		grouped = true,
		previewer = false,
		initial_mode = "normal",
		layout_config = { height = 80 },
	})
end, { noremap = true, silent = true, desc = "File browser" })
