set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin('~/.VundlePlugins')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
"if (match(system("uname -s"), "Darwin") == -1)
    "Plugin 'valloric/youcompleteme'
"endif
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'scrooloose/nerdcommenter'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'MarcWeber/vim-addon-mw-utils'       " required for snipmate
Plugin 'tomtom/tlib_vim'                    " required for snipmate
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'                 " required for snipmate
Plugin 'vim-ruby/vim-ruby'

call vundle#end()            " required
filetype plugin indent on    " required

syntax on
filetype plugin indent on
set number
set autoindent smartindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set nowrap

" don't show these files
set wildignore=.svn,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*~,*.*~
set wildignore+=*.rbc,*.rbo,*.gem,._*,*.beam
set wildignore+=*/deps/*
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*

if exists('+colorcolumn')
    set colorcolumn=91
    call matchadd('ColorColumn', '\%91v', 100)
    "hi ColorColumn ctermbg=160 ctermfg=160
endif

"Show whitespaces
set list

" Get rid of whitespace
nnoremap <leader>W :%s/\v\s+$//g<cr>:let @/=''<cr>

" Different moving around
nnoremap <leader>end $
nnoremap <leader>st ^

" Leave insert mode with jj
inoremap jj <ESC>

" No bells
set noerrorbells

" Hex editing
:map <leader>hon :%!xxd<cr>
:map <leader>hoff :%!xxd -r<cr>

" Sudo when you forgot to sudo vim file
cmap w!! %!sudo tee > /dev/null %

nmap <leader>hs :set hlsearch! hlsearch?<cr>

"Colorscheme
colorscheme default

"Indent guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
let g:indent_guides_auto_colors = 0
hi IndentGuidesOdd  ctermbg=236
hi IndentGuidesEven ctermbg=233

"let g:NERDTreeDirArrows=0

"Status Line Stuff
hi StatusLine ctermbg=250 ctermfg=236
" Highlight status bar if in insert mode
au InsertEnter * hi StatusLine ctermbg=236 ctermfg=34
au InsertLeave * hi StatusLine ctermbg=250 ctermfg=236
set laststatus=2
set statusline=
"#set statusline+=%1*
set statusline+=%f
set statusline+=%y
set statusline+=\[%{FileSize()}]
set statusline+=%{exists('g:loaded_fugitive')?fugitive#statusline():''}
set statusline+=[Modified:%{strftime(\"\%c\",getftime(expand(\"\%\%\")))}]
set statusline+=%=
set statusline+=[%c,
set statusline+=%l/%L
set statusline+=\ %P]
function! FileSize()
    let bytes = getfsize(expand("%:p"))
    if bytes <= 0
        return ""
    endif
    if bytes < 1024
        return bytes . "B"
    else
        return (bytes/1024) . "KB"
    endif
endfunction

function! NumberToggle()
    if (&relativenumber == 1)
        set norelativenumber
    else
        set relativenumber
    endif
endfunc
nnoremap <C-n> :call NumberToggle()<cr>

" Metasploit specific
au! BufRead,BufNewFile */metasploit-*/*.rb setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab shiftround smarttab

" Custom keybindings
nmap <leader>n :NERDTreeToggle<CR>

" Make NERDTree ignore compiled files
let NERDTreeIgnore=['\.pyc$', '\.pyo$', '\.rbc$', '\.rbo$', '\.class$', '\.o$', '\~$']
