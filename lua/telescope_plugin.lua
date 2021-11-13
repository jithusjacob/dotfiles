
vim.api.nvim_set_keymap('n', '<Leader>p', 
[[<Cmd>lua require('telescope.builtin').find_files()<CR>]], { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<Leader>b', 
[[<Cmd>lua require('telescope.builtin').buffers()<CR>]], { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<Leader>fg', 
[[<Cmd>lua require('telescope.builtin').live_grep()<CR>]], { noremap = true, silent = true })

require('telescope').load_extension('coc')
