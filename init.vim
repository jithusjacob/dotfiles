" PLUGINS:
call plug#begin('~/AppData/Local/nvim/plugged')
Plug 'jiangmiao/auto-pairs' 
Plug 'overcache/NeoSolarized'
Plug 'junegunn/goyo.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}
Plug 'honza/vim-snippets'
Plug 'dart-lang/dart-vim-plugin'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'vimwiki/vimwiki'
"Plug 'tbabej/taskwiki'
call plug#end()

" MISC SETTINGS:
syntax enable
filetype plugin on
set scrolloff=15
"Set hybrid Line number
set relativenumber
set number
" Make line break at 80 characters
set textwidth=80
"So column at 80 
set colorcolumn=+1
let mapleader=" "
"Easier Split Navigation
"So instead of ctrl-w then j, it’s just ctrl-j
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
"save after exiting insert mode (InsertLeave event), after text change
"(TextChanged event) or after Vim losing focus (FocusLost event)
augroup AUTOSAVE
 au!
 autocmd InsertLeave,TextChanged,FocusLost * silent! write
augroup END
" FINDING FILES:
" shortcut to access init.vim
nmap <leader>i :find C:\Users\jithu\AppData\Local\nvim\init.vim<CR>
"short cut to find files
" shortcut path to notes 
nmap <leader>p :find  
" shortcut path to notes 
nmap <leader>n :find C:\Users\jithu\Documents\notes\**\
" " Search down into subfolders
" " Provides tab-completion for all file-related tasks
set path+=**
" Display all matching files when we tab complete
set wildmenu

" FILE BROWSING:
" " Tweaks for browsing
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
"let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

 
" DEFAULT MARKDOWN:
"for markdown default
" Treat all .md files as markdown
"autocmd BufNewFile,BufRead *.md set filetype=markdown
"set conceallevel=2
"Spell Check for markdown files
autocmd BufRead,BufNewFile *.md setlocal spell spelllang=en_us

" SAVE FOLDS:
augroup remember_folds
    autocmd!
    autocmd BufWinLeave * mkview
    autocmd BufWinEnter * silent! loadview
augroup END

" FLUTTER SETUP:
let g:coc_global_extensions = [
  \ 'coc-flutter',
  \ 'coc-snippets',
  \ 'coc-yaml',
  \ 'coc-explorer',   
  \ 'coc-markdownlint',   
  \]
"For Tab select and expand suggestions and snippets
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
	  let col = col('.') - 1
	    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

let g:dart_format_on_save = 1
let g:dartfmt_options = ['--fix', '--line-length 80']
"Code Action binding
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Coc
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
     execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
     call CocActionAsync('doHover')
  else
     execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" FLutter commands
nnoremap <leader>fe :CocCommand flutter.emulators <CR>
nnoremap <leader>fd :below vnew output:///flutter-dev <CR>
nnoremap <leader>fr :CocCommand flutter.run <CR>
nnoremap <leader>fc :CocCommand <CR>
nnoremap <space>e :CocCommand explorer<CR>

" COLORSCHEME:
" settings for Neo Solarized plugin theme start:
set termguicolors
colorscheme NeoSolarized
set background=dark
" settings for Neo Solarized plugin theme end
"change higlight color for spell check
hi SpellBad ctermfg=160 guifg=#d70000
" Change the color for bold incase of bold character in markdown
hi htmlBold ctermfg=214 guifg=#ff8700
"remove parenthesis highlight
set noshowmatch
" Highlight the line the cursor is on
set cursorline

