local s, code = pcall(require, "vscode")
s = false
if not s then
	return
end

code.setup({
	transparent = true,
	italic_comments = false,
	disable_nvimtree_bg = false,
})
