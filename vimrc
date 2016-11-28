set autoindent " auto-indent

" Set tab indent to be 4 spaces
set smartindent
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" Fix backspace not working
set backspace=indent,eol,start

" Line number
set number

" Use Solarized Dark
set background=dark
colorscheme solarized

set nocompatible " get rid of Vi compatibility mode. SET FIRST.
filetype off

" Open NERDTree automatically
" autocmd vimenter * NERDTree

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}
" Install JavaScript Syntax
Plugin 'jelera/vim-javascript-syntax'
" Nerd tree
Plugin 'scrooloose/nerdtree'

" Ruby Syntax Highlight
Plugin 'vim-ruby/vim-ruby'
" Rails plugin
Plugin 'tpope/vim-rails'
" Endwise for Ruby
Plugin 'tpope/vim-endwise'

" Tagbar
Plugin 'majutsushi/tagbar'
let g:tagbar_ctags_bin='ctags'
let g:tagbar_width=30
map <F3> :Tagbar<CR>

" vim markdown
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

" TOML syntax
Plugin 'cespare/vim-toml'

" Rust syntax highlight
Plugin 'rust-lang/rust.vim'

" Vue Component syntax highlight
Plugin 'posva/vim-vue'

" Interactive command execution in Vim
Plugin 'Shougo/vimproc.vim'

" neocomplete {{{
Plugin 'Shougo/neocomplete'
" neocomplete settins
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#min_keyword_length = 3

" Settings of RSense
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'


" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" }}}

" Go Syntax Highlight {{{
Plugin 'fatih/vim-go'
let g:go_disable_autoinstall = 0
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
" }}}

" CoffeeScript Syntax Highlight {{{
Plugin 'kchmck/vim-coffee-script'

au BufRead,BufNewFile,BufReadPre *.coffee set filetype=coffee
autocmd FileType coffee setlocal sw=2 sts=2 ts=2 et

" }}}

Plugin 'ctrlpvim/ctrlp.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required

syntax enable
filetype plugin indent on    " required

" Settings of gtags
map <C-g> :Gtags
map <C-h> :Gtags -f %<CR>
map <C-j> :GtagsCursor<CR>
map <C-n> :cn<CR>
map <C-b> :cp<CR>
