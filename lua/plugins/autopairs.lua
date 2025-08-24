return {
	{
		"windwp/nvim-autopairs",
		opts = {
			disable_filetype = { "TelescopePrompt", "vim" },

			enabled = function()
				return true
			end,
		},
	},
}
