-- TODO: check for asynctask
vim.g.asyncrun_open = 6

vim.keymap.set("n", "<leader>bb", ":AsyncTask project-build<CR>")
vim.keymap.set("n", "<leader>r", ":AsyncTask project-run<CR>")
vim.keymap.set("n", "<leader>br", ":AsyncTask project-build-and-run<CR>")
