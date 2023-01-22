local success, fidget = pcall(require, "fidget")
if not success then
	return
end

fidget.setup({ window = { border = "none", blend = 100 } })
