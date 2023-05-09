local s, ts = pcall(require, "nvim-treesitter.configs")
if not s then
	return
end

local success, ts_context = pcall(require, "treesitter-context")
if success then
	ts_context.setup({})
end

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

parser_config.luau = {
	install_info = {
		url = "https://github.com/polychromatist/tree-sitter-luau",
		files = { "src/parser.c", "src/scanner.c" },
		revision = ".",
		branch = "main",
		generate_requires_npm = false,
		requires_generate_from_grammar = false,
	},
	filetype = "luau",
}

parser_config.odin = {
	install_info = {
		url = "https://github.com/ap29600/tree-sitter-odin",
		files = { "src/parser.c" },
		branch = "main",
	},
	filetype = "odin",
}

ts.setup({
	highlight = {
		enable = true,
		-- Odin's treesitter highlighting has worse colors
		disable = { "odin" },
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
		--"luau",
		"odin",
		"typescript",
		"javascript",
		"html",
		"css",
		"tsx",
	},
	autotag = {
		enable = true,
	},
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
})

parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
