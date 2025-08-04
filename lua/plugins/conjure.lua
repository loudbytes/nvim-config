return {
	{
		"Olical/conjure",
		ft = { "janet" },
		lazy = false,

		init = function()
			vim.g["conjure#filetype#janet"] = "conjure.client.janet.stdio"

			-- uncomment to get verbose logging (useful when conjure breaks)
			-- vim.g["conjure#debug"] = true
		end,

		dependencies = { "PaterJason/cmp-conjure" },
	},
	{
		"PaterJason/cmp-conjure",
		lazy = true,
		config = function()
			local cmp = require("cmp")
			local config = cmp.get_config()
			table.insert(config.sources, { name = "conjure" })
			return cmp.setup(config)
		end,
	},
}
