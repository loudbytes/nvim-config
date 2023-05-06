local s, telescope = pcall(require, "telescope")
if not s then
	return
end

local actions = require("telescope.actions")

function telescope_buffer_dir()
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

vim.keymap.set("n", ";f", function()
	telescope_builtin.find_files({ no_ignore = false, hidden = true })
end, opts)

vim.keymap.set("n", ";g", function()
	telescope_builtin.live_grep()
end, opts)

vim.keymap.set("n", ";G", function()
	telescope_builtin.grep_string()
end, opts)

vim.keymap.set("n", ";w", function()
	telescope_builtin.lsp_workspace_symbols()
end, opts)

vim.keymap.set("n", ";d", function()
	telescope_builtin.lsp_document_symbols()
end, opts)

vim.keymap.set("n", ";b", function()
	telescope_builtin.buffers({ initial_mode = "normal" })
end, opts)

vim.keymap.set("n", ";t", function()
	telescope_builtin.help_tags()
end, opts)

vim.keymap.set("n", ";;", function()
	telescope_builtin.resume()
end, opts)

vim.keymap.set("n", ";e", function()
	telescope_builtin.diagnostics()
end, opts)

vim.keymap.set("n", "sf", function()
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
end, opts)
