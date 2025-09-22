local lsp_icons = require("lsp_icons")
return {
	{
		"neovim/nvim-lspconfig",
		config = function()
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
				lsp_icons.Text,
				lsp_icons.Method,
				lsp_icons.Function,
				lsp_icons.Constructor,
				lsp_icons.Field,
				lsp_icons.Variable,
				lsp_icons.Class,
				lsp_icons.Interface,
				lsp_icons.Module,
				lsp_icons.Property,
				lsp_icons.Unit,
				lsp_icons.Value,
				lsp_icons.Enum,
				lsp_icons.Keyword,
				lsp_icons.Snippet,
				lsp_icons.Color,
				lsp_icons.File,
				lsp_icons.Reference,
				lsp_icons.Folder,
				lsp_icons.EnumMember,
				lsp_icons.Constant,
				lsp_icons.Struct,
				lsp_icons.Event,
				lsp_icons.Operator,
				lsp_icons.TypeParameter,
			}

			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			-- cmp_nvim_lsp only provides capabilities for textDocument so we must define workspace ourselves
			capabilities.workspace = { didChangeWatchedFiles = { dynamicRegistration = true } }
			capabilities.textDocument.completion.completionItem.snippetSupport = true

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

			vim.lsp.config("clangd", {
				on_attach = on_attach,
				capabilities = capabilities,
			})
			vim.lsp.enable("clangd")

			vim.lsp.config("rust_analyzer", {
				on_attach = on_attach,
				capabilities = capabilities,
			})
			vim.lsp.enable("rust_analyzer")

			vim.lsp.config("ols", {
				on_attach = on_attach,
				capabilities = capabilities,
			})
			vim.lsp.enable("ols")

			vim.lsp.config("ts_ls", {
				on_attach = on_attach,
				filetypes = { "javascript", "typescript", "typescriptreact", "typescript.tsx" },
				capabilities = capabilities,
			})
			vim.lsp.enable("ts_ls")

			vim.lsp.config("html", {
				on_attach = on_attach,
				capabilities = capabilities,
				filetypes = { "html", "njk" },
			})
			vim.lsp.enable("html")

			vim.lsp.config("cssls", {
				on_attach = on_attach,
				capabilities = capabilities,
			})
			vim.lsp.enable("cssls")

			vim.lsp.config("lua_ls", {
				on_attach = on_attach,
				capabilities = capabilities,
			})
			vim.lsp.enable("lua_ls")

			vim.lsp.config("jinja_lsp", {
				capabilities = capabilities,
				filetypes = { "njk", "jinja", "html.jinja" },
				root_markers = { "package.json", ".git" },
				settings = {
					template_extensions = { "njk", "html.jinja" },
				},
			})
			vim.lsp.enable("jinja_lsp")

			vim.lsp.config("tinymist", {
				on_attach = on_attach,
				capabilities = capabilities,
			})
			vim.lsp.enable("tinymist")

			vim.lsp.handlers["textDocument/publishDiagnostics"] =
				vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
					underline = true,
					update_in_insert = true,
					virtual_text = { spacing = 4, prefix = "●" },
					severity_sort = true,
				})

			vim.diagnostic.config({
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = "󰅚 ",
						[vim.diagnostic.severity.WARN] = "󰀪 ",
						[vim.diagnostic.severity.HINT] = "󰌶 ",
						[vim.diagnostic.severity.INFO] = " ",
					},

					texthl = {
						[vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
						[vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
						[vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
						[vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
					},
				},
				virtual_text = {
					prefix = "●",
				},
				update_in_insert = true,
				float = {
					source = true, -- Or "if_many"
				},
				true,
			})
		end,
	},
}
