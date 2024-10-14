local s, nvim_lsp = pcall(require, "lspconfig")
if not s then
	return
end

local configs = require("lspconfig.configs")
local protocol = require("vim.lsp.protocol")

local path = nvim_lsp.util.path

local on_attach = function(_client, bufnr)
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end
	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end

	-- TODO: Remove this as it isn't necessary with cmp_nvim
	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

	local opts = { noremap = true, silent = true }

	buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
	buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
end

protocol.CompletionItemKind = {
	"", -- Text
	"󰊕", -- Method
	"󰊕", -- Function
	"󰊕", -- Constructor
	"", -- Field
	"", -- Variable
	"", -- Class
	"󰜰", -- Interface
	"󰏗", -- Module
	"", -- Property
	"", -- Unit
	"󰎠", -- Value
	"", -- Enum
	"󰌋", -- Keyword
	"󰘍", -- Snippet
	"", -- Color
	"", -- File
	"󰆑", -- Reference
	"", -- Folder
	"", -- EnumMember
	"", -- Constant
	"", -- Struct
	"", -- Event
	"󰘧", -- Operator
	"", -- TypeParameter
}

local capabilities = require("cmp_nvim_lsp").default_capabilities()
-- cmp_nvim_lsp only provides capabilities for textDocument so we must define workspace ourselves
capabilities.workspace = {
	didChangeWatchedFiles = {
		dynamicRegistration = true,
	},
}

-- TODO: Fetch them automatically
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
			root_dir = nvim_lsp.util.root_pattern("*.project.json", "sourcemap.json"),
			single_file_support = false,
			settings = {},
		},
	}
end

nvim_lsp.luaulsp.setup({
	on_init = function(client)
		local sourcemap_path = vim.lsp.buf.list_workspace_folders()[1] .. "/sourcemap.json"
		if path.exists(sourcemap_path) then
			table.insert(cmd, "--sourcemap=" .. sourcemap_path)
		end

		client.config.cmd = cmd
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

nvim_lsp.rust_analyzer.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

nvim_lsp.ols.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

nvim_lsp.tsserver.setup({
	on_attach = on_attach,
	filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
	capabilities = capabilities,
})

nvim_lsp.astro.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

nvim_lsp.cssls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

nvim_lsp.tailwindcss.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

nvim_lsp.lua_ls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	underline = true,
	update_in_insert = true,
	virtual_text = { spacing = 4, prefix = "●" },
	severity_sort = true,
})

-- Diagnostic symbols in the sign column (gutter)
local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.diagnostic.config({
	virtual_text = {
		prefix = "●",
	},
	update_in_insert = true,
	float = {
		source = true, -- Or "if_many"
	},
})
