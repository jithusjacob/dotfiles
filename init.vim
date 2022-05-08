lua << EOF
require('init')
EOF

" Setting for jump placeholders in snippets
imap <expr> <C-s> vsnip#expandable() ? '<Plug>(vsnip-expand)' : '<C-s>'
imap <expr> <C-j> vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<C-j>'
smap <expr> <C-s> vsnip#expandable() ? '<Plug>(vsnip-expand)' : '<C-s>'
smap <expr> <C-j> vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<C-j>'
" Using Lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

  let g:vsnip_snippet_dir = expand('~/.config/nvim/snippets')
  "save after exiting insert mode (InsertLeave event), after text change
"(TextChanged event) or after Vim losing focus (FocusLost event)
augroup AUTOSAVE
 au!
 autocmd InsertLeave,TextChanged,FocusLost * silent! update
augroup END
