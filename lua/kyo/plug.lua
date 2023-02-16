local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	"nvim-lua/plenary.nvim",

	-- Utility
	"nvim-telescope/telescope.nvim",
	"nvim-telescope/telescope-file-browser.nvim",
	"akinsho/toggleterm.nvim",
	"fedepujol/move.nvim",
	"folke/todo-comments.nvim",
	"mg979/vim-visual-multi",
	"folke/which-key.nvim",
	"folke/zen-mode.nvim",
	"folke/trouble.nvim",
	{
		"skywind3000/asynctasks.vim",
		dependencies = { "skywind3000/asyncrun.vim" },
		config = function()
			vim.g.asyncrun_open = 6
			vim.keymap.set("n", "<leader>bb", ":AsyncTask project-build<CR>")
			vim.keymap.set("n", "<leader>r", ":AsyncTask project-run<CR>")
			vim.keymap.set("n", "<leader>br", ":AsyncTask project-build-and-run<CR>")
		end,
	},

	-- Git
	"tpope/vim-fugitive",
	"lewis6991/gitsigns.nvim",
	"rhysd/git-messenger.vim",

	-- UI
	"kyazdani42/nvim-web-devicons",
	"nvim-lualine/lualine.nvim",
	{
		"akinsho/bufferline.nvim",
		config = function()
			require("bufferline").setup({
				options = {
					mode = "tabs",
					always_show_bufferline = false,
					show_buffer_close_icons = false,
					show_close_icon = false,
					color_icons = true,
				},
			})
		end,
	},
	"norcalli/nvim-colorizer.lua",
	"j-hui/fidget.nvim",
	"goolord/alpha-nvim",
	"nvim-tree/nvim-tree.lua", -- TODO: Remove this, don't really use it that much

	-- Colorschemes
	"tjdevries/colorbuddy.nvim",
	"gruvbox-community/gruvbox",
	{
		"svrana/neosolarized.nvim",
		dependencies = { "tjdevries/colorbuddy.nvim" },
	},
	"rebelot/kanagawa.nvim",
	"Mofiqul/vscode.nvim",
	{
		"sainnhe/gruvbox-material",
	},
	"savq/melange-nvim",
	"bluz71/vim-moonfly-colors",
	"folke/tokyonight.nvim",
	{
		"catppuccin/nvim",
		name = "catppuccin",
		config = function()
			require("catppuccin").setup({
				flavour = "mocha",
				term_colors = true,
				transparent_background = false,
				show_end_of_buffer = true,
				no_italic = true,
				no_bold = false,
				styles = {
					comments = {},
					conditionals = {},
					loops = {},
					functions = {},
					keywords = {},
					strings = {},
					variables = {},
					numbers = {},
					booleans = {},
					properties = {},
					types = {},
				},
				color_overrides = {
					mocha = {
						base = "#000000",
						mantle = "#000000",
						--crust = "#000000",
					},
				},
				highlight_overrides = {
					mocha = function(C)
						return {
							TabLineSel = { bg = C.pink },
							CmpBorder = { fg = C.surface2 },
							Pmenu = { bg = C.none },
							TelescopeBorder = { link = "FloatBorder" },
						}
					end,
				},
				integrations = {
					fidget = true,
				},
			})

			vim.cmd.colorscheme("catppuccin")
		end,
	},
	{ "Everblush/nvim", name = "everblush" },
	"kdheepak/monochrome.nvim",
	{
		"andreypopp/vim-colors-plain",
		_config = function()
			vim.cmd.colorscheme("plain")
		end,
	},
	{
		"jesseleite/nvim-noirbuddy",
		_config = function()
			require("noirbuddy").setup({
				preset = "slate",
			})
		end,
	},
	{
		"metalelf0/jellybeans-nvim",
		dependencies = { "rktjmp/lush.nvim" },
		_config = function()
			vim.cmd.colorscheme("jellybeans-nvim")
		end,
	},
	{
		"kvrohit/rasmus.nvim",
		_config = function()
			vim.cmd.colorscheme("rasmus")
		end,
	},
	{
		"mcchrish/zenbones.nvim",
		dependencies = { "rktjmp/lush.nvim" },
	},

	-- LSP
	"neovim/nvim-lspconfig",
	"onsails/lspkind-nvim",
	{ "L3MON4D3/LuaSnip", version = "<CurrentMajor>.*", build = "make install_jsregexp" },
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-nvim-lsp-signature-help",
	"saadparwaiz1/cmp_luasnip",
	"hrsh7th/nvim-cmp",
	{ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },
	"nvim-treesitter/nvim-treesitter-context",
	"windwp/nvim-autopairs",
	"glepnir/lspsaga.nvim",
	"jose-elias-alvarez/null-ls.nvim",

	-- Language support
	"Tetralux/odin.vim",
})
