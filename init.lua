require("core.conf")

local has = vim.fn.has

if has("linux") then
	require("core.platform.linux")
end

--if has("wsl") then
--	require("core.platform.wsl")
--end

if has("macunix") then
	require("core.platform.macos")
else
	require("core.platform.win32")
end

if vim.g.neovide then
	require("core.platform.neovide")
end

require("core.plug")
require("core.highlight")
require("core.maps")
