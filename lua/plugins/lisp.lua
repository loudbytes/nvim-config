return {
	{
		"guns/vim-sexp",
		enable = false,
		init = function()
			vim.g.sexp_filetypes = "clojure,scheme,lisp,timl,janet,fennel"

			-- These are neat and all, but they don't let me close orphaned parenthesis.
			-- It seems the expected behavior is broken, so I'd rather keep them off instead.
			vim.g["sexp_enable_insert_mode_mappings"] = false
			vim.g["sexp_insert_after_wrap"] = false
		end,
	},
	"tpope/vim-sexp-mappings-for-regular-people",
	"tpope/vim-repeat",
}
