local success, neorg = pcall(require, "neorg")
if not success then
	return
end

local workspaces
if vim.fn.has("win32") == 1 then
	workspaces = { work = "d:/notes/work", personal = "d:/notes/personal" }
else
	workspaces = { work = "~/notes/work", personal = "~/notes/personal" }
end

neorg.setup({
	load = {
		["core.defaults"] = {},
		["core.norg.dirman"] = {
			config = {
				workspaces = workspaces,
			},
		},
		["core.norg.concealer"] = {},
		["core.norg.completion"] = { config = { engine = "nvim-cmp" } },
		["core.integrations.nvim-cmp"] = {},
		["core.gtd.base"] = { config = { workspace = "personal" } },
	},
})
