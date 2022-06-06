lua << EOF
require('init')
EOF

" Setting for jump placeholders in snippets
imap <expr> <C-s> vsnip#expandable() ? '<Plug>(vsnip-expand)' : '<C-s>'
imap <expr> <C-j> vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<C-j>'
smap <expr> <C-s> vsnip#expandable() ? '<Plug>(vsnip-expand)' : '<C-s>'
smap <expr> <C-j> vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<C-j>'

  let g:vsnip_snippet_dir = expand('~/.config/nvim/snippets')
  "save after exiting insert mode (InsertLeave event), after text change
"(TextChanged event) or after Vim losing focus (FocusLost event)
augroup AUTOSAVE
 au!
 autocmd InsertLeave,TextChanged,FocusLost * silent! update
augroup END
