require("kyo.conf")
require("kyo.plug")
require("kyo.maps")
require("kyo.highlight")

local has = vim.fn.has

if has("linux") then
	require("kyo.linux")
end

if has("win32") then
	require("kyo.win32")
end

if vim.g.neovide then
	require("kyo.neovide")
end
