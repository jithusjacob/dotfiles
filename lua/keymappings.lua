-- Easier Split Navigation
--So instead of ctrl-w then j, it’s just ctrl-j
vim.api.nvim_set_keymap('n', '<C-J>', '<C-W><C-J>', { noremap = true, silent = true }) 
vim.api.nvim_set_keymap('n', '<C-K>', '<C-W><C-K>', { noremap = true, silent = true }) 
vim.api.nvim_set_keymap('n', '<C-L>', '<C-W><C-L>', { noremap = true, silent = true }) 
vim.api.nvim_set_keymap('n', '<C-H>', '<C-W><C-H>', { noremap = true, silent = true }) 


-- CheckBox toggle
vim.api.nvim_set_keymap('n', '<Leader>to',':s/\\v\\*\\s(\\[\\s\\]|\\[x\\]|)/* [ ]/<CR>',
{ noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>tc',':s/\\v\\*(\\s\\[\\s\\])/* [x]/<CR>',
{ noremap = true, silent = true })

