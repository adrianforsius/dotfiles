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
    call vundle#end()
    "Add bundle ctrlp to runtimepath for .vim to find plugin
    "call pathogen#infect()
"}}}

"VIm general {{{
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
    "Set faster ESC
    inoremap <leader>. <esc>
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
    nnoremap <leader>s :mksession<cr>
    "Future ag-search
    nnoremap <leader>a :Ag
    nnoremap <leader>W :match Error /\v\s+$/<cr>
    nnoremap <leader>w :%s/\v\s+$//<cr>
    nnoremap <leader>g :execute "grep -R ". shellescape("<cWORD>") . " ."<cr>
    " Easier go to file
    nnoremap <leader>m :cd /cygdrive/c/shortcuts/
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

"VIm disable for learning {{{
    "disable arrow keys
    noremap <up> <nop>
    noremap <down> <nop>
    noremap <left> <nop>
    noremap <right> <nop>
    inoremap <up> <nop>
    inoremap <down> <nop>
    " Simplifying windo movement
    noremap <C-h> <C-w>h
    noremap <C-j> <C-w>j
    noremap <C-k> <C-w>k
    noremap <C-l> <C-w>l
    "Always search in very magic mode
    nnoremap / /\v
    vnoremap / /\v

"}}}

"VIm disable for learning {{{
    "disable arrow keys
    noremap <up> <nop>
    noremap <down> <nop>
    noremap <left> <nop>
    noremap <right> <nop>
    inoremap <up> <nop>
    inoremap <down> <nop>
    inoremap <left> <nop>
    inoremap <right> <nop>
"}}}

"Color/Theme {{{
    "Enable colorscheme
    syntax on
    set background=dark
    colorscheme molokai
    set t_Co=256
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

"Statusline {{{
    "first, enable status line always
    set laststatus =2
    set statusline =
    set statusline +=\ %n\ %*            "buffer number
    set statusline +=%{&ff}%*            "file format
    set statusline +=%y%*                "file type
    set statusline +=\ %{''.(&fenc!=''?&fenc:&enc).''} "Fle encoding
    set statusline +=\ %<%F%*            "full path
    set statusline +=%m%*                "modified flag
    set statusline +=%=%5l%*             "current line
    set statusline +=/%L%*               "total lines
    set statusline +=%4v\ %*             "virtual column number
    set statusline +=*0x%04B\ %*          "character under cursor
    hi statusline guibg=DarkRed ctermfg=2 guifg=Black ctermbg=0
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
        map  ctrl-; <Plug>(easymotion-sn)
        onoremap ctrl-; <Plug>(easymotion-tn)
    "}}}
    "ctrlP {{{
        "CtrlP settings
        let g:ctrlp_match_window = 'bottom, order:ttb'
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
    augroup vim_util
        autocmd!
        autocmd BufWritePost .vimrc,_vimrc,vimrmrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
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
