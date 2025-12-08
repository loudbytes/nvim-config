return {
	{
		"Olical/conjure",
		ft = { "fennel", "janet" },
		lazy = true,

		init = function()
			vim.g["conjure#filetype#janet"] = "conjure.client.janet.stdio"
			vim.g["conjure#filetype#fennel"] = "conjure.client.fennel.stdio"

			vim.g["conjure#mapping#doc_word"] = "gK" -- K is already our key for lsp definitions

			-- Prefix conjure commands with ,c
			--vim.g["conjure#mapping#prefix"] = ",c"

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
