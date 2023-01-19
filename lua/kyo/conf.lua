--vim.cmd('autocmd!')

vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

vim.wo.number = true
vim.wo.relativenumber = true

vim.opt.title = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.hlsearch = true
vim.opt.backup = false
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 3
vim.opt.showmode = false
vim.opt.expandtab = true
vim.opt.scrolloff = 10
vim.opt.shell = "zsh"
vim.opt.mouse = "a"
vim.opt.inccommand = "split"
vim.opt.signcolumn = "yes"
vim.opt.timeoutlen = 400
vim.opt.updatetime = 250

vim.opt.lazyredraw = true
vim.opt.ignorecase = true
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.ai = true
vim.opt.si = true
vim.opt.wrap = false
vim.opt.backspace = "start,eol,indent"
vim.opt.path:append({ "**" }) -- Finding files - Search down into subfolders
vim.opt.wildignore:append({ "*/Packages/*", "*/node_modules/*" })

vim.opt.whichwrap:append("<>[]hl")

vim.opt.clipboard:prepend({ "unnamedplus" })

vim.api.nvim_create_autocmd("InsertLeave", {
	pattern = "*",
	command = "set nopaste",
})

vim.api.nvim_create_autocmd("BufRead,BufNewFile", {
	pattern = "*.luau",
	command = "set filetype=luau",
})

vim.opt.guifont = { "Hack NF", ":h18" }

vim.opt.formatoptions:append({ "r" })

if vim.fn.has("win32") == 1 then
	vim.opt.clipboard:prepend({ "unnamed", "unnamedplus" })
	vim.opt.shell = "cmd"
end

vim.g.neovide_refresh_rate = 166
vim.g.neovide_cursor_vfx_mode = "railgun"
vim.g.fontsize = 18

-- remove default plugins we don't need
local default_plugins = {
	"2html_plugin",
	"netrw",
	"netrwPlugin",
	"netrwSettings",
	"netrwFileHandlers",
	"tutor",
	"bugreport",
}

for _, plugin in ipairs(default_plugins) do
	vim.g["loaded_" .. plugin] = 1
end

--vim.opt.backupskip = '/tmp/*'
