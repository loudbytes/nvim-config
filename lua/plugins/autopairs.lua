return {
	{
		"windwp/nvim-autopairs",

		config = function()
			local npairs = require("nvim-autopairs")
			npairs.setup({
				enable_check_bracket_line = false,
				enable_moveright = false,

				disable_filetype = { "TelescopePrompt", "vim" },

				fast_wrap = {},
			})

			npairs.get_rules("`")[1].not_filetypes = { "scheme", "lisp", "fennel" }
		end,
	},
}
