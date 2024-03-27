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

-- :Man causes issues when called in visual mode (for some reason?)
vim.opt.keywordprg = ":help"

vim.opt.lazyredraw = false
vim.opt.ignorecase = true
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.wrap = false
vim.opt.backspace = { "start", "eol", "indent" }
vim.opt.path:append({ "**" }) -- Finding files - Search down into subfolders
vim.opt.wildignore:append({ "*/Packages/*", "*/node_modules/*" })

vim.opt.whichwrap:append("<>[]hl")

vim.api.nvim_create_autocmd("InsertLeave", {
	pattern = "*",
	command = "set nopaste",
})

-- errors on latest - look into fixing this
--vim.api.nvim_create_autocmd("BufRead,BufNewFile", {
--	pattern = "*.luau",
--	command = "set filetype=luau",
--})

vim.opt.guifont = { "CaskaydiaMono Nerd Font Mono", ":h13" }

vim.opt.formatoptions:append({ "r" })
