"Vundle {{{
    "Set filetype off to avoid errors
    filetype off
    "set the runtime path to include Vundle and initialize
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
    "let Vundle manage Vundle, required
    Plugin 'gmarik/Vundle.vim'
    Plugin 'scrooloose/nerdtree'
    Plugin 'tpope/vim-surround'
    Plugin 'scrooloose/nerdcommenter'
    Plugin 'kien/ctrlp.vim'
    Plugin 'Lokaltog/vim-easymotion'
    Plugin 'editorconfig/editorconfig-vim'
    Plugin 'tpope/vim-fugitive'
    Plugin 'bling/vim-airline'
    Plugin 'altercation/vim-colors-solarized'
    Plugin 'burke/matcher'
    Plugin 'scrooloose/syntastic'
    Plugin 'terryma/vim-multiple-cursors'
    Plugin 'git@scmcoord.com:sion.leroux/vim-blocket.git'
    "Plugin 'mitsuhiko/vim-jinja'
    "Plugin 'matchit.zip'
    "Plugin 'jiangmiao/auto-pairs'
    "Plugin 'docunext/closetag.vim'
    call vundle#end()
    "Add bundle ctrlp to runtimepath for .vim to find plugin
    "Filetype indent with plugin possibility load after vundle to avoid errors
    filetype indent plugin on
"}}}

"VIm general {{{
    let g:html_indent_inctags = "html,body,head,tbody"
    "set cursor to always have a distance to borders
    set scrolloff=3
    set fileencoding=utf-8
    set encoding=utf-8
    "set clpboard
    set clipboard=unnamed
    "be iMproved, required
    set nocompatible
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
    set listchars=tab:→\ ,trail:~,extends:>,precedes:<
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
    set backupdir=~/.vim-tmp,~/.vim/.tmp,~/tmp,/var/tmp,/tmp
    set backupskip=/tmp/*,/private/tmp/*
    set directory=~/.vim-tmp,~/.vim/.tmp,~/tmp,/var/tmp,/tmp
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
    "format mappings {{{
        nnoremap <leader>fj :%!python -m json.tool<cr>
        nnoremap <leader>fh :s/<[^>]*>/\r&\r/g<cr>G=gg<cr>:g/^$/d<cr>
    "}}}
    "delete empty lines
    nnoremap <leader>d= :g/^$/d
    "HTML newlines
    nnoremap <leader>r= :s/<[^>]*>/\r&\r/g
    "remove trailing whitespace
    nnoremap <Leader>rtw :%s/\s\+$//e<CR>
    "PHP mappgin
    nnoremap <leader>.j :lnext<CR>
    nnoremap <leader>o :e <C-R>=expand("%:p:h") . "/" <CR>
    nnoremap <leader>n :sav <C-R>=expand("%:p:h") . "/" <CR>
    "Set faster ESC
    inoremap <leader>. <esc>
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
    nnoremap <leader>yy :set nonumber!<CR>:set list!<CR>
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
    "Enable colorscheme
    colorscheme solarized
    "hi NonText term=bold cterm=bold ctermfg=1 gui=bold guifg=Black
    "hi SpecialKey ctermfg=black
    syntax on
    set background=dark
    set t_Co=256
    let g:solarized_visibility = "normal"
    let g:solarized_contrast = "normal"

    let g:airline_left_sep=''
    let g:airline_right_sep=''
    let g:airline_detect_modified=1
    let g:airline_powerline_fonts=1
    let g:airline_powerline_symbols='fancy'
    let g:airline_theme='solarized'
    let g:airline#extensions#syntastic#enabled = 1
    let g:airline_section_warning = 'syntastic'
    hi SpecialKey ctermfg=101 guifg=#649A9A
"}}}
"Statusline {{{
    "first, enable status line always
    set noruler
    set laststatus=2
"}}}

"surrondings {{{
    nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
    nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
    nnoremap <leader>( viw<esc>a)<esc>hbi(<esc>lel
    nnoremap <leader>[ viw<esc>a]<esc>hbi[<esc>lel
"}}}

"Abbriviations {{{
    iabbrev ccopy Copy right 2014 Adrian Forsius, all rights reserved.
    iabbrev Attr Attributes
    iabbrev Appl Application
    iabbrev :W :w
    iabbrev ppp \<CR>print_r('<pre class="awesometest">');\<CR>print_r();\<CR>print_r('</pre>');
"}}}

"Plugin settings {{{
    " closetag {{{
        "set closetag.vim preference
        let g:closetag_html_style = 1
    " }}}
    " syntastic {{{
        set statusline+=%#warningmsg#
        set statusline+=%{SyntasticStatuslineFlag()}
        set statusline+=%*

        let g:syntastic_always_populate_loc_list = 1
        let g:syntastic_auto_loc_list = 1
        let g:syntastic_check_on_open = 1
        let g:syntastic_check_on_wq = 0
        let g:syntastic_check_on_w = 1
        let g:syntastic_python_checkers = ['python', 'pylint']
        "let g:syntastic_python_pylint_rcfile='/home/adrfor1/branches/pysite/utils/pylint.rc'

        "To indent switch-statements properly
        let g:PHP_vintage_case_default_indent = 1
    "}}}
    "indentLine {{{
        let g:indentLine_color_term = 239
        let g:indentLine_char = '¦'
    "}}}
    "easyMotion {{{
        map <leader><leader>s <Plug>(easymotion-sn)
        "onoremap ctrl-; <Plug>(easymotion-tn)
        let g:EasyMotion_use_smartsign_us = 1 " US layout
    "}}}
    "multicursor {{{
        let g:multi_cursor_start_key='<C-n>'
        let g:multi_cursor_start_word_key='g<C-n>'
    "}}}
    "ctrlP {{{
        "CtrlP settings
        let g:ctrlp_match_window = 'bottom, order:ttb,min:1,max:8,results:8'
        let g:ctrlp_switch_buffer = 0
        let g:ctrlp_working_path_mode = 0
        let g:ctrlp_by_filename = 0
        let g:ctrlp_regexp = 1
        let g:ctrlp_map = '<c-p>'
        let g:ctrlp_cmd = 'CtrlPMixed'
        let g:path_to_matcher = 'matcher'
        let g:ctrlp_match_func = { 'match': 'GoodMatch' }
        let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard | grep -v "__init__.py"']
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
    "augroup setWorkingDirectory
        "autocmd!
        "autocmd BufEnter * lcd %:p:h
    "augroup END
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
" Use AG instead of grep (fastert) if executeable
if executable('ag')
    " Note we extract the column as well as the file and line number
    set grepprg=ag\ --nogroup\ --nocolor\ --column
    set grepformat=%f:%l:%c%m
    " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
    let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard', 'ag %s -l --hidden --nocolor -g ""']

    " ag is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching = 0
endif
function! GoodMatch(items, str, limit, mmode, ispath, crfile, regex)
    " Create a cache file if not yet exists
    let cachefile = ctrlp#utils#cachedir().'/matcher.cache'
    if !( filereadable(cachefile) && a:items == readfile(cachefile) )
        call writefile(a:items, cachefile)
    endif
    if !filereadable(cachefile)
        return []
    endif
    " a:mmode is currently ignored. In the
    " future, we should probably do
    " something about that. the matcher
    " behaves like "full-line".
    let cmd = g:path_to_matcher.' --limit '.a:limit.' --manifest '.cachefile.' '
    if !( exists('g:ctrlp_dotfiles') && g:ctrlp_dotfiles )
        let cmd = cmd.'--no-dotfiles '
    endif
    let cmd = cmd.a:str
    return split(system(cmd), "\n")
endfunction
" Blocket {{{
    set path=.;~,/usr/include
    set includeexpr=substitute(v:fname,'^\\(.*\\)$','templates/\\1.tmpl','g')

    "Improved bconf detection
    au! BufRead,BufNewFile *.bconf setfiletype bconf
    " set commentstring for tpope/vim-commentary
    au FileType bconf set commentstring=#\ %s
"}}}
