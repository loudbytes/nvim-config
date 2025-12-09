return {
	{
		"guns/vim-sexp",
		config = function()
			vim.g.sexp_filetypes = "clojure,scheme,lisp,timl,janet,fennel"

			-- These are handled by nvim-surround
			vim.g.sexp_enable_insert_mode_mapping = false
			vim.g.sexp_insert_after_wrap = false
		end,
	},
	"tpope/vim-sexp-mappings-for-regular-people",
	"tpope/vim-repeat",
}
