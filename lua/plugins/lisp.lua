return {
	{
		"guns/vim-sexp",
		config = function()
			vim.g.sexp_filetypes = "clojure,scheme,lisp,timl,janet,fennel"
		end,
	},
	"tpope/vim-sexp-mappings-for-regular-people",
	"tpope/vim-repeat",
}
