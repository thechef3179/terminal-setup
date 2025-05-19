-- create remap for JK for moving entire unbroken line
vim.keymap.set('n', 'J', 'j', { noremap = true, silent = true })
vim.keymap.set('n', 'K', 'k', { noremap = true, silent = true })

vim.keymap.set('n', 'j', 'gj', { noremap = true, silent = true })
vim.keymap.set('n', 'k', 'gk', { noremap = true, silent = true })

vim.opt.linebreak = true
