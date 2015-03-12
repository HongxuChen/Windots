" vim: set ft=vim ts=4 sw=2 tw=78 et :
"
if has("gui_running")
  au GUIEnter * simalt ~x
endif

" visual-star-search, makes * and # work on visual mode too.
function! s:VSetSearch(cmdtype)
  let temp = @s
  norm! gv"sy
  let @/ = '\V' . substitute(escape(@s, a:cmdtype.'\'), '\n', '\\n', 'g')
  let @s = temp
endfunction
xnoremap * :<C-u>call <SID>VSetSearch('/')<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch('?')<CR>?<C-R>=@/<CR><CR>

" display pwd
nnoremap <leader>s :echo expand('%:p')<CR>
" open help:info in new tab
cabbrev hh tab help
" remap j,k
nnoremap j gj
nnoremap k gk
nnoremap gj j
noremap gk k
" history scrolls in Ex mode
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" emacs like settings(non-insert mode)
nnoremap <silent><C-x>0 :hide<CR>
nnoremap <silent><C-x>1 :hide :only<CR>
nnoremap <silent><C-x>k :bd<CR>
nnoremap <silent><C-x><C-s> :w<CR>:exe ":echo 'saved' bufname(\"%\")"<CR>
nnoremap <silent><C-x>s :wall<CR>:exe ":echo 'saved all buffers'"<CR>
nnoremap <silent><C-x>i :read<Space>
nnoremap <silent><C-x><C-w> :write<Space>
nnoremap <silent><C-x><C-q> :set invreadonly<CR>
nnoremap <silent><C-x><C-c> :wqall<CR>
nnoremap <silent><C-x><C-j> :e.<CR>
cnoremap <silent><C-g> <ESC><ESC>

" general settings
syntax on                     " syntax highlighing
filetype on                   " try to detect filetypes
filetype plugin on            " recognize filetype
filetype plugin indent on     " enable loading indent file for filetype
set grepprg=grep\ -nH\ $*     "grep always displays filename
set splitright                "
set guioptions=               " simpler
set nrformats=                " treat all numberals as decimal
set tabpagemax=5              " only 5 tabs
set gdefault                  " substitute globally
set nocompatible              " Don't be compatible with vi
set tabpagemax=15             " max number of tabs
set number                    " Display line numbers
set numberwidth=1             " using only 1 column (and 1 space) while possible
set background=dark           " We are using dark background in vim
set title                     " show title in console title bar
set wildmenu                  " Menu completion in command mode on <Tab>
set wildmode=list:longest     " list and match longest
set wildmode=longest:full,list:full
set nocursorline              " have a line indicate the cursor location
set nostartofline             " Avoid moving cursor to BOL when jumping around
set virtualedit=block         " Let cursor move past the last char in <C-v> mode
set iskeyword+=$,@,%,#,-      " don't allow to be separated by line break
set foldmethod=manual         " TODO
set hidden                    " set buffer hidden
set whichwrap=b,s,h,l,<,>,[,]
set winaltkeys=no             " do not use ALT as menu trigger
set sel=exclusive
set scrolloff=5               " Keep 5 context lines above and below the cursor
set backspace=2               " Allow backspacing over autoindent, EOL, and BOL
set showmatch                 " Briefly jump to a paren once it's balanced
set wrap                      " wrap text
set linebreak                 " don't wrap textin the middle of a word
set autoindent                " always set autoindenting on
set smartindent               " use smart indent if there is no indent file
set tabstop=4                 " <tab> inserts 4 spaces
set shiftwidth=4              " but an indent level is 2 spaces wide.
set softtabstop=4             " <BS> over an autoindent deletes both spaces.
set expandtab                 " Use spaces, not tabs, for autoindent/tab key.
set shiftround                " rounds indent to a multiple of shiftwidth
set matchpairs+=<:>           " show matching <> (html mainly) as well
set foldmethod=syntax         " allow us to fold on indents
set foldlevel=99              " don't fold by default
set history=200               " up/down can also be used when some words have been inserted
set modeline                  " Allow vim options to be embedded in files;
set modelines=5               " they must be within the first or last 5 lines.
set ffs=unix,dos,mac          " Try recognizing dos, unix, and mac line endings.
set vb t_vb=                  " Disable all bells
set noerrorbells
set showcmd                   " Show incomplete normal mode commands as I type.
set report=0                  " commands always print changed line count.
set shortmess=atI            " Use [+]/[RO]/[w] for modified/readonly/written.
set listchars=tab:>-,eol:$,trail:-,precedes:<,extends:> " when list needed
set lcs=tab:>\ ,trail:_,precedes:<,extends:\
set cmdheight=1
" encoding, check with http://www.cl.cam.ac.uk/~mgk25/ucs/examples/UTF-8-demo.txt
set fileencodings=utf-8,ucs-bom,gbk,cp936,gb18030
set fileencoding=utf-8
" set termencoding=utf-8
" set encoding=utf-8
" searching and Patterns
set ignorecase                " Default to using case insensitive searches,
set smartcase                 " unless uppercase letters are used in the regex.
set smarttab                  " Handle tabs more intelligently
set hlsearch                  " Highlight searches by default.
set incsearch                 " Incrementally search while typing a /regex
" completions
set pumheight=8               " maximum items of popup window
"" ignore these files when completing
set wildignore+=*/tmp/*,*.swp,*.zip
set wildignore+=.git
set wildignore+=eggs/**,*.egg-info/**,*.pyc,*.pyo,*pyd
set wildignore+=*.class,*.jar
set wildignore+=*.aux,*.toc,*.out
set wildignore+=*.bak,*.exe,*.chm,*.png,*.jpg,*.jpeg,*.gif,*.avi,*.rm,*.rmvb
set completeopt=longest,menuone
set t_Co=256

autocmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd BufRead,BufNewFile /usr/include/* set ft=cpp
autocmd BufRead,BufNewFile *.ipynb setfiletype javascript

" VUNDLE rtp, @see https://github.com/gmarik/vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

"vim-g
Bundle 'szw/vim-g'
let g:vim_g_f_command = "Gf"
let g:vim_g_command = "Go"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" save and reload ~/.vimrc
nnoremap <silent> <leader>v :w<CR>:source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>
set clipboard=unnamed "Use system clipboard ("*)
nnoremap <leader>p :set paste! <CR>
" Remove trailing whitespace
nnoremap <leader>f :%s/\s\+$//<cr>:let @/=''<CR>
" C-j to insert a newline
nnoremap <NL> i<CR><ESC>
" q for next buffer
nnoremap q :bN<CR>
" remap D to remove line without x register, anyway I have cc
nnoremap D "_dd
vnoremap D "_d
" refresh if file in Vim is updated by external program,TODO
noremap <silent><F5> :checktime<CR>:exe ":echo 'file refreshed'"<CR>
inoremap <silent><F5> <C-O>:checktime<CR>:exe ":echo 'file refreshed'"<CR>
" substitute word under cursor with ...
nnoremap <Leader>S :%s/\<<C-r><C-w>\>/

autocmd FileType c,cpp,java,markdown autocmd BufWritePre <buffer> :%s/\s\+$//e
nnoremap gO :!open <cfile><CR>

" emacs like settings(insert mode)
inoremap <silent><C-x>0 <C-o>:hide<CR>
inoremap <silent><C-x>1 <C-o>:hide :only<CR>
inoremap <silent><C-x>k <C-o>:bd<CR>
inoremap <silent><C-x><C-s> <C-o>:w<CR><C-o>:exe ":echo 'saved' bufname(\"%\")"<CR>
inoremap <silent><C-x>s <C-o>:wall<CR>
inoremap <silent><C-x>i <C-o>:read<Space>
inoremap <silent><C-x><C-w> <C-o>:write<Space>
inoremap <silent><C-x><C-q> <C-o>:set invreadonly<CR>
inoremap <silent><C-x><C-c> <C-o>:wqall<CR>
inoremap <silent><C-x><C-J> <C-o>:e.<CR>
inoremap <silent><C-e> <C-o>$
inoremap <silent><C-a> <C-o>0
inoremap <silent><C-f> <Right>
inoremap <silent><C-b> <Left>
inoremap <silent><C-d> <Del>
inoremap <silent><M-n> <C-o>:cnext<CR>
inoremap <silent><M-p> <C-o>:cprevious<CR>

set ttyfast
set colorcolumn=120
set autochdir
set formatoptions=tq
set noautowrite               " Never write a file unless I request it.
set noautowriteall            " NEVER.
set autoread                  " automatically re-read changed files.
set confirm                   " Y-N-C prompt if closing with unsaved changes.
set laststatus=2              " Always show statusline, even if only 1 window.
" set statusline=[%n]\ %<%.99f\ %h%w%m%r%y%=%-16(\ %l,%c-%v\ %)%P
" set statusline+=%#warningmsg#%{SyntasticStatuslineFlag()}%*

runtime macros/matchit.vim
" additional plugins
Bundle 'jiangmiao/auto-pairs'

Bundle 'bling/vim-airline'
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#left_alt_sep = '|'

Bundle 'tomasr/molokai'
colorscheme molokai

Bundle 'tpope/vim-commentary'
autocmd FileType gdb setl cms=#%s
autocmd FileType c setl cms=//%s
autocmd FileType cpp setl cms=//%s

" tagbar
Bundle 'Tagbar'
noremap <leader>t :TagbarToggle<CR>
let g:tagbar_autoclose=0
let g:tagbar_left = 0
let g:tagbar_width = 31
let g:tagbar_autofocus = 0
let g:tagbar_sort = 1
let g:tagbar_compact = 1
let g:tagbar_expand = 0
let g:tagbar_singleclick = 0
let g:tagbar_foldlevel = 5
let g:tagbar_autoshowtag = 0
let g:tagbar_updateonsave_maxlines = 10000
let g:tagbar_systemenc = 'encoding'

" nerdtree
Bundle 'scrooloose/nerdtree'
noremap <leader>T :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$']
let g:NERDTreeDirArrows=0

" append modeline
function! AppendModeline()
  let l:modeline = printf(" vim: set ft=%s ts=%d sw=%d tw=%d %set :",
        \ &filetype, &tabstop, &shiftwidth, &textwidth, &expandtab ? '' : 'no')
  let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
  call append(line("0"), l:modeline)
endfunction
nnoremap <silent> <Leader>ml :call AppendModeline()<CR>
