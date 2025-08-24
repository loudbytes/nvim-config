return {
	{
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		opts = {
			highlight = {
				enable = false,
				disable = {},
			},
			indent = {
				enable = true,
				disable = {},
			},
			ensure_installed = {
				"lua",
				"c",
				"cpp",
				"json",
				"toml",
				"rust",
				"yaml",
				"vim",
				"markdown",
				"markdown_inline",
				"typescript",
				"javascript",
				"html",
				"css",
				"tsx",
				"jinja",
			},
			context_commentstring = {
				enable = true,
				enable_autocmd = false,
			},
		},
	},
	"nvim-treesitter/nvim-treesitter-context",
}
