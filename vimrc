set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtimeath to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle, required
Bundle 'gmarik/vundle'

" Plugins, managed with vundle
" Run `:BundleInstall` to install or update
Bundle 'tpope/vim-sensible'
Bundle 'plasticboy/vim-markdown'
Bundle 'mustache/vim-mustache-handlebars'
Bundle 'kchmck/vim-coffee-script'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-endwise'
Bundle 'thoughtbot/vim-rspec'
Bundle 'scrooloose/syntastic'
Bundle 'jeetsukumaran/vim-buffergator'
Bundle 'itchyny/lightline.vim'
Bundle 'rking/ag.vim'

Bundle 'kien/ctrlp.vim'

Bundle 'kana/vim-textobj-user'
Bundle 'nelstrom/vim-textobj-rubyblock'

" Colorschemes
Bundle 'chriskempson/base16-vim'
Bundle 'altercation/vim-colors-solarized'

source ~/.vim/config/ctrlp.vim

set noswapfile

runtime macros/matchit.vim

let mapleader=" "

syntax on
filetype plugin indent on

colorscheme base16-default
set background=dark
highlight LineNr ctermbg=none
highlight CursorLineNr ctermbg=none ctermfg=yellow

" Fast editing of .vimrc file
nnoremap <Leader>v :e ~/.vimrc<CR>
autocmd! bufwritepost .vimrc source %

" Automatic reloading of Slate configuration
autocmd! bufwritepost .slate !killall "Slate" && open -a Slate

" Check spelling when writing plain text
autocmd BufNewFile,BufRead *.md setlocal spell
autocmd BufNewFile,BufRead *.md setlocal textwidth=80
autocmd BufNewFile,BufRead *.mkd setlocal spell
autocmd BufNewFile,BufRead *.mkd setlocal textwidth=80
autocmd BufNewFile,BufRead *.txt setlocal spell
autocmd BufNewFile,BufRead *.txt setlocal textwidth=80
autocmd BufNewFile,BufRead *.yml setlocal spell
set complete+=kspell

" Fast editing of ~/tools.md file
nnoremap <Leader>t :e ~/tools.md<CR>

" Fast movement within a file
set relativenumber
set number

" Use 2 spaces as a tab
set expandtab
set tabstop=2
set shiftwidth=2

" Quickly open/save/close buffers
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>x :x<CR>
nnoremap <Leader>d :bd<CR>
nnoremap <Leader>j :bn<CR>
nnoremap <Leader>k :bp<CR>

cnoremap %% <C-R>=expand('%:h').'/'<CR>
nmap <Leader>e :edit %%

" Better searching
set ignorecase
set smartcase

" Open split windows
set splitbelow
set splitright
noremap <C-Down> :sp<CR>
noremap <C-Up> :sp<CR><C-W><C-K>
noremap <C-Right> :vsp<CR>
noremap <C-Left> :vsp<CR><C-W><C-H>

" Navigate split windows
noremap <C-J> <C-W><C-J>
noremap <C-K> <C-W><C-K>
noremap <C-L> <C-W><C-L>
noremap <C-H> <C-W><C-H>

" Allow buffers to be backgrounded
" even if they have unsaved changes
set hidden

" RSpec.vim mappings
let g:rspec_command = "w \| !clear && bundle exec rspec -- {spec}"
nnoremap <Leader>sf :call RunCurrentSpecFile()<CR>
nnoremap <Leader>ss :call RunNearestSpec()<CR>
nnoremap <Leader>sl :call RunLastSpec()<CR>
nnoremap <Leader>sa :call RunAllSpecs()<CR>
nnoremap <Leader>sr :w<CR> \| :!bundle exec rake<CR>

" Run C++ files
nnoremap <Leader>m :w \| :!g++ --std=c++11 % && ./a.out<CR>

" Open files
nnoremap <Leader>o :!open "%"<CR>

nnoremap <Leader><Leader> <C-^>

" use capital U for 'redo' (ctrl-r)
nnoremap U <C-r>

" Mark long lines
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

" Display extra whitespace
set list listchars=tab:»·,trail:·

" Quickly toggle paste mode
nnoremap <Leader>p :set invpaste paste?<CR>

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" fuGITive shortcuts
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>gw :Gcommit -m "WIP"<CR>
nnoremap <Leader>ga :Git add .<CR>
nnoremap <Leader>gr :Git rebase -i master<CR>
