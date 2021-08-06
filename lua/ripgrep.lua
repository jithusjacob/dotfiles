vim.api.nvim_set_keymap('n', '<Leader>ft',':Rg \\[+\\s+\\]<CR>',
{ noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fat',':Rg :action:<CR>',
{ noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fit',':Rg :ideas:<CR>',
{ noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>ftt',':Rg :task:<CR>',
{ noremap = true, silent = true })
