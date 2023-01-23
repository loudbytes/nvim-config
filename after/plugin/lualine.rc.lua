local s, lualine = pcall(require, "lualine")
if not s then
	return
end

-- stylua: ignore
local colors = {
	white        = "#eeeeee",
	darkestgreen = "#005f00",
	brightgreen  = "#afdf00",
	darkestcyan  = "#005f5f",
	mediumcyan   = "#87dfff",
	darkestblue  = "#005f87",
	darkred      = "#870000",
	brightred    = "#df0000",
	brightorange = "#ff8700",
    darkorange   = "#752e0f",
	orange       = "#d75f00",
    yellow       = "#ffaf5f",
    black        = "#000000",
	gray1        = "#101010",
	gray2        = "#1a1a1a",
	gray4        = "#363636",
	gray5        = "#8a8a8a",
	gray7        = "#8e8e8e",
	gray10       = "#e0e0e0",
}

lualine.setup({
	options = {
		globalstatus = true,
		icons_enabled = true,
		theme = "auto",
		oldtheme = {
			normal = {
				a = { fg = colors.gray2, bg = colors.gray7, gui = "bold" },
				b = { fg = colors.gray7, bg = colors.gray2 },
				c = { fg = colors.gray7, bg = colors.black },
			},
			insert = {
				a = { fg = colors.darkorange, bg = colors.yellow, gui = "bold" },
				b = { fg = colors.gray7, bg = colors.gray2 },
				c = { fg = colors.gray7, bg = colors.black },
			},
			visual = { a = { fg = colors.darkred, bg = colors.brightorange, gui = "bold" } },
			replace = { a = { fg = colors.gray10, bg = colors.darkred, gui = "bold" } },
			inactive = {
				a = { fg = colors.gray1, bg = colors.gray5, gui = "bold" },
				b = { fg = colors.gray1, bg = colors.gray5 },
				c = { bg = colors.gray1, fg = colors.gray7 },
			},
		},
		section_separators = { left = "", right = "" },
		component_separators = { left = "", right = "" },
		disabled_filetypes = {},
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = { { "filename", file_status = true, path = 1 } },
		lualine_x = {},
		lualine_y = { "encoding", "filetype" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { { "filename", file_status = true, path = 1 } },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = { "fugitive" },
})
