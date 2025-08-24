return {
	{
		"L3MON4D3/LuaSnip",
		version = "1.*",
		build = "make install_jsregexp",
		config = function()
			local ls = require("luasnip")
			ls.add_snippets("all", {
				ls.snippet("html", {
					ls.text_node({
						"<!DOCTYPE html>",
						'<html lang="en">',
						"  <head>",
						'    <meta charset="utf-8">',
						'    <meta name="viewport" content="width=device-width, initial-scale=1.0">',
						"    <title></title>",
						"  </head>",
						"  <body>",
						"  </body>",
						"</html>",
					}),
				}),
			})
		end,
	},
}
