require("core.conf")

if vim.g.neovide then
	require("core.platform.neovide")
end

require("core.plug")
require("core.highlight")
require("core.maps")
