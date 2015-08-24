set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

" #autocmd FileType python set omnifunc=pythoncomplete#Complete

if has("python")

python import sys, os

python sys.path.append('C:/Users/sanjivj/Documents/Desktop/MyGnuDjangoProjects')

python os.environ['DJANGO_SETTINGS_MODULE'] = '/lucid/settings'

endif


map T :TaskList<CR>
map P :TlistToggle<CR>
map N :NERDTree<CR>
map U :GundoToggle<CR>  

" The following are shortcut keys for Fugitive commands:
map gw :Gwrite<CR>
map gs :Gstatus<CR>
map gb :Gblame<CR>
map gc :Gcommit<CR>

let g:airline#extensions#tabline#enabled = 1

set guifont=Lucida_Console:h12
set nobackup
set noswapfile
set expandtab
set textwidth=79
set tabstop=8
set softtabstop=4
set shiftwidth=4
set autoindent
:syntax on

filetype plugin on

let mapleader=","
set timeoutlen=1500

:abbr hte the
:abbr accross across
:abbr Lunix Linux
:abbr consloe console
colorscheme darkblue
set laststatus=2
call pathogen#infect()
