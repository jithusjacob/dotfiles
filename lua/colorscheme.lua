local cmd = vim.cmd
vim.o.termguicolors = true
cmd 'colorscheme NeoSolarized'
cmd 'set background=dark'
vim.cmd([[ autocmd ColorScheme * :lua require('vim.lsp.diagnostic')._define_default_signs_and_highlights() ]])

