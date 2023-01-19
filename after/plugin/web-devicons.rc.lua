local s, icons = pcall(require, "nvim-web-devicons")
if not s then
	return
end

icons.setup({
	override = {},
	default = true,
})
