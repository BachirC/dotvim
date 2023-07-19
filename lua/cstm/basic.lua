-- ###### OPTIONS #######

-- Interface
vim.o.number = true
vim.o.cursorline = true
vim.o.expandtab = false
vim.o.hidden = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.lazyredraw = true

-- Use persistent history.
vim.o.undodir = "/tmp/.vim-undo-dir"
vim.o.undofile = true

-- With karabiner mapping, this allows to use Tab for folding while not breaking <C-i> for forward jump.
--vim.keymap.set("n", "<F6>", "<C-i>", { desc = "[map] karabiner mapping to preserve forward jump."})

--vim.keymap.set("n", "<silent><Leader>L", ":put! =printf('console.log(''%s:'',  %s);', expand('<cword>'), expand('<cword>'))<CR>", { desc = "[map-normal] Insert console.log with word under cursor."})
--vim.keymap.set("x", "<Leader>L", "ayOconsole.log('<C-R>a:', <C-R>a);<Esc>", { desc = "[map-visual] Insert console.log with word under cursor."})
