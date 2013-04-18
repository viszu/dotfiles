" = GENERAL"{{{1
" --------------
" viszu's vimrc - https://github.com/viszu
" Disable vi compatibilty restrictions
set nocompatible
filetype off " required! for Vundle
" - Vundle plugin manager"{{{2

" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" original repos on github:
Bundle 'altercation/vim-colors-solarized'
Bundle 'Lokaltog/vim-powerline'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-eunuch'
Bundle 'dahu/vimple'
Bundle 'Raimondi/vim-buffalo'
Bundle 'Raimondi/delimitMate'
Bundle 'tpope/vim-git'
Bundle 'godlygeek/tabular'
Bundle 'vim-scripts/Gundo'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'mileszs/ack.vim'
Bundle 'airblade/vim-gitgutter'
Bundle 'hynek/vim-python-pep8-indent'
Bundle 'Valloric/YouCompleteMe'
Bundle 'scrooloose/syntastic'
Bundle 'SirVer/ultisnips'
"}}}2
" " - Initialize plugin manager"{{{2
" runtime bundle/pathogen/autoload/pathogen.vim
" call pathogen#infect()
" call pathogen#helptags()
" " }}}2
" Filetype detection:ON, plugin:ON, indent:ON
filetype plugin indent on " required! for Vundle
" Enable syntax highlighting
syntax on
" Enable unicode characters
set encoding=utf-8
" Emulate typical editor navigation
set nostartofline
" Don't insert extra space(after .?!)
set nojoinspaces
" <C-a>, <C-x> fixup
set nrformats-=octal
" When creating a new line, set indentation same as previous line
set autoindent
" - Indentation"{{{2
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
" set smarttab
" set shiftround
"}}}2
" - Folding"{{{2
set foldmethod=marker
" Use custom fold text
set foldtext=CustomFoldText()
" }}}2
" Buffer becomes hidden when it is abandoned
set hidden
" Create new split window below the current one
set splitbelow
" Create vertical split window right of the current one
set splitright
set scrolloff=1
set sidescrolloff=5
set display+=lastline
" For regular expressions turn magic on
set magic
" Enable menu for command-line completion
set wildmenu
set wildmode=longest:full,full
set wildignore=*.fo,*.xml,.svn,.git,.hg,*.pyc,*.o,*.a,*.class,*.obj,*.swp
set completeopt=menuone,preview
" - Display special characters for certain whitespace situations"{{{2
set list
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
  if &termencoding ==# 'utf-8' || &encoding ==# 'utf-8'
    let &listchars = "tab:\u21e5 ,trail:\u2423,extends:\u21c9,precedes:\u21c7,nbsp:\u26ad"
  endif
endif
" }}}2
" Search stuff
set incsearch
" Highlight search results
set hlsearch
" When sourcing this file, do not immediately turn on highlighting
nohlsearch
set ignorecase
set smartcase
set nomodeline
" Lang for spell checker
set spelllang=en,pl
" Number of suggested words for spell checker popup
set spellsuggest=9
" Terminal title
set title
" Always show cursor position in statusline
set ruler
" Print line numbers on the left
set number
" This shows what you are typing as a command
set showcmd
set cmdheight=2
" Show matching brackets
set showmatch
" Always show status line
set laststatus=2
"set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P
" Enable wordwrap
set textwidth=79 wrap linebreak
" Backspace
set backspace=indent,eol,start
set complete-=i
" Timeout for keycodes (such as arrow keys and function keys) is only 10ms
" Timeout for Vim keymaps is a second
" set timeout timeoutlen=1000 ttimeoutlen=10
" Time to wait after ESC (default causes an annoying delay)
set timeoutlen=250
" Mouse support
set mouse=a
" Limit Vim's "hit-enter" messages
set shortmess=atI
set fileformats+=mac
set viminfo^=!
" Look for file changes
set autoread
set autowrite
" - Backup, undo, history"{{{2
" Disable swapfile and backup
set nobackup
set noswapfile
" Enable persistent undo
set undofile
set undodir=~/tmp/vim/undo
if !isdirectory(expand(&undodir))
  call mkdir(expand(&undodir), "p")
endif
" Command-line history
if &history < 1000
  set history=1000
endif
" Netrw stuff
if !exists('g:netrw_list_hide')
  let g:netrw_list_hide = '^\.,\~$,^tags$'
endif

" = MAPPINGS"{{{1
" --------------
" Remap leader
nnoremap <Space> <Nop>
let mapleader = ' '
let maplocalleader = '\\'
" Window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-c> <C-w>c
" Be consistent with bash
" Go to the 1st non blank
inoremap <C-a> <C-o>^
cnoremap <C-a> <Home>
" Go to the end of a line
inoremap <C-e> <C-o>$
cnoremap <C-e> <End>
" Write current buffer
nnoremap <C-s> :update!<CR>
inoremap <C-s> <C-o>:update!<CR>
vnoremap <C-s> <C-c>:update!<CR>
" Write read-only files
cnoremap W! w !sudo tee %
" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv
" Select (charwise) the contents of the current line, excluding indentation
" Great for pasting Python lines into REPLs.
nnoremap vv ^vg_
" Easier linewise reselection
nnoremap <leader>V V`]
" Make Y behave like other capitals
nnoremap Y y$
" Improve up/down movement on wrapped lines
nnoremap j gj
nnoremap k gk
" Toggle spell checking
nnoremap <F3> :setlocal spell! spell?<CR>
" Toggle paste / nopaste
nnoremap <F4> :setlocal paste! paste?<CR>
" Esc
inoremap jk <Esc>
inoremap kj <Esc>
" Center screen on next / prev found
nnoremap N Nzz
nnoremap n nzz
" Switch fast between buffers
" nnoremap <Leader>l :ls<CR>:b<Space>
" Open vimrc
nnoremap <Leader>ev :e $MYVIMRC<CR>
" Source vimrc
nnoremap <Leader>vs :source $MYVIMRC<CR>
" cd to the directory containing the file in the buffer
nnoremap <Leader>cd :lcd %:h<CR>
nnoremap <Leader>e :e **/
" Write all buffers and quit Vim
nnoremap <Leader>wq :wa!<CR>:q<CR>
" Select all text in current buffer
nnoremap <Leader>a ggVG
" Clear search highlights
nnoremap <silent> <Leader>/ :noh<CR>
" Underline text, to create headers
nnoremap <Leader>- yypVr-
nnoremap <Leader>= yypVr=
nnoremap <Leader>` yypVr~
" " Make <C-u> and <C-w> undoable
" inoremap <C-u> <C-g>u<C-u>
" inoremap <C-w> <C-g>u<C-w>
" Disable <f1>'s default help functionality
nnoremap <F1> <Esc>
inoremap <F1> <Esc>

" = ABBREVIATIONS"{{{1
cnoreabbrev H h
cnoreabbrev hg helpg
cnoreabbrev ack Ack
cnoreabbrev ackt Ack --text
cnoreabbrev ackp Ack --python
cnoreabbrev ackv Ack --vim
cnoreabbrev hack AckHelp

" = PLUGINS SETTINGS & MAPPINGS"{{{1
" ----------------------------------
" " - Snipmate"{{{2
" let g:snippets_dir='~/.vim/bundle/snippets/snippets'

" - Ultisnips"{{{2
let g:UltiSnipsExpandTrigger="<c-k>"
let g:UltiSnipsJumpForwardTrigger="<c-k>"
let g:UltiSnipsJumpBackwardTrigger="<c-j>"
" let g:UltiSnipsListSnippets = '<c-s-l>'
" let g:UltiSnipsSnippetDirectories=["UltiSnips"]
" Since this ultisnips fork can also use snipmate snips, prefer ultisnips snips
" let g:always_use_first_snippet = 1

" - Fugitive"{{{2
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gl :Glog<CR>
nnoremap <silent> <leader>gp :Git push<CR>

" - Tabularize"{{{2
nnoremap <Leader>a& :Tabularize /&<CR>
vnoremap <Leader>a& :Tabularize /&<CR>
nnoremap <Leader>a= :Tabularize /=<CR>
vnoremap <Leader>a= :Tabularize /=<CR>
nnoremap <Leader>a: :Tabularize /:<CR>
vnoremap <Leader>a: :Tabularize /:<CR>
nnoremap <Leader>a:: :Tabularize /:\zs<CR>
vnoremap <Leader>a:: :Tabularize /:\zs<CR>
nnoremap <Leader>a, :Tabularize /,<CR>
vnoremap <Leader>a, :Tabularize /,<CR>
nnoremap <Leader>a<Bar> :Tabularize /<Bar><CR>
vnoremap <Leader>a<Bar> :Tabularize /<Bar><CR>

" - NERDTree"{{{2
nnoremap <silent> <C-e> :NERDTreeToggle<CR>
let g:NERDTreeShowBookmarks=1
let g:NERDTreeHijackNetrw=0
let g:NERDTreeMinimalUI=1
let g:NERDTreeChDirMode=0
let g:NERDTreeQuitOnOpen=1

" - CtrlP"{{{2
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\.git$\|\.hg$\|\.svn$',
    \ 'file': '\.exe$\|\.so$\|\.dll$' }
let g:ctrlp_jump_to_buffer = 0
let g:ctrlp_working_path_mode = 0

" - Syntastic"{{{2
nnoremap <silent> <Leader>s :SyntasticCheck<CR>
let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_flake8_args='--ignore=E111,E501,E226'
let g:syntastic_auto_jump=1
let g:syntastic_auto_loc_list=1
let g:syntastic_loc_list_height=5
let g:syntastic_enable_signs=0
let g:syntastic_echo_current_error=0

" " - Flake8"{{{2
" " E111 = indentation is not a multiple of four
" let g:flake8_ignore="E111"

" " - Neocomplcache"{{{2
" let g:neocomplcache_enable_at_startup = 1
" " Use smartcase.
" let g:neocomplcache_enable_smart_case = 1
" " let g:neocomplcache_force_overwrite_completefunc=1
" " <CR>: close popup and save indent.
" inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" " <TAB>: completion.
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"
" " <C-h>, <BS>: close popup and delete backword char.
" inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
" inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"

" " - Neosnippet"{{{2
" " Plugin key-mappings.
" imap <C-k>     <Plug>(neosnippet_expand_or_jump)
" smap <C-k>     <Plug>(neosnippet_expand_or_jump)
" " SuperTab like snippets behavior.
" " imap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
" " smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
" " For snippet_complete marker.
" if has('conceal')
"   set conceallevel=2 concealcursor=i
" endif
" " Tell Neosnippet about the other snippets
" let g:neosnippet#snippets_directory='~/.vim/bundle/snippets/snippets'
" " Disable built-in snippets
" let g:neosnippet#disable_runtime_snippets = {
" \   '_' : 1,
" \ }
" let g:neosnippet#enable_snipmate_compatibility = 1

" - Powerline"{{{2
"let g:Powerline_symbols = 'fancy'
let g:Powerline_stl_path_style = 'filename'
call Pl#Theme#InsertSegment('charcode', 'after', 'filetype')

" - Commentary"{{{2
" autocmd FileType python set commentstring=#\ %s
xmap \ <Plug>Commentary
nmap \ <Plug>Commentary
nmap \\ <Plug>CommentaryLine
nmap \u <Plug>CommentaryUndo

" - Gundo"{{{2
nnoremap <silent> <F2> :GundoToggle<CR>
"}}}2

" Supertab
" au FileType *
"   \ if &omnifunc != '' |
"   \   call SuperTabChain(&omnifunc, "<c-p>") |
"   \   call SuperTabSetDefaultCompletionType("<c-x><c-u>") |
"   \ endif

" Pyflakes
" Error highlight color
"highlight SpellBad term=reverse ctermfg=0 ctermbg=3

" Taglist
"map <Leader>t :TlistToggle<CR>
"let Tlist_Inc_Winwidth=0
"let Tlist_Compact_Format=1

" Rope-vim
"map <Leader>j :RopeGotoDefinition<CR>
"map <Leader>r :RopeRename<CR>

" = AUTOCOMMANDS"{{{1
" -------------------
augroup General
  au!
  " Remove any trailing whitespace that is in the file
  au BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

  " Jumps to the last known position in a file just after opening it
  au BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
      \ exe "normal! g`\"" |
    \ endif

  " When leaving insert mode, set nopaste
  au InsertLeave * set nopaste

  " Turns off error bells
  set noerrorbells visualbell t_vb=
  au GUIEnter * set vb t_vb=

  " Resize splits when the window is resized
  au VimResized * :wincmd =
augroup END

" augroup Plugins
"   au!
"   autocmd BufWritePost *.py call Flake8()
" augroup END

augroup FTCheck
  " filetype.vim
  au!
  au BufNewFile,BufRead *.rss,*.atom set ft=xml
  au BufNewFile,BufRead *.txt,README,HELP,INSTALL,NEWS,TODO if &ft == ""
    \ | set ft=text|endif
augroup END

augroup FTOptions
  " ftplugin
  au!
  " au FileType markdown setlocal sw=4 sts=4
  " au FileType python setlocal fdm=expr
  au FileType c,cpp,cs,java setlocal fdm=syntax cin
  au FileType git,gitcommit setlocal fdm=syntax
  au FileType gitcommit setlocal spell
augroup END

" = FUNCTIONS{{{1
" ---------------
" - Stab"{{{2
" Set tabstop, softtabstop and shiftwidth to the same value + set et / noet
" Inspired by http://vimcasts.org/episodes/tabs-and-spaces/
nnoremap <Leader>tt :call Stab()<CR>
command! -nargs=* Stab call Stab()
fun! Stab()
  let message = '{sw=sts=ts=} {et / noet}: '
  let arglist = split(input(message))
  let len_arglist = len(arglist)
  if len_arglist > 0
    let tabstop = 1 * arglist[0]
    if tabstop > 0
      let &l:sw = tabstop
      let &l:sts = tabstop
      let &l:ts = tabstop
    endif
    if len_arglist > 1
      let expandtab = arglist[1]
      if expandtab =~ '\(no\)\?et'
        execute 'setlocal '.expandtab
      endif
    endif
  endif
  call SummarizeTabs()
endfun

nnoremap <Leader>ti :call SummarizeTabs()<CR>
fun! SummarizeTabs()
  try
    echo "\r"
    echohl ModeMsg
    echon 'sw='.&sw ' sts='.&sts ' ts='.&ts
    if &et
      echon ' et'
    else
      echon ' noet'
    endif
  finally
    echohl None
  endtry
endfun

" - CloseHiddenBuffers"{{{2
" Wipe all buffers which are not active (i.e. not visible in a window/tab)
" Using elements from each of these:
"   http://stackoverflow.com/questions/2974192
"   http://stackoverflow.com/questions/1534835
nnoremap <Leader>ch :call CloseHiddenBuffers()<CR>
command! -nargs=* Only call CloseHiddenBuffers()
fun! CloseHiddenBuffers()
  " figure out which buffers are visible in any tab
  let visible = {}
  for t in range(1, tabpagenr('$'))
    for b in tabpagebuflist(t)
      let visible[b] = 1
    endfor
  endfor
  " close any buffer that are loaded and not visible
  let l:tally = 0
  for b in range(1, bufnr('$'))
    if bufloaded(b) && !has_key(visible, b)
      let l:tally += 1
      exe 'bw ' . b
    endif
  endfor
  echon "Deleted " . l:tally . " buffers"
endfun

" - CustomFoldText{{{2
fun! CustomFoldText()
  "get first non-blank line
  let fs = v:foldstart
  while getline(fs) =~ '^\s*$' | let fs = nextnonblank(fs + 1)
  endwhile
  if fs > v:foldend
      let line = getline(v:foldstart)
  else
      let line = substitute(getline(fs), '\t', repeat(' ', &tabstop), 'g')
  endif

  let w = winwidth(0) - &foldcolumn - (&number ? 8 : 0)
  let foldSize = 1 + v:foldend - v:foldstart
  let foldSizeStr = " " . foldSize . " lines "
  let foldLevelStr = repeat("+--", v:foldlevel)
  let lineCount = line("$")
  let foldPercentage = printf("[%.1f", (foldSize*1.0)/lineCount*100) . "%] "
  let expansionString = repeat(".", w - strwidth(foldSizeStr.line.foldLevelStr.foldPercentage))
  return line . expansionString . foldSizeStr . foldPercentage . foldLevelStr
endfun

" = GUI & COLOR SCHEME"{{{1
" -------------------------
if has('gui_running')
  if has('unix')
    " set guifont=Droid\ Sans\ Mono\ 10.2
    set guifont=Meslo\ LG\ S\ DZ\ 10
  elseif has('gui_win32') || has('gui_win64')
    let g:skip_loading_mswin=1
    set guifont=Droid_Sans_Mono:h10.2
    cd c:\
  endif
  set lines=37 columns=84
  set guioptions-=T
  set guioptions-=m
  set guioptions+=lrb
  set guioptions-=lrb
  set guioptions+=LRB
  set guioptions-=LRB
else
  " Terminal
  set t_Co=256 t_md=
endif

set background=dark
let g:solarized_menu=0
" let g:solarized_termtrans=1
" let g:solarized_termcolors=256
" let g:solarized_contrast="high"
" let g:solarized_visibility="high"
colorscheme solarized
" colorscheme hybrid
" Get rid of the underline and bold in fold text
hi Folded term=none gui=none
" SignColumn will use same bg color as linenumber (GitGutter will set it)
hi clear SignColumn
" hi SignColumn ctermbg=0 guibg=DarkGrey

" = FIXUPS"{{{1
" -------------
" Fix arrow key navigation in insert mode
imap <ESC>oA <ESC>ki
imap <ESC>oB <ESC>ji
imap <ESC>oC <ESC>li
imap <ESC>oD <ESC>hi
