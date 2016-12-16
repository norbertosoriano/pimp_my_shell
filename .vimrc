set nocompatible

call plug#begin()
" Pimp My Shell
Plug 'tpope/vim-sensible'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
" Vim IDE
Plug 'christoomey/vim-tmux-navigator'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'mileszs/ack.vim'

Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'

Plug 'ervandew/supertab'
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
Plug 'Valloric/YouCompleteMe'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'scrooloose/syntastic'
Plug 'sheerun/vim-polyglot'

"Plug 'Yggdroot/indentLine'
Plug 'scrooloose/nerdcommenter'
Plug 'jiangmiao/auto-pairs'
Plug 'ntpeters/vim-better-whitespace'
Plug 'godlygeek/tabular'
Plug 'christoomey/vim-system-copy'

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'
Plug 'majutsushi/tagbar'
call plug#end()

" --- General settings ---
set backspace=indent,eol,start " allow backspacing over everything in insert mode

set number     " show line numbers on the left of the screen
set cursorline " show horizontal line where cursos is standing
set ruler      " show in the right down corner the line number/column number/virtual column number/relative position
set showcmd    " show information about the current command going on

set expandtab                                                   " insert space characters whenever the tab key is pressed
set tabstop=4                                                   " number of space characters that will be inserted when the tab key is pressed
set shiftwidth=4                                                " number of space characters inserted for indentation
set shiftround                                                  " use multiple of shiftwidth when indenting with '<' and '>'
set autoindent                                                  " copy the indentation from the previous line
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣ " show invisibles
" set list                                                        " display invisibles

set ignorecase " ignore case when searching
set smartcase  " ignore case if search pattern is all lowercase, otherwise search is case sensitive
set incsearch  " show search matches as you type
set hlsearch   " highlight search results

syntax on

"set mouse=a

" vim-airline Theme
:let g:airline_theme = 'bubblegum'
:let g:airline#extensions#tmuxline#enabled = 0

" tmuxline.vim Preset
" NOTE: need to modify '~/.tmux.conf' file
let g:tmuxline_preset = {
        \ 'a': '[#S]',
        \ 'win': '#I:#W#F',
        \ 'cwin': '#I:#W#F',
        \ 'z': '"#22T" %FT%T-%z',
        \ 'options': {
        \'status-justify': 'left'}
        \}

" tmuxline.vim Theme
" NOTE: need to modify '~/.tmux.conf' file
let g:tmuxline_theme = {
        \   'bg'   : [ 244, 236 ],
        \   'a'    : [ 236, 150 ],
        \   'b'    : [ 253, 239 ],
        \   'c'    : [ 244, 236 ],
        \   'win'  : [ 150, 236 ],
        \   'cwin' : [ 236, 150 ],
        \   'x'    : [ 244, 236 ],
        \   'y'    : [ 253, 239 ],
        \   'z'    : [ 236, 150 ]
        \}

" ----- jistr/vim-nerdtree-tabs settings -----
" Open/close NERDTree Tabs with \t
nmap <silent> <leader>t :NERDTreeTabsToggle<CR>
" To have NERDTree always open on startup
"let g:nerdtree_tabs_open_on_console_startup = 0
autocmd BufEnter * if &modifiable | NERDTreeFind | wincmd p | endif

" ----- junegunn/fz fsettings -----
nnoremap <Leader>f :FZF -m<Space>

" ----- mileszs/ack.vim settings -----
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif

" ----- Valloric/YouCompleteMe settings -----
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" ----- SirVer/ultisnips settings -----
" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" ----- scrooloose/syntastic settings -----
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" ----- Yggdroot/indentLine settings -----
" let g:indentLine_leadingSpaceEnabled = 1

" ----- ntpeters/vim-better-whitespace settings -----
if (exists('+colorcolumn'))
    set colorcolumn=100
    highlight ColorColumn ctermbg=9
endif

" ----- xolox/vim-easytags settings -----
" Where to look for tags files
set tags=./tags;,~/.vimtags
" Sensible defaults
let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_async = 1
let g:easytags_dynamic_files = 2
let g:easytags_resolve_links = 1
let g:easytags_suppress_ctags_warning = 1

" ----- majutsushi/tagbar settings -----
" Open/close tagbar with \b
nmap <silent> <leader>b :TagbarToggle<CR>
" Uncomment to open tagbar automatically whenever possible
"autocmd BufEnter * nested :call tagbar#autoopen(0)
