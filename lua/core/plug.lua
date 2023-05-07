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
	"folke/which-key.nvim",
	"folke/zen-mode.nvim",
	"folke/trouble.nvim",
	{
		"skywind3000/asynctasks.vim",
		dependencies = { "skywind3000/asyncrun.vim" },
	},
	"windwp/nvim-ts-autotag",
	"iamcco/markdown-preview.nvim",
	"lewis6991/gitsigns.nvim",
	"norcalli/nvim-colorizer.lua",

	-- UI
	"kyazdani42/nvim-web-devicons",
	"nvim-lualine/lualine.nvim",
	"akinsho/bufferline.nvim",
	"j-hui/fidget.nvim",
	"goolord/alpha-nvim",

	-- Colorschemes
	"tjdevries/colorbuddy.nvim",
	"gruvbox-community/gruvbox",
	"svrana/neosolarized.nvim",
	"sainnhe/gruvbox-material",
	"savq/melange-nvim",
	"bluz71/vim-moonfly-colors",
	{
		"catppuccin/nvim",
		name = "catppuccin",
	},
	"captalbator/handmade-nvim",

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
