" ================= 
" GENERIC SETTINGS
" =================

set nocompatible      "Disable vi compatibility mode.  
set history=1000      "Increase history size.   
set encoding=utf-8    "Encoding.  
syntax enable         "Turn on syntax highlighting.    
set hidden

" ===================
" FILE SETTINGS & UI 
" =================== 

set nolist            "hides invisible characters  
set clipboard=unnamed       "active clipboard

" Disable swapfile & backup
set noswapfile
set nobackup

" Modify indenting settings
set autoindent        "Autoindent always ON  
set expandtab         "Expand tabs  
set shiftwidth=2      "Space for autoindenting  
set softtabstop=2     "Remove a full pseudo-tab when i press <BS>  
set noshiftround  

set noshowmode          "Always show which more are we in    
set showcmd           "show partial commands in the last line of the screen
set laststatus=2      "Always show statusbar  
set wildmenu          "Enable visual wildmenu  
set ruler             "Enable ruler  

set nowrap              "Automatically wrap text that extends beyond the screen length  
set number            "Show line numbers
set relativenumber    "Show numbers as relative by default
set cursorline        "Highlight line where the cursor is 
set showmatch         "Highlight matching parentheses and brackets 

set scrolloff=5       "Display 5 lines above/below the cursor when scrolling with a mause  
set ttyfast           "Speed up scrolling in vim  
set backspace=indent,eol,start        "Fixes common backspace problems  
set matchpairs+=<:>       "Highlight matching pairs of brackets. Use the '%' character to jump between them.  
set hlsearch          "Highlight matching search patterns.  
set incsearch         "Enable incremental search.
set ignorecase        "Include matching uppercase words with lowercase search term  
set smartcase         "Include only uppercase words with uppercase search term  
set viminfo='100,<9999,s100       "Store info from no more than 100 files at a time, 9999 lines of text, 100kb of data.  
set termguicolors
set background=dark
set re=0
set statusline=%{FugitiveStatusline()}
set updatetime=50

" ===============================================================================================================================================
" Autocompletion
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS noci
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType json syntax match Comment +\/\/.\+$+
autocmd FileType html,css EmmetInstall
autocmd FileType html setlocal ts=2 sts=2 sw=2
autocmd FileType hbs set ts=2 sts=2 sw=2

" =================
" MAP AND FUCTIONS 
" ================= 

let mapleader =" "

imap jk <Esc> :w<CR>
nmap <silent><leader>h :bp<CR>
nmap <silent><leader>l :bn<CR>
noremap <leader>q :q<CR> 
noremap <leader>w :w<CR>
noremap <leader>x :x<CR>
noremap <leader>qq :bd<CR>
noremap <leader>gs :CocSearch
noremap <leader>fs :Files<CR>
noremap <leader>nt :NERDTreeFind<CR>

"Tmux Navigator
noremap <leader>hh :TmuxNavigateLeft<CR>
noremap <leader>jj :TmuxNavigateDown<CR>
noremap <leader>kk :TmuxNavigateUp<CR>
noremap <leader>ll :TmuxNavigateRight<CR>
noremap <leader>ñ :TmuxNavigatePrevious<CR>

" GoTo code navigation.
nmap <silent>gd <Plug>(coc-definition)
nmap <silent>gy <Plug>(coc-type-definition)
nmap <silent>gi <Plug>(coc-implementation)
nmap <silent>gr <Plug>(coc-references) 

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" ========
" PLUGINS 
" ======== 

call plug#begin('~/.vim/plugged')

Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'pangloss/vim-javascript'    " JavaScript support.
Plug 'HerringtonDarkholme/yats.vim'     "TypeScript syntax.
Plug 'sheerun/vim-polyglot'
Plug 'mustache/vim-mustache-handlebars'
Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'airblade/vim-gitgutter'
Plug 'neoclide/coc.nvim' , { 'branch' : 'release' }
Plug 'christoomey/vim-tmux-navigator'
Plug 'vim-airline/vim-airline'
Plug 'joshdick/onedark.vim'
Plug 'Yggdroot/indentLine'
Plug 'jiangmiao/auto-pairs'
Plug 'ap/vim-css-color'
Plug 'othree/html5.vim'
Plug 'othree/csscomplete.vim'
Plug 'vim-python/python-syntax'
Plug 'mattn/emmet-vim'
"Plug 'sudar/vim-arduino-syntax'
"Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
"Plug 'sudar/vim-arduino-snippets'
"Plug 'voldikss/vim-floaterm'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

call plug#end()

" ========
" PLUGSTART 
" ======== 

"Markdown

"Floaterm
"let g:floaterm_keymap_new = '<F7>'
"let g:floaterm_keymap_prev = '<F8>'
"let g:floaterm_keymap_next = '<F9>'
"let g:floaterm_keymap_kill = '<F12>'

"Ultisnips

let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsListSnippets = "<C-tab>"
let g:UltiSnipsJumpForwardTrigger = "<C-b>"
let g:UltiSnipsJumpBackwardTrigger = "<C-ñ>"
let g:UltiSnipsEditSplit = "vertical"

"html5
let g:html5_event_handler_attributes_complete = 0
let g:html5_fdfa_attributes_complete = 0
let g:html5_microdata_attributes_complete = 0
let g:html5_aria_attributes_complete = 0

"javascript
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1

"Python
let g:python_highlight_all = 1

"Coc
let g:coc_global_extensions = [ 'coc-tsserver', 'coc-json', 'coc-css', 'coc-html', 'coc-java']
let g:coc_disable_startup_warning = 1

"NERDTreeFind
let g:NERDTreeShowFiles = 1
let g:NERDTreeShowHidden = 1
let g:NERDTreeDirArrowExpandable = '⇨'
let g:NERDTreeDirArrowCollapsible = '⬂'
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeSyntaxDisableDefaultExtensions = 1
let g:NERDTreeSyntaxDisableDefaultExactMatches = 1
let g:NERDTreeSyntaxDisableDefaultPatternMatches = 1
let g:NERDTreeSyntaxEnabledExtensions = ['cpp', 'ts', 'js', 'css', 'html', 'hbs', 'json', 'vim', '.vimrc', 'markdown', 'md', 'git', '.gitignore']
let g:NERDTreeSyntaxEnabledExactMatches = ['node_modules', 'favicon.ico']
let g:NERDTreeHighlightCursorline=0

let s:blue = "0076C6"
let s:darkBlue = "024AD1"
let s:red = "AE403F"
let s:beige = "F5C06F"
let s:yellow = "F7DF1E"
let s:green = "8FAA54"
let s:git_orange = "F54D27"

let g:NERDTreeExtensionHighlightColor = {} 
let g:NERDTreeExtensionHighlightColor['css'] = s:darkBlue 
let g:NERDTreeExtensionHighlightColor['ts'] = s:blue
let g:NERDTreeExtensionHighlightColor['js'] = s:yellow  
let g:NERDTreeExtensionHighlightColor['.gitignore'] = s:git_orange
let g:NERDTreeExtensionHighlightColor['hbs'] = s:red
let g:WebDevIconsDefaultFolderSymbolColor = s:beige 
let g:WebDevIconsDefaultFileSymbolColor = s:green

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"Tmux Navigator
let g:tmux_navigator_no_mappings = 1

"airline
let g:airline_powerline_fonts = 1
let g:airline_symbols_ascii = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

"Theme
let g:onedark_terminal_italics = 1
colorscheme onedark

"Handleabars
"BufRead, BufNewFile * .handlebars, *. Hbs set ft = html syntax = handlebars

"IdentLine
let g:indentLine_char_list = ['¦']

"Emmet
let g:user_emmet_leader_key = '<C-x>'

