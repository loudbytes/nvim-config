return {
	{
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup({
				format_on_save = {
					lsp_fallback = true,
				},
				formatters_by_ft = {
					lua = { "stylua" },
					javascript = { "prettierd", "prettier", stop_after_first = true },
					typescript = { "prettierd", "prettier", stop_after_first = true },
					c = { "clang-format" },
				},
			})
		end,
	},
}
