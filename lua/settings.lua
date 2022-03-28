-- aliases
local opt  = vim.opt     -- global
opt.relativenumber =true
opt.nu =true
opt.hlsearch = false
opt.scrolloff = 8
opt.signcolumn = 'yes'
vim.cmd([[
     augroup dartFmtOnSave
     autocmd!
     autocmd BufWritePre *.dart :lua vim.lsp.buf.formatting()
     augroup END
     ]])

