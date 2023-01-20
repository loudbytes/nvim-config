local status, packer = pcall(require, "packer")
if not status then
	return
end

vim.cmd([[packadd packer.nvim]])

packer.startup(function(use)
	use("wbthomason/packer.nvim")

	-- [[ Plugin Utilities ]]
	use("nvim-lua/plenary.nvim")

	-- [[ Utility Plugins ]]
	use("nvim-telescope/telescope.nvim")
	use("nvim-telescope/telescope-file-browser.nvim")
	use("akinsho/toggleterm.nvim")
	use("fedepujol/move.nvim")
	use("folke/todo-comments.nvim")
	use({
		"smjonas/inc-rename.nvim",
		config = function()
			require("inc_rename").setup()
		end,
	})
	use({
		"rmagatti/goto-preview",
		config = function()
			require("goto-preview").setup({ default_mappings = true })
		end,
	})
	use({
		"TimUntersberger/neogit",
		require = "nvim-lua/plenary.nvim",
	})
	use("mg979/vim-visual-multi")

	-- [[ UI Plugins ]]
	use("kyazdani42/nvim-web-devicons")
	use({
		"nvim-lualine/lualine.nvim",
		requires = {
			"kyazdani42/nvim-web-devicons",
			opt = true,
		},
	})
	use("alvarosevilla95/luatab.nvim")
	use("norcalli/nvim-colorizer.lua")
	use("j-hui/fidget.nvim")
	use("goolord/alpha-nvim")
	use("nvim-tree/nvim-tree.lua")

	-- [[ Colorschemes ]]
	use("morhetz/gruvbox")
	use("tanvirtin/monokai.nvim")
	use({
		"svrana/neosolarized.nvim",
		requires = { "tjdevries/colorbuddy.nvim" },
	})
	use("rebelot/kanagawa.nvim")
	use("Mofiqul/vscode.nvim")

	-- [[ LSP]]
	use("neovim/nvim-lspconfig")
	use("onsails/lspkind-nvim")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/nvim-cmp")
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("windwp/nvim-autopairs")
	use("glepnir/lspsaga.nvim")
	use("jose-elias-alvarez/null-ls.nvim")
	use("ray-x/lsp_signature.nvim")

	-- [[ Language Support]]
	use("Tetralux/odin.vim")
end)
