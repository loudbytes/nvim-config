local s, staline = pcall(require, "staline")
if not s then
	return
end

staline.setup({
	sections = {
		left = {
			"mode",
			" ",
			"branch",
			" ",
			"lsp",
		},

		mid = {
			"file_name",
		},

		right = {
			"cool_symbol",
			" ",
			vim.bo.fileencoding:upper(),
			" ",
			"file_size",
		},
	},
})
