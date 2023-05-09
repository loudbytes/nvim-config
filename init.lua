require("core.conf")
require("core.plug")
require("core.maps")
require("core.highlight")

local has = vim.fn.has

if has("linux") then
	require("core.platform.linux")
end

--if has("wsl") then
--	require("core.platform.wsl")
--end

if has("win32") then
	require("core.platform.win32")
end

if vim.g.neovide then
	require("core.platform.neovide")
end
