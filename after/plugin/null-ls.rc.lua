local s, null_ls = pcall(require, "null-ls")
if not s then
	return
end

local augroup = vim.api.nvim_create_autogroup("LspFormatting", {})

local function lsp_formatting(bufnr)
	vim.lsp.buf.format({
		filter = function(client)
			return client.name == "null-ls"
		end,
		bufnr = bufnr,
	})
end

null_ls.setup({
	sources = {
		-- Diagnostics
		null_ls.builtins.diagnostics.selene.with({
			diagnostics_format = "[selene] #{m}\n(#{c})",
		}),
		null_ls.builtins.diagnostics.eslint.with({
			diagnostics_format = "[eslint] #{m}\n(#{c})",
		}),

		-- Formatting
		null_ls.builtins.formatting.prettierd,
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.clang_format,
		null_ls.builtins.formatting.rustfmt,
	},

	on_attach = function(client, bufnr)
		if client.server_capabilities.documentFormattingProvider then
			vim.api.nvim_clear_autocmds({ buffer = bufnr, group = augroup })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					lsp_formatting(bufnr)
				end,
			})
		end
	end,
})

vim.api.nvim_create_user_command("DisableLspFormatting", function()
	vim.api.nvim_clear_autocmds({ group = augroup, buffer = 0 })
end, { nargs = 0 })
