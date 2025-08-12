print("Should never print")
-- Set clipboard
vim.opt.clipboard:prepend({ "unnamed", "unnamedplus" })

-- Shell options
vim.o.shell = vim.fn.executable("pwsh") and "pwsh" or "powershell"
vim.o.shellcmdflag =
	"-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
vim.o.shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait"
vim.o.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
vim.o.shellquote = ""
vim.o.shellxquote = ""
