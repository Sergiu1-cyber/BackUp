-- Leader
vim.g.mapleader = " "

-- inchide fisierul si deschide managerul de fisiere
vim.keymap.set("n", "<leader>q", vim.cmd.Ex)

-- Clipboard 
-- apt install termux-api 
vim.keymap.set("v", "<C-c>", ":w !termux-clipboard-set<CR><CR>")
vim.keymap.set("v", "<C-x>", ":!termux-clipboard-set<CR>")
vim.keymap.set("i", "<C-v>", "<ESC>:read !termux-clipboard-get<CR>i")


