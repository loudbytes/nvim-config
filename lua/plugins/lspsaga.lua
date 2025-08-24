return {
	{
		"nvimdev/lspsaga.nvim",
		opts = {
			ui = {
				winblend = 10,
				border = "rounded",
				code_action = "",
				colors = {
					normal_bg = "#002b36",
				},
			},
			symbol_in_winbar = {
				enable = false,
			},
		},
		dependencies = {
			"nvim-treesitter/nvim-treesitter", -- optional
			"nvim-tree/nvim-web-devicons", -- optional
		},
	},
}
