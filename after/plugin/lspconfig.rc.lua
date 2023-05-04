local s, nvim_lsp = pcall(require, "lspconfig")
if not s then
	return
end

local configs = require("lspconfig.configs")
local protocol = require("vim.lsp.protocol")

local on_attach = function(_client, bufnr)
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end
	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end

	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

	local opts = { noremap = true, silent = true }

	buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
	buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
end

protocol.CompletionItemKind = {
	"", -- Text
	"", -- Method
	"", -- Function
	"", -- Constructor
	"", -- Field
	"", -- Variable
	"", -- Class
	"ﰮ", -- Interface
	"", -- Module
	"", -- Property
	"", -- Unit
	"", -- Value
	"", -- Enum
	"", -- Keyword
	"﬌", -- Snippet
	"", -- Color
	"", -- File
	"", -- Reference
	"", -- Folder
	"", -- EnumMember
	"", -- Constant
	"", -- Struct
	"", -- Event
	"ﬦ", -- Operator
	"", -- TypeParameter
}

local capabilities = require("cmp_nvim_lsp").default_capabilities()
capabilities.offsetEncoding = { "utf-16" }

local luau_root_files = {
	"*.project.json",
	"sourcemap.json",
}

local luau_def_location = "/home/kyo/luau-lsp/globalTypes.d.lua"
local luau_docs_location = "/home/kyo/luau-lsp/api-docs.json"

if vim.fn.has("win32") then
	luau_def_location = "C:/luau-lsp/globalTypes.d.lua"
	luau_docs_location = "C:/luau-lsp/api-docs.json"
end

local cmd = {
	"luau-lsp",
	"lsp",
	"--definitions=" .. luau_def_location,
	"--docs=" .. luau_docs_location,
}

if not configs.luaulsp then
	configs.luaulsp = {
		default_config = {
			cmd = cmd,
			filetypes = { "lua", "luau" },
			root_dir = nvim_lsp.util.root_pattern(unpack(luau_root_files)),
			single_file_support = false,
			settings = {},
		},
	}
end

nvim_lsp.luaulsp.setup({
	on_init = function(client)
		client.config.cmd = {
			unpack(cmd),
			"--sourcemap=" .. vim.lsp.buf.list_workspace_folders()[1] .. "/sourcemap.json",
		}
		client.notify("workspace/didChangeConfiguration", client.config)
		return true
	end,
	on_attach = on_attach,
	capabilities = capabilities,
})

nvim_lsp.clangd.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

nvim_lsp.rust_analyzer.setup({})

nvim_lsp.ols.setup({})

nvim_lsp.tsserver.setup({})
