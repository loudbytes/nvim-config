local s, colorizer = pcall(require, "colorizer")
if not s then
	return
end

colorizer.setup({
	"*",
})
