syntax on
filetype on
filetype plugin on

highlight WhiteSpaceError ctermbg=red guibg=red
match WhiteSpaceError /^\zs \+\|\t\+\zs \+\| \+\ze\t\|\zs\s\+$/
autocmd ColorScheme * highlight WhiteSpaceError ctermbg=red guibg=red

set background=dark
set backspace=eol,indent,start
" set cursorline
set encoding=utf-8
set grepprg=ack-grep
set hidden
set incsearch
set laststatus=2
set nobackup
set nocompatible
set nohls
set notitle
set nowrap
set showmatch
set showcmd
set showmode
set smartcase
set ttyfast
" set visualbell
set wildmenu
set wildmode=list:longest
set number
" Format the statusline
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h%=\ \ \ Line:\ %l/%L:%c\ (%p%%)
colorscheme default

" Helper Function for getting the current directory
function! CurDir()
  let curdir = substitute(getcwd(), $HOME, "~", "g")
  return curdir
endfunction

" Helper Function for determining if we are in 'PASTE MODE'
function! HasPaste()
  if &paste
    return 'PASTE MODE  '
  else
    return ''
  endif
endfunction

" Update highlighting rules
set list
set listchars=tab:o-,extends:>,precedes:<
hi SpecialKey guifg=red ctermfg=red
hi ExtraSpace ctermbg=red guibg=red
au BufRead,BufNew,BufNewFile *.{apl,css,erb,htm,html,js,my,pm,pl,py,rb,sh,sql,snip,xml} syn match ExtraSpace /^\zs \+\|\t\+\zs \+\| \+\ze\t\|\zs\s\+$/

" The following two options will save the fold-state
" au BufWinLeave * silent! mkview
" au BufWinEnter * silent! loadview

  inoremap  <Up>     <NOP>
  inoremap  <Down>   <NOP>
  inoremap  <Left>   <NOP>
  inoremap  <Right>  <NOP>
  noremap   <Up>     <NOP>
  noremap   <Down>   <NOP>
  noremap   <Left>   <NOP>
  noremap   <Right>  <NOP>

" Turn on auto indenting
set autoindent
set shiftwidth=5
set tabstop=5

" turn on folding
 set foldenable

" define auto folding rule
set foldmethod=syntax

" show a column indicating where folds are
set foldcolumn=2

" initial fold level
 set foldlevelstart=99

" enable file type specific folding
autocmd BufRead,BufNewFile *.js let javaScript_fold=1
autocmd BufRead,BufNewFile *.rb let ruby_fold=1

" make the write and quit commands case insensitive
:command W w
:command Q q

" remap jj in insert mode to exit insert mode
inoremap jj <Esc>

" use space to open folds in normal mode 
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

" always show at least 5 lines above and below current line
set scrolloff=5

filetype indent off
