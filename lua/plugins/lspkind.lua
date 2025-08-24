return {
	{
		"onsails/lspkind-nvim",
		opts = {
			-- defines how annotations are shown
			-- default: symbol
			-- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
			mode = "symbol",

			-- default symbol map
			-- can be either 'default' (requires nerd-fonts font) or
			-- 'codicons' for codicon preset (requires vscode-codicons font)
			--
			-- default: 'default'
			preset = "codicons",

			-- override preset symbols
			--
			-- default: {}
			symbol_map = require("lsp_icons"),
		},
	},
}
