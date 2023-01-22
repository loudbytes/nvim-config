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
					["/"] = function() end,
				},
			},
		},
	},
})

telescope.load_extension("file_browser")

local opts = { noremap = true, silent = true }
vim.keymap.set(
	"n",
	";f",
	"<cmd>lua require('telescope.builtin').find_files({no_ignore = false, hidden = true})<cr>",
	opts
)
vim.keymap.set("n", ";g", "<cmd>lua require('telescope.builtin').live_grep()<cr>", opts)
vim.keymap.set("n", ";b", "<cmd>lua require('telescope.builtin').buffers({initial_mode = 'normal'})<cr>", opts)
vim.keymap.set("n", ";t", "<cmd>lua require('telescope.builtin').help_tags()<cr>", opts)
vim.keymap.set("n", ";;", "<cmd>lua require('telescope.builtin').resume()<cr>", opts)
vim.keymap.set("n", ";e", "<cmd>lua require('telescope.builtin').diagnostics()<cr>", opts)
vim.keymap.set(
	"n",
	"sf",
	'<cmd>lua require("telescope").extensions.file_browser.file_browser({path="%:p:h", cwd = telescope_buffer_dir(), respect_git_ignore = false, hidden = true, grouped = true, initial_mode = "normal", layout_config = { height = 80 } })<cr>',
	opts
)
