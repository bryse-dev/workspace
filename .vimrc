set nocompatible              " be iMproved, required
filetype off                  " required
set mouse=

" set the runtime path to include Vundle and initialize

" let Vundle manage Vundle, required

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Plugin 'YouCompleteMe'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}
"

" All of your Plugins must be added before the following line
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Put plugins and dictionaries in this dir (also on Windows)
let vimDir = '$HOME/.vim'
let &runtimepath.=','.vimDir

" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
    let myUndoDir = expand(vimDir . '/undodir')
    " Create dirs
    call system('mkdir ' . vimDir)
    call system('mkdir ' . myUndoDir)
    let &undodir = myUndoDir
    set undofile
endif

set nowrap
set shiftwidth=4 softtabstop=4
set bg=light
syntax on
" show matching brackets
autocmd FileType perl set showmatch

" dont use Q for Ex mode
map Q :q

" show line numbers
autocmd FileType perl set number

" check perl code with :make
autocmd FileType perl set makeprg=perl\ -c\ %\ $*
autocmd FileType perl set errorformat=%f:%l:%m
autocmd FileType perl set autowrite

" syntax color complex things like @{${"foo"}}
let perl_extended_vars = 1

nnoremap <A-F1> 1gt
nnoremap <A-F2> 2gt
nnoremap <A-F3> 3gt
nnoremap <A-F4> 4gt
nnoremap <A-F5> 5gt
nnoremap <A-F6> 6gt
nnoremap <A-F7> 7gt
nnoremap <A-F8> 8gt
nnoremap <A-F9> 9gt
nnoremap <A-F0> 10gt

nnoremap <F7> gT
nnoremap <F8> gt

nmap <C-e> :w<cr>:!/home/bryson/git-dev/network_discovery/send_dev_to_wfocus.pl <cr>

let g:SuperTabDefaultCompletionType = "context"

"autocmd BufWritePost * execute '! if ( -d .git || git rev-parse --git-dir > /dev/null 2>&1 ) then git add % ; git commit -m %; endif'
"autocmd BufWritePost * execute '! sh -c "if [ -d .git ] || git rev-parse --git-dir > /dev/null 2>&1 ; then git add % ; git commit -m %; fi"'


" requires vim-python and python-git
function! CommitFile()
python << EOF
import vim, git
curfile = vim.current.buffer.name
if curfile:
    try:
        repo = git.Repo(curfile)
        repo.git.add(curfile)
        repo.git.commit(m='Update')
    except (git.InvalidGitRepositoryError, git.GitCommandError):
        pass
EOF
endfunction
"au BufWritePost * call CommitFile()
