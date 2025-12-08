local vim_version = vim.version()
local operating_system = vim.loop.os_uname().sysname

local MIN_MAJOR = 0
local MIN_MINOR = 11

local INDENT_SIZE = 2

if vim_version.major == MIN_MAJOR and vim_version.minor < MIN_MINOR then
	error("Outdated neovim version! This config only supports neovim version 0.11 or higher.")
end

vim.g.mapleader = " " -- Set <leader> to space
vim.g.maplocalleader = "," -- Set <localleader> to ,
vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.fileformat = "unix"

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.splitright = true
vim.opt.title = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.hlsearch = true
vim.opt.backup = false
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 2
vim.opt.showmode = false
vim.opt.expandtab = false
vim.opt.scrolloff = 10
vim.opt.mouse = "a"
vim.opt.inccommand = "split"
vim.opt.signcolumn = "yes"
vim.opt.timeout = true
vim.opt.timeoutlen = 400
vim.opt.updatetime = 250

vim.opt.cursorline = true
vim.opt.cursorcolumn = false
vim.opt.winblend = 20
vim.opt.wildoptions = "pum"
vim.opt.pumblend = 5
vim.opt.background = "dark"
--vim.opt.colorcolumn = "100"
vim.opt.termguicolors = true

-- Set clipboard
vim.opt.clipboard:prepend({ "unnamedplus" })

-- Shell options
vim.opt.shell = "fish"

-- :Man causes issues when called in visual mode (for some reason?)
vim.opt.keywordprg = ":help"

vim.opt.lazyredraw = false
vim.opt.ignorecase = true
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.shiftwidth = INDENT_SIZE
vim.opt.tabstop = INDENT_SIZE
vim.opt.linebreak = true
vim.opt.wrap = true
vim.opt.backspace = { "start", "eol", "indent" }
vim.opt.path:append({ "**" }) -- Finding files - Search down into subfolders
vim.opt.wildignore:append({ "*/Packages/*", "*/node_modules/*" })

vim.opt.whichwrap:append("<>[]hl")

vim.opt.smoothscroll = true

vim.filetype.add({
	extension = {
		njk = "html.jinja",
	},
})

local number_group = vim.api.nvim_create_augroup("lb_numbers", {
	clear = true,
})

vim.api.nvim_create_autocmd("InsertEnter", {
	group = number_group,
	command = "set norelativenumber",
})

vim.api.nvim_create_autocmd("InsertLeave", {
	group = number_group,
	command = "set relativenumber",
})

vim.api.nvim_create_autocmd("InsertLeave", {
	pattern = "*",
	command = "set nopaste",
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "*.luau",
	command = "set filetype=luau",
})

-- Set file endings to unix-style, always.
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	pattern = "*",
	command = "set fileformat=unix",
})

vim.opt.formatoptions:append({ "r" })

if vim.g.neovide then
	require("core.platform.neovide")
end

-- Init plugins
require("core.plug")

-- Color scheme
-- This isn't in highlight because I change this setting often and having to go to the highlight
-- file everytime got annoying
if false and operating_system == "Darwin" then
	vim.cmd.colorscheme("solarized-osaka")
else
	--vim.cmd.colorscheme("kanagawa-dragon")
	vim.cmd.colorscheme("zenwritten")
end

require("core.highlight")
require("core.keymaps")
