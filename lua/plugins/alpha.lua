return {
	{
		"oolord/alpha-nvim",
		config = function()
			local alpha = require("alpha")
			local dashboard = require("alpha.themes.dashboard")

			dashboard.section.header.val = {
				"                                                     ",
				"  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
				"  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
				"  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
				"  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
				"  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
				"  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
				"                                                     ",
			}

			local settings_location
			if vim.fn.has("win32") == 1 then
				settings_location = "$LOCALAPPDATA/nvim"
			else
				settings_location = "~/.config/nvim"
			end

			dashboard.section.buttons.val = {
				dashboard.button("e", "  > New file", ":ene <BAR> startinsert <CR>"),
				dashboard.button("f", "󰈞  > Find file", ":cd d:/ | Telescope find_files<CR>"),
				dashboard.button("r", "  > Recent", ":Telescope oldfiles<CR>"),
				dashboard.button("s", "  > Settings", ":cd " .. settings_location .. " | :e . | wincmd k | pwd<CR>"),
			}

			alpha.setup(dashboard.opts)
		end,
	},
}
