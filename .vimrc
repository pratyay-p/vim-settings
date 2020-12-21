"   
"   My personal configurations of Vim
"   Install Vundle and vim-plug
"   Install YCM as per  instructions in github
"   Install other plugins by :PlugInstall and :PluginInstall
"
syntax on
set laststatus=2
set relativenumber
set incsearch
set linespace=0
set ignorecase
set smartcase
set nohlsearch
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab
set title
set nobackup
set noswapfile
set sidescroll=0
set splitbelow
set mouse=a
set autoindent
set smartindent
syntax enable
set t_Co=256
set clipboard=unnamedplus
set rtp+=~/.vim/bundle/Vundle.vim
if system('date +%H') < 12
    colorscheme PaperColor
    set background=light
else
    set background=dark
    if &filetype == 'html'
        colorscheme focuspoint
    else
        colorscheme gruvbox
    endif
endif
syntax on
set completeopt-=preview
let g:PaperColor_Theme_Options = {
  \   'theme': {
  \     'default.light': {
  \       'override' : {
  \         'color00' : ['#E4E4E4', '254'],
  \         'linenumber_bg' : ['#E4E4E4', '254']
  \       }
  \     }
  \   }
  \ }
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
nnoremap <silent> <C-b> :Lexplore<CR>
imap <C-y> <Esc> :YcmCompleter GoTo <CR>i
nnoremap <space> <Nop>
map <space> <leader>
imap <space> <leader>
imap <C-d> <Esc>dd<Esc>i
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>
nnoremap <leader>OC gt
nnoremap <leader>OD gT
"github shortcuts - vim-fugitive
nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2<CR>
nmap <leader>gs :G<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gh :Gpush<CR>:q<CR>
nmap <leader>gl :Gpull<CR>
"terminal mappings
map <leader>tv <Esc>:below vertical terminal<CR>
map <leader>th <Esc>:terminal<CR>
imap <F3>wv <Esc>:below vertical split<CR>
map <F3>wv <Esc>:below vertical split<CR>
imap <F3>wh <Esc>:below split<CR>
imap <F7> <Home>//
"custom functions and 
imap <C-a> <Esc><Home>v<End>y<Esc>i
map <F5> :call CompileRun()<CR>
imap <F5> <Esc>:call CompileRun()<CR>
vmap <F5> <Esc>:call CompileRun()<CR>
imap <F6> <Esc>:call FastRun()<CR>
map <F6> <Esc>:call FastRun()<CR>
vmap <F6> <Esc>:call FastRun()<CR>
func! FastRun()
exec "w"
if &filetype == 'cpp'
    exec "!g++ -std=c++17 -Wshadow -Wall % -O2 -Wno-unused-result"
    exec "!time ./a.out && rm a.out"
endif
endfunc

func! CompileRun()
exec "w"
if &filetype == 'c'
    exec "!gcc -pipe -O2 -std=c11 % -lm"
    exec "!time ./a.out && rm a.out"
elseif &filetype == 'cpp'
    exec "!g++ -std=c++17 -Wshadow -Wall % -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG"
    exec "!time ./a.out && rm a.out"
elseif &filetype == 'java'
    exec "!javac % && time java %"
elseif &filetype == 'sh'
    exec "!time bash %"
elseif &filetype == 'python'
    exec "!time python3 %"
elseif &filetype == 'html'
    exec "!google-chrome % &"
elseif &filetype == 'go'
    exec "!go build %< && time go run %"
elseif &filetype == 'md'
    exec "!~/.vim/markdown.pl %:p > %.html &:p && !google-chrome %.html &:p"
elseif &filetype == 'matlab'
    exec "!time octave %:p"
elseif &filetype == 'php'
    exec "!time php %"
endif
endfunc
"custom code fillers for stuff
imap <F2>m <Esc>:call CfMain()<CR>:1<CR>dd:62<CR>i<Tab><Tab>
imap <F2>cm <Esc>:call Codeforces()<CR><Esc>i
imap <F2>bh <Esc>:call BinaryHeap()<CR><Esc>i
imap <F2>ph <Esc>:call PairHashMap()<CR><Esc>i
imap <F2>gcd <Esc>:call Euclidean()<CR><Esc>i
imap <F2>srt <Esc>:call Sorting()<CR><Esc>i
imap <F2>gph <Esc>:call Graph()<CR><Esc>i

func! SmallMain()
    if  &filetype == 'cpp'
        r~/.vim/codelines/cpp_small_main.cpp
    endif
endfunction


func! Sorting()
    if  &filetype == 'cpp'
        r~/.vim/codelines/cpp_sorting.txt
    endif
endfunction

func! Graph()
    if  &filetype == 'cpp'
        r~/.vim/codelines/cpp_graph.txt
    endif
endfunction

func! Euclidean()
    if &filetype == 'cpp'
        r~/.vim/codelines/cpp_GCD_Euclid.txt
    endif
    if &filetype == 'java' 
        r~/.vim/codelines/cpp_GCD_Euclid.txt
    endif
endfunction

func! PairHashMap()
    if &filetype == 'cpp'
        r~/.vim/codelines/cpp_pair_hashmap.txt
    endif
endfunction

func! BinaryHeap()
if &filetype == 'cpp'
    r~/.vim/codelines/cpp_heap_struct.txt
endif
endfunction

func! Codeforces()
if &filetype == 'cpp'
    r~/.vim/codelines/cf_loop_t.txt
endif
endfunction

func! CfMain()
if &filetype == 'cpp'
    r~/.vim/codelines/cpp_small_main.cpp
elseif &filetype == 'java'
    r~/.vim/codelines/java_main_and_beginning.txt
elseif &filetype == 'python'
    r~/.vim/codelines/python_beginning_main.txt
elseif &filetype == 'html'
    r~/.vim/codelines/html_vscode_doc.txt
endif
endfunction
"highlight Pmenu ctermbg=gray gui=bold
"highlight LineNr ctermfg=white gui=bold
"highlight clear LineNr
syntax enable
call vundle#begin('~/.vim/bundle')
    Plugin 'ycm-core/YouCompleteMe'
    "Plugin 'JamshedVesuna/vim-markdown-preview'
    let vim_markdown_preview_github=1
    let vim_markdown_preview_hotkey='<F9>'
    Plugin 'SirVer/ultisnips'
    Plugin 'honza/vim-snippets'
    "Plugin 'rafi/awesome-vim-colorschemes'
    "Plugin 'google/vim-colorscheme-primary'
call vundle#end()
call plug#begin('~/.vim/plugged')
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'cormacrelf/vim-colors-github'
    Plug 'jiangmiao/auto-pairs'
    Plug 'wokalski/autocomplete-flow'
    "Plug 'Shougo/neosnippet'
    "Plug 'Shougo/neosnippet-snippets'
    "Plug 'rakr/vim-one'
    Plug 'tpope/vim-fugitive'
    "Plug 'joshdick/onedark.vim'
    Plug 'enricobacis/vim-airline-clock'
    "Plug 'dunstontc/vim-vscode-theme'
    "Plug 'cormacrelf/vim-colors-github'
let g:neosnippet#enable_completed_snippet = 1
let g:airline#extensions#ale#enabled = 1
"let g:airline_theme = 'codedark'
let vim_markdown_preview_hotkey='<F8>'
let vim_markdown_preview_github=1
let g:airline_theme='angr'
let g:airline#extensions#tabline#enabled = 0
"let g:lightline = {
"      \ 'colorscheme': 'seoul256',
"      \ }
call plug#end()

let g:UltiSnipsExpandTrigger="<F4>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
"netrw settings:
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 20
let g:airline#extensions#clock#auto = 0
function! AirlineInit()
  let g:airline_section_z = airline#section#create(['clock', g:airline_symbols.space, g:airline_section_z])
endfunction
autocmd User AirlineAfterInit call AirlineInit()
