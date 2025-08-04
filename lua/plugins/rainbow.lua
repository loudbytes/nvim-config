return {
	{
		"HiPhish/rainbow-delimiters.nvim",
		config = function()
			vim.g.rainbow_delimiters = {
				strategy = {
					[""] = "rainbow-delimiters.strategy.global",
				},
				query = {
					[""] = "rainbow-delimiters",
				},
				priority = {
					[""] = 110,
					lua = 210,
				},
				highlight = {
					"RainbowDelimiterYellow",
					"RainbowDelimiterBlue",
					"RainbowDelimiterOrange",
					"RainbowDelimiterGreen",
					"RainbowDelimiterViolet",
					"RainbowDelimiterCyan",
					"RainbowDelimiterRed",
				},
				blacklist = { "c", "cpp" },
			}
		end,
	},
}
