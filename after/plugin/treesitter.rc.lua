local s, ts = pcall(require, "nvim-treesitter.configs")
if not s then
	return
end

local success, ts_context = pcall(require, "treesitter-context")
if success then
	ts_context.setup({})
end

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
local luau_ts_url = "https://github.com/polychromatist/tree-sitter-luau"

parser_config.luau = {
	install_info = {
		url = luau_ts_url,
		files = { "src/parser.c", "src/scanner.c" },
		branch = "main",
		generate_requires_npm = false,
		requires_generate_from_grammar = false,
	},
}

ts.setup({
	highlight = {
		enable = true,
		disable = {},
	},
	indent = {
		enable = true,
		disable = { "cpp" }, -- broken on C++ for some reason
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
		"luau",
	},
	autotag = {
		enable = true,
	},
})
