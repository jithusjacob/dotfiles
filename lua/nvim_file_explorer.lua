
vim.api.nvim_set_keymap("n","<space>fd",":NvimTreeToggle<CR>",{ noremap = true })
vim.api.nvim_set_keymap("n","<space>fdr",":NvimTreeRefresh<CR>",{ noremap = true })
vim.g.nvim_tree_width = 35
require'nvim-tree'.setup {
	disable_netrw = true,
	git = {
    enable = true,
    ignore = false,
    timeout = 400,
  },

}
