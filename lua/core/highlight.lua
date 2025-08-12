--[[
-- highlight.lua
-- Contains my settings for highlights.
--]]

-- Highlight yanked area for `highlight_yank_timeout` ms.
-- Useful to know what I yanked
local highlight_yank_timeout = 100
local highlight_yank = vim.api.nvim_create_augroup("highlight_yank", {})
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
	desc = "Highlight yanked text for " .. highlight_yank_timeout .. "ms",
	group = highlight_yank,
	callback = function()
		vim.highlight.on_yank({ higroup = "Visual", timeout = highlight_yank_timeout })
	end,
})

vim.cmd.colorscheme("kanagawa-dragon")

vim.api.nvim_set_hl(0, "Todo", { default = true, bg = "NONE" })

local links = {
	["@lsp.type.namespace"] = "@namespace",
	["@lsp.type.type"] = "@type",
	["@lsp.type.class"] = "@type",
	["@lsp.type.enum"] = "@type",
	["@lsp.type.interface"] = "@type",
	["@lsp.type.struct"] = "@structure",
	["@lsp.type.parameter"] = "@parameter",
	["@lsp.type.variable"] = "@variable",
	["@lsp.type.property"] = "@property",
	["@lsp.type.enumMember"] = "@constant",
	["@lsp.type.function"] = "@function",
	["@lsp.type.method"] = "@method",
	["@lsp.type.macro"] = "@macro",
	["@lsp.type.decorator"] = "@function",
}
for newgroup, oldgroup in pairs(links) do
	vim.api.nvim_set_hl(0, newgroup, { link = oldgroup, default = true })
end
