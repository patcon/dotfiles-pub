" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" THEMING
syntax enable
colorscheme desert

" GENERAL

" Remember more commands and search history
set history=1000

" Make tab completion for files/buffers act like bash
set wildmenu

" Make searches case-sensitive only if they contain upper-case characters
set ignorecase
set smartcase

" Store temporary files in a central spot
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
filetype plugin on
filetype indent on

set number

" MAPPINGS
map ,t :CommandT<cr>
map ,cfa :ChefFindAny<cr>

" COMMANDS
command Wsudo :w !sudo tee %

" VIM FUNCTION

function! InlineVariable()
  normal 2daw
  normal dd
  normal k$
  exec '/\<' . @a . '\>'
  exec ':.s/\<' . @a . '\>/' . @b
endfunction
map ,civ :call InlineVariable()<cr>

" Custom setting for documentation files
"au BufNewFile,BufRead *.md, call DoDocsCommands()

function DoDocsCommands()
  set tw=80
  set wrap
endfunction
