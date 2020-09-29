"        _
" __   _(_)_ __ ___  _ __ ___
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
"   \_/ |_|_| |_| |_|_|  \___|
"

call plug#begin('~/.vim/plugged')
    "Plug 'ayu-theme/ayu-vim'
    Plug 'arcticicestudio/nord-vim', { 'branch': 'develop' }
    Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
    Plug 'preservim/nerdcommenter'
    Plug 'mhinz/vim-startify'
    Plug 'leafgarland/typescript-vim'
    Plug 'maxmellon/vim-jsx-pretty'
    Plug 'rust-lang/rust.vim'
    Plug 'tweekmonster/gofmt.vim'
    Plug 'vim-syntastic/syntastic'
    if (has("nvim"))
        Plug 'neoclide/coc.nvim', {'branch': 'release'}
        Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
        Plug 'junegunn/fzf.vim'
        Plug 'airblade/vim-rooter'
        Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
    endif
call plug#end()

" coc-prettier
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

" rust-fmt
let g:rustfmt_autosave = 1

if (has("nvim"))
    "if not in git repo
    map <S-b> :w<CR>:Files<CR>
    map <C-b> :w<CR>:GFiles<CR>
endif

imap <C-f> <Esc>:%s//g<Left><Left>
map <Space> <Leader>
vmap <C-c> <plug>NERDCommenterToggle
nmap <C-c> <plug>NERDCommenterToggle
nmap <silent> gd <Plug>(coc-definition)
nnoremap  <F2> :CocSearch <C-R>=expand("<cword>")<CR><CR>
nnoremap <Leader>r :Rg<CR>
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/
nmap <C-m> <Plug>MarkdownPreviewToggle
" No arrow keys --- force yourself to use the home row
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
vnoremap <up> <nop>
vnoremap <down> <nop>
vnoremap <left> <nop>
vnoremap <right> <nop>

syntax on
let ayucolor="dark"
"colorscheme ayu
colorscheme nord

hi Normal guibg=NONE ctermbg=NONE " transparent bg

" FZF CONFIGURATION
if(has("nvim"))
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp' } }

let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'
let $FZF_DEFAULT_COMMAND="rg --files --hidden"

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
endif


if (has("nvim"))
    set nohlsearch
endif

set shell=/usr/bin/zsh
set noshowmatch
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set autoindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undo-dir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set noshowmode
set path+=**
set wildmenu
set wildignore+=**/node_modules/**
set hidden

filetype plugin indent on

let g:vim_jsx_pretty_colorful_config = 1 

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
 if (has("termguicolors"))
    set termguicolors
  endif
endif
