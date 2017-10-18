syntax on
set nocp
set autoindent
set si
set ignorecase
set background=dark
set backspace=2
set helplang=tw
set hlsearch
set incsearch
set laststatus=2
set ruler
set showcmd
set smartindent
set nu
set pastetoggle
set completeopt=longest,menu
" set cursorline cursorcolumn
"set fdm=syntax
"set fdl=0


filetype plugin on
filetype indent on

" 內建自動補齊 ctrl+x crtl+i
"autocmd FileType python set omnifunc=pythoncomplete#Complete
"autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
"autocmd FileType css set omnifunc=csscomplete#CompleteCSS
"autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
"autocmd FileType php set omnifunc=phpcomplete#CompletePHP
"autocmd FileType c set omnifunc=ccomplete#Complete

" 讓autocomplpop可以從include進來的檔案讀取函式
let g:acp_completeOption = '.,w,b,u,t,i,k'
" 整合snipMate
let g:acp_behaviorSnipmateLength = 1
let g:acp_behaviorPerlOmniLength = 0
let g:acp_behaviorKeywordLength = 3

"Omni menu colors
hi Pmenu ctermfg=6 ctermbg=4
hi PmenuSel ctermfg=0 ctermbg=3
" Matched brackets
"hi MatchParen ctermfg=7 ctermbg=4

" vim: set ft=vim :
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,big5,euc-jp,gbk,euc-kr,utf-bom,iso8859-1
set termencoding=utf-8




" 自動回到上次位置
if has("autocmd")
    autocmd BufRead *.txt set tw=78
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal g'\"" |
    \ endif
endif

