local success, todo = pcall(require, "todo-comments")
if not success then
	return
end

todo.setup({
	signs = false,
	highlight = {
		before = "",
		keyword = "fg",
		after = "",
		pattern = [[(KEYWORDS).*:\s]],
	},
	search = {
		pattern = [[\b(KEYWORDS).*:]],
	},
})
