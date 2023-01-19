local s, autotag = pcall(require, "nvim-ts-autotag")
if not s then
	return
end

autotag.setup({})
