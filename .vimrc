let $LANG='en_US.UTF-8'
"" texのconcealを無効化（#^ω^）
let g:tex_conceal=''

nnoremap Y y$

tnoremap <C-j> <C-\><C-n>
tnoremap <C-[> <C-\><C-n>

" nmap <C-j> :bp<CR>
" nmap <C-k> :bn<CR>

set inccommand=split

"set guicursor=a:blinkon0
set linespace=1
set cmdheight=2
set display=lastline
set pumheight=10
set number
set laststatus=2

" set iminsert=0 imsearch=0
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
set clipboard=unnamed,unnamedplus
set showmatch
set matchtime=1
set nobackup
set noswapfile
set viminfo=
set scrolloff=5
set wildmenu
set virtualedit=block

"検索語が画面の真ん中に来るようにする
nmap n nzz 
nmap N Nzz 
nmap * *zz 
nmap # #zz 
nmap g* g*zz 
nmap g# g#zz

let mapleader = "\<Space>"

inoremap <silent> jj <ESC>

" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd

" 見た目系
" 行末の1文字先までカーソルを移動できるように
set virtualedit+=onemore
" インデントはスマートインデント
set smartindent
" ビープ音を可視化
set visualbell
" コマンドラインの補完
set wildmode=list:longest
" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk

" 検索系
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch
nmap <Esc><Esc> :nohlsearch<CR><Esc>


inoremap <C-f> <Right>
inoremap <C-b> <Left>

set completeopt=menuone

call plug#begin()

" 
Plug 'machakann/vim-highlightedyank'
" highlightedyank
let g:highlightedyank_highlight_duration = 500
let g:highlightedyank_max_lines = 1000
let g:highlightedyank_timeout = 500

" vim-surround
Plug 'machakann/vim-sandwich'

" f拡張
Plug 'rhysd/clever-f.vim'
let g:clever_f_ignore_case = 1
let g:clever_f_smart_case = 1
let g:clever_f_use_migemo = 1
let g:clever_f_across_no_line = 1
let g:clever_f_fix_key_direction = 1
let g:clever_f_chars_match_any_signs = ';'

Plug 'haya14busa/vim-edgemotion'
map <Leader>n <Plug>(edgemotion-j)
map <Leader>N <Plug>(edgemotion-k)

Plug 'vim-scripts/ReplaceWithRegister'

" テキストオブジェクト拡張
Plug 'wellle/targets.vim'

" カーソル位置の単語で検索
Plug 'thinca/vim-visualstar'

" *
Plug 'thinca/vim-visualstar'
let g:asterisk#keeppos = 1
map g* <Plug>(asterisk-z*)
map g# <Plug>(asterisk-z#)
map * <Plug>(asterisk-gz*)

" yankring
Plug 'bfredl/nvim-miniyank'
map p <Plug>(miniyank-autoput)
map P <Plug>(miniyank-autoPut)
map <leader>p <Plug>(miniyank-startput)
map <leader>P <Plug>(miniyank-startPut)
map <Leader>n <Plug>(miniyank-cycle)
map <Leader>N <Plug>(miniyank-cycleback)

" VSCode
if exists('g:vscode')
  Plug 'asvetliakov/vim-easymotion'
  nmap <Leader>s <Plug>(easymotion-s2)
  nmap <Leader>j <Plug>(easymotion-j)
  nmap <Leader>k <Plug>(easymotion-k)
else
  " カラースキーム
  Plug 'cocopon/pgmnt.vim'
  Plug 'cocopon/iceberg.vim'

  " 括弧の補完
  Plug 'cohama/lexima.vim'

  " Ctrl-E
  Plug 'simeji/winresizer'

  Plug 'itchyny/lightline.vim'
  let g:lightline = {
        \ 'colorscheme': 'iceberg'
        \ }

  Plug 'easymotion/vim-easymotion'
  nmap <Leader>s <Plug>(easymotion-overwin-f2)
  nmap <Leader>j <Plug>(easymotion-j)
  nmap <Leader>k <Plug>(easymotion-k)

  " comment
  Plug 'tomtom/tcomment_vim'

  " ファイルツリー
  Plug 'lambdalisue/fern.vim'

  " fzf
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  " fzf settings
  let $FZF_DEFAULT_OPTS="--layout=reverse"
  " let $FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!.git/**'"
  let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'border': 'sharp' } }

  nnoremap <silent> <leader>f :Files<CR>
  nnoremap <silent> <leader>g :GFiles<CR>
  nnoremap <silent> <leader>G :GFiles?<CR>
  nnoremap <silent> <leader>b :Buffers<CR>
  nnoremap <silent> <leader>h :History<CR>
  nnoremap <silent> <leader>r :Rg<CR> nnoremap <C-n> :Fern . -reveal=% -drawer -toggle -width=40<CR>

  " coc.nvim
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
  nmap <silent> [g <Plug>(coc-diagnostic-prev)
  nmap <silent> ]g <Plug>(coc-diagnostic-next)

  " GoTo code navigation.
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)
  " Symbol renaming.
  nmap <leader>rn <Plug>(coc-rename)

  " Formatting selected code.
  xmap <leader>F  <Plug>(coc-format-selected)
  nmap <leader>F  <Plug>(coc-format-selected)

endif
call plug#end()

if exists('g:vscode')
  " comment
  xmap gc  <Plug>VSCodeCommentary
  nmap gc  <Plug>VSCodeCommentary
  omap gc  <Plug>VSCodeCommentary
  nmap gcc <Plug>VSCodeCommentaryLine

  " tab移動
  nmap <C-h> <cmd>call VSCodeNotify('workbench.action.previousEditor')<cr>
  nmap <C-l> <cmd>call VSCodeNotify('workbench.action.nextEditor')<cr>
else
  colorscheme iceberg
endif

