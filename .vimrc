
" {{{ SETARI DE BAZA
" BASIC SETUP:

" so % seteaza vim

" Pliez codul
" z-c inchide si z-o deschide
set foldmethod=marker

" enter the current millenium
set nocompatible
" enable syntax and plugins (for netrw)
syntax enable
filetype plugin on

let mapleader = " "

set encoding=utf-8
set number
set relativenumber
set expandtab
set tabstop=2                            
set mouse=a
set softtabstop=2
set shiftwidth=2

" Colorscheme
" colors: lunaperche koehler pablo ron torte 
" colorscheme koehler
" colorscheme koehler

" open vimrc 

noremap <C-w> :tabnew $MYVIMRC<cr>

noremap <C-q> :source $MYVIMRC<cr>

" }}}

" {{{Copy-Paste
" apt install termux-api
" Clipboard
vnoremap <C-x> :!termux-clipboard-set<CR>
vnoremap <C-c> :w !termux-clipboard-set<CR><CR>
inoremap <C-v> <ESC>:read !termux-clipboard-get<CR>i

" }}}

" {{{ FINDING FILES:
 
" Cauta mai adinc in mape
set path+=**

" Arata variantele posibile
set wildmenu

" NOW WE CAN:
" - apasam tab dupa :find pentru cautare partiala
" - folosim * pentru cautare neclara

" THINGS TO CONSIDER:
" - :ls arata fisierele din bufer
" - :b folosesc penrtu a completa din bufer

" folosesc tree pentru a vizualiza mapa
" tree -I node_modules

" Ignor node_modules
set wildignore+=*/node_modules/*

" }}}

" {{{ FILE BROWSING:

" ,e = :Explore
nmap <silent> ,e :Explore<CR>

" scimb \ in , ( leader )
" noremap \ ,
" let mapleader=","

" Tweaks for browsing
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=0  " open in prior window
" let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=4     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" NOW WE CAN:
" - :edit a folder to open a file browser
" - <CR>/v/t to open in an h-split/v-split/tab
" - check |netrw-browse-maps| for more mappings
" }}}

"{{{ Salt la Tag:

" apt install ctags
" creaza fisierul tags
command! MakeTags !ctags -R --exclude=node_modules --exclude=.git --exclude=tests

" NOW WE CAN:
" - apas ^] pentru a sari la tag sub cursor
" - apad g^] lista de taguri
" - apas ^t pentru a sari innapoi sau foaia tags
" }}}

" {{{ AUTOCOMPLETE:

" The good stuff is documented in |ins-completion|

" HIGHLIGHTS:
" - ^x^n cuvinte din acestt fisier
" - ^x^f calea catre fisier
" - ^x^] taguri
" - ^n din dictionar, bufer si fisier

" NOW WE CAN:
" - folosec ^n si ^p pentru miscare innainte si innapoi

" }}}

" {{{ SNIPPETS:

" In aceste fisiere sun sabloane (cod standart )
"
" nnoremap ,html :-1read $HOME/.vim/.skeleton.html<CR>3jwf>a
nnoremap ,ht :-1read $HOME/.vim/snipets/html/skelet.html<CR>9ji
nnoremap ,rfc :-1read $HOME/.vim/snipets/javascript/react/RFC.js<CR>5jlla
nnoremap ,rrc :-1read $HOME/.vim/snipets/javascript/react/RSC.js<CR>5jlla
nnoremap ,vco :-1read $HOME/.vim/snipets/javascript/vue/VCO.html<CR>ja
nnoremap ,vcc :-1read $HOME/.vim/snipets/javascript/vue/VCC.html<CR>ja

" }}}

" {{{ Plughinuri: =

call plug#begin('~/.vim/vimplugin')

" Emmet (<C-y>,)
Plug 'mattn/emmet-vim'

" coc for tslinting, auto complete and prettier

Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'npm install --f roze n-lockfile'}

" React JSX syntax
Plug 'yuezk/vim-js'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'

" Vue syntax
" Plug 'posva/vim-vue'
Plug 'storyn26383/vim-vue'

" Nerd Tree
Plug 'scrooloose/nerdtree'

" Golang
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Astrojs
Plug 'wuelnerdotexe/vim-astro'

" MDX
Plug 'jxnblk/vim-mdx-js'

" Svelte HIGHLIGHTS
Plug 'leafOfTree/vim-svelte-plugin'

" VimWiki Plugin
Plug 'vimwiki/vimwiki'

" Vim-Ripgrep caut fisiere
Plug 'jremmen/vim-ripgrep'

" post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install --frozen-lockfile --production',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }

"Buffer Navigation
Plug 'mihaifm/bufstop'

" Auto Pairs
Plug 'jiangmiao/auto-pairs'

" Fuzi Finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'wookayin/fzf-ripgrep.vim'

" Blade PHP
Plug 'jwalton512/vim-blade'

call plug#end()


" }}}

" {{{ Setari Plughinuri:


"------------------------ COC ------------------------
" coc extensions
let g:coc_global_extensions = [ 'coc-tslint-plugin', 'coc-tsserver', 'coc-emmet', 'coc-css', 'coc-html', 'coc-snippets', 'coc-json', 'coc-yank', 'coc-eslint', 'coc-pyright', 'coc-java', 'coc-go', 'coc-angular', 'coc-clangd', '@yaegassy/coc-tailwindcss3', '@yaegassy/coc-volar', 'coc-svelte', 'coc-sumneko-lua', 'coc-phpls', 'coc-blade', 'coc-htmldjango']

" enter = select
inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

" Keymap Coc
" comenzi disponibile
nmap <leader>ac  <Plug>(coc-codeaction)
" indrept rapid
nmap <leader>qf  <Plug>(coc-fix-current)
" unde e definita
nmap <silent> gd <Plug>(coc-definition) 
" tipuri
nmap <silent> gy <Plug>(coc-type-definition)
" unde e implementata
nmap <silent> gi <Plug>(coc-implementation)
" unde e utilizata
nmap <silent> gr <Plug>(coc-references) 

"------------------------ COC ------------------------

" hi PmenuSbar ctermbg=4 guibg=Grey
" hi Pmenu ctermbg=242 ctermfg=12
" hi Pmenu  ctermbg=1 ctermfg=12
"
" hi Pmenu  ctermbg=1
" hi CocErrorFloat ctermbg=1
" hi CocWarningFloat ctermbg=1

set notermguicolors

hi Pmenu ctermbg=1
hi PmenuThumb ctermbg=1
hi CocFloatThumb ctermbg=1
hi CocErrorFloat ctermbg=1
hi CocWarningFloat ctermbg=1
hi StatusLine ctermfg=4
hi StatusLineNC ctermfg=4
hi TabLine ctermbg=4
hi TabLineSel ctermbg=14 ctermfg=1
hi TabLineFill ctermfg=4 ctermbg=1
hi IncSearch ctermfg=4


let g:fzf_colors =
\ { 'fg': ['fg', 'Normal'],
\ 'bg': ['bg', 'Normal'],
\ 'hl': ['fg', 'Comment'],
\ 'fg+': ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
\ 'bg+': ['bg', 'CursorLine', 'CursorColumn'],
\ 'hl+': ['fg', 'Statement'],
\ 'info': ['fg', 'PreProc'],
\ 'border': ['fg', 'Ignore'],
\ 'prompt': ['fg', 'Conditional'],
\ 'pointer': ['fg', 'Exception'],
\ 'marker': ['fg', 'Keyword'],
\ 'spinner': ['fg', 'Label'],
\ 'header': ['fg', 'Comment'] }




" enable typescyipt in astro
let g:astro_typescript = 'enable'
" let g:astro_stylus = 'enable'

" NERDTree
nnoremap <C-n> :NERDTreeToggle<CR>

" Buffers navigation
map <leader>b :Bufstop<CR> "get a visual on the buffers
map <leader>w :BufstopPreview<CR> " switch files by moving inside the window
map <leader>a :BufstopModeFast<CR> " a command for quick switching
map <leader>h :BufstopBack<CR>
map <leader>l :BufstopForward<CR>
let g:BufstopAutoSpeedToggle = 1       

" Moving lines
nnoremap <S-j> :m .+1<CR>==
nnoremap <S-k> :m .-2<CR>==
vnoremap <S-j> :m '>+1<CR>gv=gv
vnoremap <S-k> :m '<-2<CR>gv=gv

" Fzf maps
map <Leader>ff :Files<CR>
map <Leader>fb :BLines<CR>
map <Leader>fa :Rg<CR>
let $FZF_DEFAULT_COMMAND='fd --type f'

" }}}


