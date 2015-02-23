"Vundle {{{
    "set the runtime path to include Vundle and initialize
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
    "let Vundle manage Vundle, required
    Plugin 'gmarik/Vundle.vim'
    "Plugin 'mattn/emmet-vim'
    "Plugin 'tpope/vim-fugitive'
    Plugin 'scrooloose/nerdtree'
    Plugin 'tpope/vim-surround'
    Plugin 'scrooloose/nerdcommenter'
    Plugin 'kien/ctrlp.vim'
    "Plugin 'scrooloose/syntastic'
    Plugin 'Yggdroot/indentLine'
    Plugin 'Lokaltog/vim-easymotion'
    Plugin 'editorconfig/editorconfig-vim'
    Plugin 'bling/vim-airline'
    call vundle#end()
    "Add bundle ctrlp to runtimepath for .vim to find plugin
    "call pathogen#infect()
"}}}

"VIm general {{{
    "set cursor to always have a distance to borders
    set scrolloff=3
    set fileencoding=utf-8
    set encoding=utf-8
    "set clpboard
    set clipboard=unnamed
    "be iMproved, required
    set nocompatible
    "Filetype indent with plugin possibility
    filetype indent on
    "Loads ftplugin.vim for plugin-filetype possibility
    filetype plugin on
    "Keep indent when creating new line
    set autoindent
    "Activate basic indention
    set smartindent
    "Set $MYVIMRC
    let $MYVIMRC = "$HOME/.vimrc"
    "Enable line-number
    set number
    "Enable white characters
    set list
    set listchars=tab:>-,trail:~,extends:>,precedes:<
    "Set tabs
    set tabstop=4
    set softtabstop=4
    set shiftwidth=4
    "Set backspace to more logically use (delete)
    set backspace=2
    "tabs are spaces
    set expandtab
    "Enable cmd
    set showcmd
    set hidden
    set cursorline
    "cycle tru alternatives
    set wildmenu
    set wildmode=longest,list
    "vim redraw only when need to
    set lazyredraw
    "bracket highlighting
    set showmatch
    set incsearch
    "Set leaders
    let mapleader=","
    let maplocalleader="-"
    "Backup
    set backup
    set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
    set backupskip=/tmp/*,/private/tmp/*
    set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
    "Vim basic ignore windows paths and linux paths if cygwin
    set wildignore+=*/tmp/*,*/target/*,*/node_modules/*,*.so,*.swp,*.zip
    set wildignore+=*\\tmp\\*,*\\target\\*,*.swp,*.zip,*.exe
    "enable local .vimrc configs
    set exrc
    "Wrap
    set wrap
    set nolinebreak
    "Enable fileformat-change
    set modifiable
    "Update outside changes in file
    set autoread
    set tags+=tags
"}}}

"General remapping {{{
    "Set faster ESC
    inoremap <leader>. <esc>
    "Tab overrides
    nnoremap <S-Tab> <<
    nnoremap <Tab> >>
    inoremap <S-Tab> <Esc><<i
    "Make space foldopener
    nnoremap <space> za
    "Make so that wrappled line seem like thier own line
    nnoremap j gj
    nnoremap k gk
    "Open vimrc settings
    nnoremap <leader>sv :split $MYVIMRC<cr>
    "Save session with window setup
    nnoremap <leader>s :mksession<cr> "Future ag-search nnoremap <leader>a :Ag
    nnoremap <leader>W :match Error /\v\s+$/<cr>
    nnoremap <leader>w :%s/\v\s+$//<cr>
    nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
    " bind \ (backward slash) to grep shortcut
    command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
    nnoremap \ :Ag<SPACE>
    " Easier go to file
    nnoremap <leader>m :cd ~/
    nnoremap <leader>e :e ~/
    nnoremap <leader>d :vert diffsplit ~/
    " Simplifying windo movement
    noremap <C-h> <C-w>h
    noremap <C-j> <C-w>j
    noremap <C-k> <C-w>k
    noremap <C-l> <C-w>l
    "Always search in very magic mode
    nnoremap / /\v
    vnoremap / /\v


"}}}




"Search {{{
    "Searching parameters to search for case sensitive only when using capital
    "letters
    set ignorecase
    set smartcase
    "When using search by /
    set hlsearch
    "Enter after search will cancel highlighting
    nnoremap <cr> :noh<cr><cr>
"}}}

"Fold {{{
    set foldenable
    "open most folds by default
    set foldlevelstart=10
    set foldmethod=indent
    set foldnestmax=10
"}}}

"Supposedly this will give an undo tree however Im not sure if working
nnoremap <leader>u :GundoToggle<cr>

"Color/Theme {{{
    syntax on
    set t_Co=256
    set background=dark
    colorscheme solarized
    let g:solarized_visibility = "high"
    let g:solarized_contrast = "high"
    let g:solarized_termcolors = 16
    "auto cmd to keep colors
    augroup airline
        autocmd!
        let g:airline_left_sep=''
        let g:airline_right_sep=''
        let g:airline_detect_modified=1
        let g:airline_powerline_fonts=1
        let g:airline_powerline_symbols='fancy'
        let g:airline_theme='solarized'
    augroup END
    "Statusbar theme
    "Enable colorscheme
"}}}
"Statusline {{{
    "first, enable status line always
    set noruler
    set laststatus =2
"}}}

"surrondings {{{
    nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
    nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
    nnoremap <leader>( viw<esc>a)<esc>hbi(<esc>lel
    nnoremap <leader>[ viw<esc>a]<esc>hbi[<esc>lel
"}}}

"Abbriviations {{{
    iabbrev ccopy Copy right 2014 Adrian Forsius, all rights reserved.
    iabbrev @@ adrianforsius@gmail.com
    iabbrev Attr Attributes
    iabbrev Appl Application
"}}}

"Plugin settings {{{
    "indentLine {{{
        let g:indentLine_color_term = 239
        let g:indentLine_char = '¦'
    "}}}
    "easyMotion {{{
        map <leader><leader> <Plug>(easymotion-sn)
        "onoremap ctrl-; <Plug>(easymotion-tn)
    "}}}
    "ctrlP {{{
        "CtrlP settings
        let g:ctrlp_match_window = 'bottom, order:ttb,min:1,max:20,results:20'
        let g:ctrlp_switch_buffer = 0
        let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
        let g:ctrlp_working_path_mode = 0
        let g:ctrlp_by_filename = 1
        let g:ctrlp_regexp = 1
        let g:ctrlp_map = '<c-p>'
        let g:ctrlp_cmd = 'CtrlPMixed'
        "Fix to open ctrlp in mixed mode instead of default
    "}}}
    "NerdTree {{{
        "autocmd VimEnter * NERDTree
        let g:NERDTreeWinSize = 45
        let g:NERDTreeShowLineNumbers = 1
        let g:NERDTreeChDirMode       = 2
    "}}}
"}}}

"Auto commands new files {{{
    augroup new_file
        autocmd!
        autocmd BufNewFile *.* :write
    augroup END
    augroup new_html
        autocmd!
        autocmd BufWritePre,BufRead *.html :normal gg=G
    augroup END
"}}}

"Auto commands for filetype buffer {{{
    augroup buffer_javascript
        autocmd!
        autocmd FileType javascript :iabbrev <buffer> iff if ()<left>
    augroup END
    augroup buffer_php
        autocmd!
    augroup END
    augroup buffer_python
        autocmd!
    augroup END
"}}}

"Working directory {{{
    augroup setWorkingDirectory
        autocmd!
        autocmd BufEnter * lcd %:p:h
    augroup END
"}}}

"Commenting {{{
    "augroup commenting
        "autocmd!
        "Commenting blocks of code.
        "autocmd FileType c,cpp,java,scala,javascript,php let b:comment_leader = '// '
        "autocmd FileType sh,ruby,python   let b:comment_leader = '# '
        "autocmd FileType conf,fstab       let b:comment_leader = '# '
        "autocmd FileType tex              let b:comment_leader = '% '
        "autocmd FileType mail             let b:comment_leader = '> '
        "autocmd FileType vim              let b:comment_leader = '"'
        "noremap <silent> <leader>cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
        "noremap <silent> <leader>cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>
    "augroup END
"}}}
"Vim util {{{
    function! RefreshUI()
        if exists(':AirlineRefresh')
            AirlineRefresh
        else
            " Clear & redraw the screen, then redraw all
            " statuslines.
            redraw!
            redrawstatus!
        endif
    endfunction
    augroup vim_util
        autocmd!
        autocmd BufWritePost .vimrc,_vimrc,vimrmrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif | :call RefreshUI()
    augroup END
"}}}

" Functions
function! Dotfiles(file)
    if filereadable($HOME."/".a:file)
        let homefile = $HOME."/".a:file
        let dotfile = $DOTFILES."/".a:file
        execute ":e ".homefile
        execute ":vert diffsplit ".dotfile
    else
        echom 'No such dotfile'
    endif
endfunction
" Parse gitignore
let filename = '.gitignore'
if filereadable(filename)
    let igstring = ''
    for oline in readfile(filename)
        let line = substitute(oline, '\s|\n|\r', '', "g")
        if line =~ '^#' | con | endif
        if line == '' | con  | endif
        if line =~ '^!' | con  | endif
        if line =~ '/$' | let igstring .= "," . line . "*" | con | endif
        let igstring .= "," . line
    endfor
    let execstring = "set wildignore=".substitute(igstring, '^,', '', "g")
    execute execstring
endif
" Use AG instead of grep (fastert) if executeable
if executable('ag')
    " Note we extract the column as well as the file and line number
    set grepprg=ag\ --nogroup\ --nocolor\ --column
    set grepformat=%f:%l:%c%m
    " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

    " ag is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching = 0
endif
