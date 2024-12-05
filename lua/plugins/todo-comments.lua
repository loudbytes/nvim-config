return {
	{
		"folke/todo-comments.nvim",
		opts = {
			signs = false,
			highlight = {
				before = "",
				keyword = "fg",
				after = "",
				pattern = [[(KEYWORDS).*:\s]],
			},
			search = {
				pattern = [[\b(KEYWORDS).*:]],
			},
		},
	},
}
