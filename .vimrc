set nocompatible              " be iMproved, required
filetype off                  " required
"set mouse=

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

Plugin 'vim-scripts/indentpython.vim'
Bundle 'Valloric/YouCompleteMe'
Plugin 'vim-syntastic/syntastic'
Plugin 'sheerun/vim-polyglot'
Plugin 'vim-airline/vim-airline'
Plugin 'scrooloose/nerdtree'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" ################ Custom ################
"
" Custom keybindings
map <Space> <Leader>
map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
map <leader>n :NERDTreeToggle<CR>
map <leader>l :set invnumber<CR>

" Custom format
set number
set numberwidth=5
set wrapmargin=5

" Use system clipboard for copy paste (requires 'apt install vim-gtk')
set clipboard=unnamedplus

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" PEP8 python indent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=79
set expandtab
set autoindent
set fileformat=unix

set encoding=utf-8

" Space+g to go to python definition
let g:ycm_autoclose_preview_window_after_completion=1

" Code highlighting and color scheme
let python_highlight_all=1
syntax on
let g:onedark_color_overrides = { "black": {"gui": "#161617", "cterm": "235", "cterm16": "0" }, "gutter_fg_grey": {"gui": "#990000", "cterm": "235", "cterm16": "0" }}
colorscheme onedark
let g:airline_theme='onedark'

" Customize tab line
let g:airline#extensions#tabline#enabled = 1

" Support 24 bit color
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" Nerdtree settings
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
" let NERDTreeShowHidden=1
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
