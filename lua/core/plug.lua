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
	"folke/trouble.nvim",
	"iamcco/markdown-preview.nvim",
	"lewis6991/gitsigns.nvim",
	"norcalli/nvim-colorizer.lua",
	"echasnovski/mini.pairs",
	"windwp/nvim-ts-autotag",

	-- UI
	"kyazdani42/nvim-web-devicons",
	"nvim-lualine/lualine.nvim",
	"akinsho/bufferline.nvim",
	"j-hui/fidget.nvim",
	"goolord/alpha-nvim",

	-- Colorschemes
	"tjdevries/colorbuddy.nvim",
	-- "gruvbox-community/gruvbox",
	{
		"ellisonleao/gruvbox.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("gruvbox").setup({
				terminal_colors = true,
				undercurl = true,
				underline = true,
				bold = true,
				inverse = false,
				dim_inactive = false,
				italic = {
					strings = false,
					emphasis = false,
					comments = false,
					operators = false,
					folds = false,
				},
			})
		end,
	},

	{ "craftzdog/solarized-osaka.nvim", lazy = false, priority = 1000, opts = {} },
	"sainnhe/gruvbox-material",
	"bluz71/vim-moonfly-colors",
	{
		"catppuccin/nvim",
		name = "catppuccin",
	},
	"captalbator/handmade-nvim",

	-- LSP
	"neovim/nvim-lspconfig",
	"onsails/lspkind-nvim",
	{ "L3MON4D3/LuaSnip", version = "1.*", build = "make install_jsregexp" },
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-nvim-lsp-signature-help",
	"saadparwaiz1/cmp_luasnip",
	"hrsh7th/nvim-cmp",
	{ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },
	"nvim-treesitter/nvim-treesitter-context",
	"windwp/nvim-autopairs",
	"glepnir/lspsaga.nvim",

	{
		"mfussenegger/nvim-lint",
		config = function()
			require("lint").linters_by_ft = {
				lua = { "selene" },
				typescript = { "eslint" },
			}

			vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
				callback = function()
					require("lint").try_lint()
				end,
			})
		end,
	},

	{
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup({
				format_on_save = {
					-- These options will be passed to conform.format() timeout_ms = 500,
					lsp_format = "fallback",
				},
				formatters_by_ft = {
					lua = { "stylua" },
					javascript = { "prettierd", "prettier", stop_after_first = true },
					typescript = { "prettierd", "prettier", stop_after_first = true },
				},
			})
		end,
	},

	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			library = {},
		},
	},

	-- Language support
	"Tetralux/odin.vim",
})
