runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

syntax on
filetype on
filetype plugin on

set background=dark
set backspace=eol,indent,start
set encoding=utf-8
set grepprg=ack-grep
set textwidth=80
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

set wildmenu
set wildmode=list:longest
set history=5000


" Format the statusline
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h%=\ \ \ Line:\ %l/%L:%c\ (%p%%)
colorscheme delek

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

function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction

set list
set listchars=tab:o-,extends:>,precedes:<

" Update highlighting rules
hi SyntasticErrorLine guifg=white guibg=red
hi SpecialKey guifg=red ctermfg=red
hi WhiteSpaceError ctermbg=red guibg=red
match WhiteSpaceError /^\s\+$\|\S\+\zs\s\+$/
hi clear SignColumn
hi clear FoldColumn


" The following two options will save the fold-state
" au BufWinLeave * silent! mkview
" au BufWinEnter * silent! loadview

" Disable arrow keys in insert and normal mode
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
set shiftwidth=2
set tabstop=2
set expandtab

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

" enable spell check for markdown and git commits
autocmd FileType gitcommit setlocal spell spelllang=en_us
autocmd FileType markdown setlocal spell spelllang=en_us

" use custom file for additions to the dictionary
set spellfile=$HOME/.vim/.vim-spell-en.utf-8.add

" disable syntax highlighting for buffers over 42.5kb
autocmd BufWinEnter * if line2byte(line("$") + 1) > 42500 | syntax clear | endif

" make the write and quit commands case insensitive
:command W w
:command Q q
:command Wq wq
:command WQ wq

" remap jj in insert mode to exit insert mode
inoremap ;; <Esc>

" use space to open folds in normal mode
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

" always show at least 5 lines above and below current line
set scrolloff=5
set sidescrolloff=5

filetype indent off

" Plugin keybindings
nmap <leader>xt :TagbarToggle<CR>
nmap <leader>xo :CtrlP<CR>

" vim-fugitive plugin keybindings
nmap <leader>gb :Gblame<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gd :Gdiff<CR>
nmap <leader>gg :Ggrep
nmap <leader>gl :Glog<CR>
nmap <leader>gr :Gread<CR>
nmap <leader>gs :Gstatus<CR>

" prevent vim-json from hiding double quotes
let g:vim_json_syntax_conceal = 0

" mlessnau_block_shift keybindings
vmap <C-k> :call BlockShiftUp()<CR>
vmap <C-j> :call BlockShiftDown()<CR>

" prevent markdown from automatically folding
let g:vim_markdown_initial_foldlevel=25

" Should replace TestKey, but for now just hardcode rspec and minitest to spin
let g:TestKey = { 'runners': {} }


" Allow unusual strings after ``` in markdown syntax
autocmd FileType mkd syn region mkdCode start=/^\s*```.*$/ end=/^\s*```\s*$/
