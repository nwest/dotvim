"" Basic settings
set nocompatible
if has('mouse')
  set mouse=a
endif

call pathogen#infect()
call pathogen#helptags()

set backup
set backupdir=~/.vim/backups
set directory=~/.vim/tmp

set incsearch
set hlsearch
set ignorecase
set smartcase

set autoindent
set expandtab
set tabstop=8
filetype plugin indent on

syntax on
let g:molokai_original=1
colorscheme molokai

set number
set numberwidth=5
set cursorline
set ruler

set backspace=indent,eol,start
set listchars=tab:>-,trail:.,nbsp:.

set laststatus=2
set statusline=[%n]
set statusline+=\ %<%.99f
set statusline+=\ %h%w%m%r%y
set statusline+=%{exists('g:loaded_fugitive')?fugitive#statusline():''}
set statusline+=%=%-16(\ %l,%c-%v\ %)%P

"" Filetype corrections
if has('autocmd')
  autocmd BufRead,BufNewFile *.ru set filetype=ruby
  autocmd BufRead,BufNewFile *.thrift set filetype=thrift
  autocmd BufRead,BufNewFile *.zsh-theme set filetype=zsh
  autocmd BufRead,BufNewFile jquery.*.js set filetype=javascript syntax=jquery
  autocmd BufRead,BufNewFile *.jquery.js set filetype=javascript syntax=jquery
endif

"" Function definitions
function MapHashrocket()
  imap <C-l> <space>=><space>
endfunction
function MapStructOperator()
  imap <C-l> ->
endfunction

function TwoSpaceIndent()
  set softtabstop=2
  set shiftwidth=2
endfunction
function FourSpaceIndent()
  set softtabstop=4
  set shiftwidth=4
endfunction

function ToggleEighty()
  try
    call matchdelete(g:eighty)
  catch
    let g:eighty = matchadd('Error', '\%>80v.\+')
  endtry
endfunction

function MapCShortcuts()
  map <leader>m :make<cr>
  map <leader>co :copen<cr>
  map <leader>cn :cn<cr>
  map <leader>cp :cp<cr>
  map <leader>cf :cfirst<cr>
  map <leader>cl :clast<cr>
endfunction

"" Mappings
let mapleader=','
cnoremap %% <C-R>=expand('%:h').'/'<cr>

map <leader>l :call ToggleEighty()<cr>
map <leader>/ :set invhlsearch<cr>
map <leader><space> :set list!<cr>

map <leader>h :bp<cr>
map <leader>l :bn<cr>
nnoremap <leader><leader> <c-^>

map <leader>tc :tabnew<cr>
map <leader>tp :tabprev<cr>
map <leader>tn :tabnext<cr>
map <leader>td :tabclose<cr>

map <leader>f :CommandTFlush<cr>\|:CommandT<cr>
map <leader>F :CommandTFlush<cr>\|:CommandT %%<cr>

" Auto commands
if has('autocmd')
  autocmd FileType * call TwoSpaceIndent()
  autocmd FileType java call FourSpaceIndent()
  autocmd FileType php call FourSpaceIndent()
  autocmd FileType python call FourSpaceIndent()

  autocmd FileType c call MapCShortcuts()
  autocmd FileType cpp call MapCShortcuts()
  autocmd FileType objc call MapCShortcuts()

  autocmd FileType ruby call MapHashrocket()
  autocmd FileType eruby call MapHashrocket()
  autocmd FileType haml call MapHashrocket()

  autocmd FileType c call MapStructOperator()
  autocmd FileType cpp call MapStructOperator()
  autocmd FileType objc call MapStructOperator()
endif
call TwoSpaceIndent()
