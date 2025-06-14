" Ryan's .vimrc
"
"
" 1. General settings
" 2. Plugins
" 3. Plugins settings
" 4. Scheme and colors
" 5. Mapping

" vim-plug Installation
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

" auto reload vimrc when editing it
autocmd! bufwritepost .vimrc source ~/.vimrc


" -----------------------------------------------------------------------------
" 1. General settings (begin)
" -----------------------------------------------------------------------------


set number         " Show current line number
set relativenumber " Show relative line numbers
set ruler
set autoindent
set autoread
set hlsearch
set nobackup       " No *.~ backup files
set noundofile     " No *.un~ undo files
set expandtab
set tabstop=4
set shiftwidth=4
set mouse=a
set encoding=utf-8
set noshowmode
set updatetime=100
set cursorline
" set signcolumn=yes
syntax on


" -----------------------------------------------------------------------------
" 1. General settings (end)
" -----------------------------------------------------------------------------


" -----------------------------------------------------------------------------
" 2. Plugins (begin)
" -----------------------------------------------------------------------------


call plug#begin()

Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'
Plug 'jiangmiao/auto-pairs'

" colorscheme
Plug 'sainnhe/sonokai'
" Plug 'tomasiser/vim-code-dark'

call plug#end()


" -----------------------------------------------------------------------------
" 2. Plugins (end)
" -----------------------------------------------------------------------------


" -----------------------------------------------------------------------------
" 3. Plugins settings ( start )
" -----------------------------------------------------------------------------


" Start NERDTree and put the cursor back in the other window.
" autocmd VimEnter * NERDTree | wincmd p

" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
            \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" Specify which files the NERDTree should ignore. 
let NERDTreeIgnore=['\.pyc$', '__pycache__']

" This setting disables the 'Bookmarks' label 'Press ? for help' text.
let NERDTreeMinimalUI = 1

let NERDTreeWinSize = 25

" Automatically displays all buffers when there's only one tab open.
let g:airline#extensions#tabline#enabled = 1

" Integrating with powerline fonts
let g:airline_powerline_fonts = 1

let g:ycm_disable_signature_help = 1

" Github issue from https://github.com/ryanoasis/vim-devicons/issues/266
set t_RV=

" -----------------------------------------------------------------------------
" 3. Plugins settings ( end )
" -----------------------------------------------------------------------------


" -----------------------------------------------------------------------------
" 4. Scheme and colors ( start )
" -----------------------------------------------------------------------------

" Important!!
if has('termguicolors')
  set termguicolors
endif

set background=dark

let g:airline_theme = 'sonokai'
let g:sonokai_transparent_background = 1
let g:sonokai_style = 'atlantis'

colorscheme sonokai
" hi Normal ctermbg=none

" -----------------------------------------------------------------------------
" 4. Scheme and colors ( end )
" -----------------------------------------------------------------------------


" -----------------------------------------------------------------------------
" 5. Mapping ( start )
" -----------------------------------------------------------------------------


nnoremap <SPACE> <Nop>
let mapleader = " "

" NERDTree hotkey
nnoremap <silent> <leader>e :NERDTreeToggle<CR>

inoremap jk <Esc>

" buffers
nnoremap H <CMD>bp<CR>
nnoremap L <CMD>bn<CR>

" Move to window using the <ctrl> hjkl keys
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Clear search with <esc>
nnoremap <Esc> <CMD>noh<CR><Esc>

" Save file
nnoremap <C-s> <CMD>w<CR><Esc>
nnoremap ;; <CMD>w<CR><Esc>


" -----------------------------------------------------------------------------
" 5. Mapping ( end )
" -----------------------------------------------------------------------------
