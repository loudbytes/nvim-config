local s, autopairs = pcall(require, "nvim-autopairs")
if not s then
	return
end

autopairs.setup({
	disable_filetype = { "TelescopePrompt", "vim" },
})
