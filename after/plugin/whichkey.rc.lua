local success, whichkey = pcall(require, "which-key")
if not success then
	return
end

whichkey.setup({})
