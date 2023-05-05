local s, null_ls = pcall(require, "null-ls")
if not s then
	return
end

null_ls.setup({
	sources = {
		null_ls.builtins.diagnostics.selene.with({
			diagnostics_format = "[selene] #{m}\n(#{c})",
		}),
        null_ls.builtins.diagnostics.eslint.with({
			diagnostics_format = "[eslint] #{m}\n(#{c})",
        }),
        null_ls.builtins.formatting.prettier,
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.clang_format,
		null_ls.builtins.formatting.rustfmt,
	},

	on_attach = function(client, bufnr)
		if client.server_capabilities.documentFormattingProvider then
			vim.api.nvim_clear_autocmds({ buffer = 0, group = augroup_format })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup_format,
				buffer = 0,
				callback = function()
                    --vim.lsp.buf.format()
				end,
			})
		end
	end,
})
