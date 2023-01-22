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

	-- Git
	"tpope/vim-fugitive", -- Return to neogit once it's more stable
	"lewis6991/gitsigns.nvim",

	-- UI
	"kyazdani42/nvim-web-devicons",
	"nvim-lualine/lualine.nvim",
	"alvarosevilla95/luatab.nvim",
	"norcalli/nvim-colorizer.lua",
	"j-hui/fidget.nvim",
	"goolord/alpha-nvim",
	"nvim-tree/nvim-tree.lua", -- TODO: Remove this, don't really use it that much

	-- Colorschemes
	"tjdevries/colorbuddy.nvim",
	"morhetz/gruvbox",
	"tanvirtin/monokai.nvim",
	{
		"svrana/neosolarized.nvim",
		dependencies = { "tjdevries/colorbuddy.nvim" },
	},
	"rebelot/kanagawa.nvim",
	"Mofiqul/vscode.nvim",

	-- LSP
	"neovim/nvim-lspconfig",
	"onsails/lspkind-nvim",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/nvim-cmp",
	{ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },
	"windwp/nvim-autopairs", -- I don't know about that.
	"glepnir/lspsaga.nvim",
	"jose-elias-alvarez/null-ls.nvim",
	"ray-x/lsp_signature.nvim",

	-- Language support
	"Tetralux/odin.vim",
})
