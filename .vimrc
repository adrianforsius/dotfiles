"Vundle {{{
    "Set filetype off to avoid errors
    filetype off
    call plug#begin('~/.vim/plugged')
        Plug 'YankRing.vim'
        Plug 'tpope/vim-surround'
        Plug 'scrooloose/nerdcommenter'
        Plug 'kien/ctrlp.vim'
        Plug 'Lokaltog/vim-easymotion'
        Plug 'editorconfig/editorconfig-vim'
        Plug 'tpope/vim-fugitive'
        Plug 'bling/vim-airline'
        Plug 'jsx/jsx.vim'
        Plug 'powerline/fonts'
        Plug 'altercation/vim-colors-solarized'
        Plug 'burke/matcher'
        Plug 'mxw/vim-jsx'
        Plug 'scrooloose/syntastic'
        Plug 'mitsuhiko/vim-jinja'
        Plug 'matchit.zip'
        Plug 'jiangmiao/auto-pairs'
        Plug 'docunext/closetag.vim'
        Plug 'mattn/emmet-vim'
        Plug 'nvie/vim-flake8'
        Plug 'junegunn/fzf'
        Plug 'henrik/vim-indexed-search'
        Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
    call plug#end()
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
    set listchars=tab:~\ ,trail:~,extends:>,precedes:<
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
    "tags
    nnoremap <leader>. :tag <c-r><c-w><cr>
    set tags+=tags
"}}}

"General remapping {{{
    "format mappings {{{
        nnoremap <leader>fj :%!python -m json.tool<cr>
        nnoremap <leader>fh :s/<[^>]*>/\r&\r/g<cr>G=gg<cr>:g/^$/d<cr>
        "delete empty lines
        nnoremap <leader>d= :g/^$/d
        "HTML newlines
        nnoremap <leader>r= :s/<[^>]*>/\r&\r/g
        "remove trailing whitespace
        nnoremap <Leader>rtw :%s/\s\+$//e<CR>
    "}}}
    "visual selection search
     vnoremap // y/<C-R>"<CR>"
    "open/save mappings
    nnoremap <leader>o :e <C-R>=expand("%:p:h") . "/" <CR>
    nnoremap <leader>n :sav <C-R>=expand("%:p:h") . "/" <CR>
    "Make so that wrappled line seem like thier own line
    nnoremap j gj
    nnoremap k gk
    "Open vimrc settings
    nnoremap <leader>sv :split $MYVIMRC<cr>
    "Save session with window setup
    nnoremap <leader>s :mksession<cr> "Future ag-search nnoremap <leader>a :Ag
    nnoremap <leader>W :match Error /\v\s+$/<cr>
    nnoremap <leader>w :%s/\v\s+$//<cr>
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
    let g:airline_powerline_symbols='fancy'
    let g:airline#extensions#syntastic#enabled = 1
    let g:airline_section_warning = 'syntastic'
    hi SpecialKey ctermfg=101 guifg=#649A9A


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
    iabbrev :W :w
    iabbrev ppp \<CR>print_r('<pre class="awesometest">');\<CR>print_r();\<CR>print_r('</pre>');
"}}}

"Plugin settings {{{
    " auto-pair {{{
        let g:AutoPairsShortcutFastWrap='<Nop>'
    " }}}
    " emmet {{{
        let g:user_emmet_leader_key='<C-s>'
    " }}}
    " yankring {{{
        nnoremap <leader>ys :YRShow<cr>
    " }}}
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
        "Fix to open ctrlp in mixed mode instead of default
    "}}}
    "NerdTree {{{
        "autocmd VimEnter * NERDTree
        let g:NERDTreeWinSize = 45
        let g:NERDTreeShowLineNumbers = 1
        let g:NERDTreeChDirMode       = 2
    "}}}
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

" Use AG instead of grep (fastert) if executeable
if executable('ag')
    " Note we extract the column as well as the file and line number
    set grepprg=ag\ --nogroup\ --nocolor\ --column
    set grepformat=%f:%l:%c%m
    " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
    let g:ctrlp_user_command = ['upfind -name ".git/"', 'git --git-dir=%s/.git ls-files -oc --exclude-standard', 'ag %s -l --hidden --nocolor -g ""']

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
" Blocket {{{
    xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

    function! ExecuteMacroOverVisualRange()
      echo "@".getcmdline()
      execute ":'<,'>normal @".nr2char(getchar())
    endfunction
"}}}
