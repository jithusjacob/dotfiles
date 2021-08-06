
local cmd = vim.cmd
--local indent = 4

cmd 'syntax enable'
cmd 'filetype plugin indent on'
--utils.opt('b', 'expandtab', true)
--utils.opt('b', 'shiftwidth', indent)
--utils.opt('b', 'smartindent', true)
--utils.opt('b', 'tabstop', indent)
--utils.opt('o', 'hidden', true)
--utils.opt('o', 'ignorecase', true)
--utils.opt('o', 'scrolloff', 15 )
--utils.opt('o', 'shiftround', true)
--utils.opt('o', 'smartcase', true)
--utils.opt('o', 'splitbelow', true)
--utils.opt('o', 'splitright', true)
--utils.opt('o', 'wildmode', 'list:longest')
--utils.opt('o', 'textwidth', 80)
vim.o.textwidth = 80
vim.o.scrolloff = 15 
vim.wo.cursorline = true
vim.wo.relativenumber = true
vim.wo.colorcolumn = '+1'
vim.wo.number = true

-- Highlight on yank
cmd 'au TextYankPost * lua vim.highlight.on_yank {on_visual = false}'
-- spell check in markdown files
cmd 'au BufRead,BufNewFile *.md setlocal spell spelllang=en_us'
-- change higlight color for spell check
cmd 'au VimEnter * highlight SpellBad ctermfg=160 guifg=#d70000'

-- Auto Save on InsertLeave,TextChanged,FocusLost event
cmd [[
augroup AUTOSAVE
 au!
 autocmd InsertLeave,TextChanged,FocusLost * silent! write
augroup END
]]
