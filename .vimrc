let mapleader = ","

filetype off  "for vundle

set rtp+=~/.vim/vundle.git/
call vundle#rc()

" Bundles
" {{
Bundle 'rstacruz/sparkup', {'rtp' : 'vim/'}
Bundle 'https://github.com/tpope/vim-rails.git'
nmap <leader>rc :RVcontroller<CR>
nmap <leader>rm :RVmodel<CR>
nmap <leader>rv :RVview<CR>
nmap <leader>rt :RVfunctionaltest<CR>

" Snippets
Bundle "git@github.com:sugarcoded/snipmate.vim.git"


" Syntax highlight
Bundle 'Markdown'

" Coffeescript!
Bundle 'https://github.com/kchmck/vim-coffee-script.git'

" Git integration
Bundle 'git.zip'
Bundle 'tpope/vim-fugitive'
" vim/fugitive mappings
nmap <leader>gid :Gdiff<CR>
nmap <leader>gis :Gstatus<CR>
nmap <leader>gic :Gcommit<CR>

" Utility
Bundle 'surround.vim'
Bundle 'Align'
Bundle 'ack.vim'
Bundle 'bufexplorer.zip'
Bundle 'endwise.vim'
"Bundle 'Conque-Shell'
runtime macros/matchit.vim

Bundle 'SuperTab-continued.'

" Command-T
Bundle 'git://git.wincent.com/command-t.git'
"Command-T configuration
let g:CommandTMaxHeight=20
"map to CommandT TextMate style finder
nnoremap <leader>t :CommandTFlush<cr>\|:CommandT<CR>
"Command T rails helpers
map <leader>gv :CommandTFlush<cr>\|:CommandT app/views<cr>
map <leader>gc :CommandTFlush<cr>\|:CommandT app/controllers<cr>
map <leader>gm :CommandTFlush<cr>\|:CommandT app/models<cr>
map <leader>gh :CommandTFlush<cr>\|:CommandT app/helpers<cr>
map <leader>gl :CommandTFlush<cr>\|:CommandT lib<cr>
map <leader>gp :CommandTFlush<cr>\|:CommandT public<cr>
map <leader>gs :CommandTFlush<cr>\|:CommandT public/stylesheets<cr>
map <leader>gj :CommandTFlush<cr>\|:CommandT public/javascripts<cr>

" NERD
Bundle 'The-NERD-tree'
Bundle 'The-NERD-Commenter'
silent! nmap <silent> <Leader>n :NERDTreeToggle<CR>

" Trying out
Bundle 'camelcasemotion'
Bundle 'Syntastic'
Bundle 'pangloss/vim-javascript'
Bundle "repeat.vim"
Bundle "jQuery"
Bundle 'taglist.vim'
"Tag list stuff
let Tlist_Show_One_File=1
let Tlist_Use_Right_Window=1
let Tlist_Compact_Format=1
let Tlist_Enable_Fold_Column=0
let Tlist_Close_On_Select=1
let Tlist_GainFocus_On_ToggleOpen=1
let Tlist_Inc_Winwidth=1
let Tlist_Use_Horiz_Window=1
nmap <leader>l :Tlist<CR>/
Bundle 'YankRing.vim'

" Ruby
Bundle 'vim-ruby/vim-ruby'
Bundle 'textobj-user'
Bundle 'textobj-rubyblock'

" Color schemes
Bundle 'sugarcoded/vim-colors'
Bundle 'Solarized'

filetype plugin indent on  "for vundle

" }}


"Use Vim settings, rather then Vi settings (much better!).
"This must be first, because it changes other options as a side effect.
set nocompatible

"allow backspacing over everything in insert mode
set backspace=indent,eol,start

"store lots of :cmdline history
set history=1000

set showcmd     "show incomplete cmds down the bottom
set showmode    "show current mode down the bottom
set cmdheight=2

set incsearch   "find the next match as we type the search
set hlsearch    "hilight searches by default

set number      "add line numbers
set showbreak=...
set wrap linebreak nolist

"add some line space for easy reading
set linespace=4

"disable visual bell
set visualbell t_vb=

set fo=l

"statusline setup
set statusline=%f       "tail of the filename

"Git
"set statusline+=[%{GitBranch()}]

"RVM
"set statusline+=%{exists('g:loaded_rvm')?rvm#statusline():''}

"display a warning if fileformat isnt unix
"set statusline+=%#warningmsg#
"set statusline+=%{&ff!='unix'?'['.&ff.']':''}
"set statusline+=%*

"Display a warning if file encoding isnt utf-8
set statusline+=%#warningmsg#
set statusline+=%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}
set statusline+=%*

"set statusline+=%h      "help file flag
"set statusline+=%y      "filetype
"set statusline+=%r      "read only flag
"set statusline+=%m      "modified flag

"display a warning if &et is wrong, or we have mixed-indenting
"set statusline+=%#error#
"set statusline+=%{StatuslineTabWarning()}
"set statusline+=%*
"
"set statusline+=%{StatuslineTrailingSpaceWarning()}
"
"set statusline+=%{StatuslineLongLineWarning()}
"
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"display a warning if &paste is set
"set statusline+=%#error#
"set statusline+=%{&paste?'[paste]':''}
"set statusline+=%*

set statusline+=%=      "left/right separator

"set statusline+=%{StatuslineCurrentHighlight()}\ \ "current highlight

set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file
set laststatus=2

"turn off needless toolbar on gvim/mvim
set guioptions-=T

"indent settings
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent

"folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

set wildmode=list:longest   "make cmdline tab completion similar to bash
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~,vendor/ruby*,views/*.js,models/*.js,collections/*.js,controllers/*.js,vendor/** "stuff to ignore when tab completing
let NERDTreeIgnore = ['\view.js$','\model.js$','\controller.js$','\collection.js$']

set formatoptions-=o "dont continue comments when pushing o/O

"vertical/horizontal scroll off settings
set scrolloff=3
set sidescrolloff=7
set sidescroll=1

"turn on syntax highlighting
syntax on

"some stuff to get the mouse going in term
set mouse=a
set ttymouse=xterm2

"hide buffers when not displayed
set hidden

colorscheme sunburst
set background=dark
"set background=light
"colorscheme solarized

if has("gui_running")
    "tell the term has 256 colors
    set t_Co=256
    set guitablabel=%M%t
    set lines=40
    set columns=115

    if has("gui_gnome")
        set term=gnome-256color
        set guifont=Inconsolata:h16
    endif

    if has("gui_mac") || has("gui_macvim")
        set guifont=Inconsolata:h16
        " make Mac's Option key behave as the Meta key
        set invmmta
        try
          set transparency=0
        catch
        endtry
    endif

    if has("gui_win32") || has("gui_win32s")
        set guifont=Consolas:h12
        set enc=utf-8
    endif
else
    "dont load csapprox if there is no gui support - silences an annoying warning
    let g:CSApprox_loaded = 1

    "set railscasts colorscheme when running vim in gnome terminal
    if $COLORTERM == 'gnome-terminal'
        set term=gnome-256color
    endif
endif

"make Y consistent with C and D
nnoremap Y y$

"mark syntax errors with :signs
let g:syntastic_enable_signs=1

"visual search mappings
function! s:VSetSearch()
    let temp = @@
    norm! gvy
    let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
    let @@ = temp
endfunction

"jump to last cursor position when opening a file
"dont do it when writing a commit log entry
autocmd BufReadPost * call SetCursorPosition()
function! SetCursorPosition()
    if &filetype !~ 'commit\c'
        if line("'\"") > 0 && line("'\"") <= line("$")
            exe "normal! g`\""
            normal! zz
        endif
    end
endfunction

"set shell=/bin/bash\ -i
set shell=/bin/zsh
"set shell=/bin/sh
"set shell=/usr/local/Cellar/zsh/4.3.11/bin/zsh\ -i
"set shell=bash
map ; :
noremap ;; ;

"Clear highlight
nnoremap <leader>h :noh<return>
:nnoremap <CR> :nohlsearch<cr>

set shortmess=atI
map <leader>f :suspend<CR>

nmap <C-k> [e
nmap <C-j> ]e
vmap <C-k> [egv
vmap <C-j> ]egv
set smartcase
set ignorecase

set list listchars=trail:.
nmap <leader>p :put<CR>==
set tags=./tags;
set clipboard=unnamed

nmap <leader>v :edit $MYVIMRC<CR>
"Directories for swp files
set backupdir=~/.vim/backup
set directory=~/.vim/backup
command! KillWhitespace :normal :%s/ *$//g<cr><c-o><cr>

nmap <leader><tab> <C-^><CR>
nmap <leader>s :tag 
nmap <leader>a :Ack --ignore-dir=vendor 
nnoremap <silent> <leader>yr :YRShow<CR>
set enc=utf-8

"run test on the current files
nmap <leader>dt :! fruby -I"lib:test" %<CR>
"nmap <leader>dta :! frake test<CR>

set winwidth=90
" We have to have a winheight bigger than we want to set winminheight. But if
" we set winheight to be huge before winminheight, the winminheight set will
" fail.
set winheight=25
set winminheight=20
set winminwidth=50
set winheight=999

nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
