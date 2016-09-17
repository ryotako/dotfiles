" start up {{{1
" for Japanese comments
set encoding=utf-8
scriptencoding utf-8
" vimrc専用augroupの作成と初期化
augroup vimrc
  autocmd!
augroup END
" 古いvimではvimrcを読まない
if v:version < 700
  echoerr 'This _vimrc requires Vim 7 or later.'
  quit
endif
set guioptions+=M " メニューを表示しない. syntax on, filetype onより前に書く
" }}}1

" NeoBundle {{{1
" neobundle begin{{{2
if has('vim_starting')
  if &compatible
    set nocompatible
  endif
  set runtimepath+=$HOME/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

" Shougo-ware {{{2
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'Shougo/vimshell.vim'
NeoBundle 'Shougo/vimproc.vim'

" unite source {{{2
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/neoyank.vim'
NeoBundle 'Shougo/unite-help'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'haya14busa/unite-reading-vimrc'
NeoBundle 'osyo-manga/unite-fold'
NeoBundle 'osyo-manga/unite-qfixhowm'
NeoBundle 'osyo-manga/unite-highlight'
NeoBundle 'rhysd/unite-codic.vim'
NeoBundle 'tacroe/unite-mark'
NeoBundle 'thinca/vim-unite-history'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'ujihisa/unite-font'
NeoBundle 'lambdalisue/unite-linephrase'
NeoBundle 'sorah/unite-ghq'

" neocomplete source
NeoBundle 'Shougo/neco-vim'
NeoBundle 'Shougo/neco-syntax'
NeoBundle 'ujihisa/neco-look'

" extend basic vim commands {{{2
NeoBundle 'Konfekt/FastFold'          " neocompleteしながら折畳みするために
NeoBundle 'LeafCage/foldCC.vim'       " 見やすい折りたたみ表示
NeoBundle 'LeafCage/yankround.vim'    " ヤンク履歴を管理
NeoBundle 'easymotion/vim-easymotion' " 4ストローク以内で移動
NeoBundle 'haya14busa/incsearch.vim'  " 検索中に対象をハイライト
NeoBundle 'itchyny/lightline.vim'     " ステータスライン拡張
NeoBundle 'kana/vim-niceblock'        " ビジュアルモードのI,Aの挙動を矩形選択に
NeoBundle 'kana/vim-submode'          " 連打を便利に
NeoBundle 'osyo-manga/vim-anzu'       " 検索の一致件数を取得
NeoBundle 'osyo-manga/vim-brightest'  " カーソル下と同じ単語をハイライト
NeoBundle 'osyo-manga/vim-over'       " 置換対象をハイライト
NeoBundle 'rhysd/clever-f.vim'        " fの検索後，f連打で次の一致箇所へ
NeoBundle 'sjl/gundo.vim'             " undo履歴の可視化
NeoBundle 'terryma/vim-expand-region' " 選択範囲の拡大・縮小
NeoBundle 'thinca/vim-visualstar'     " ビジュアル選択した文字列を検索
NeoBundle 'tpope/vim-repeat'          " 動作をリピート可能にする機構を提供
NeoBundle 'vim-jp/vimdoc-ja'          " 日本語ヘルプ

" operator {{{2
NeoBundle 'kana/vim-operator-user'         " operator自作のための機構
NeoBundle 'thinca/vim-operator-sequence'   " 複数operatorの統合

NeoBundle 'haya14busa/vim-operator-flashy' " y: ヤンクを可視化
NeoBundle 'kana/vim-operator-replace'      " S: レジスタから貼付け
NeoBundle 'tyru/operator-camelize.vim'     " _: キャメル・スネークケース入替え

" text object {{{2
" builtin w, W, s, p, [, ], (,), <, >, {, }, ", ', `
" replace q('), d(")
" vimtex  e, d, c, $, m(math, m=$)
NeoBundle 'kana/vim-textobj-user'             " textob自作のための機構

NeoBundle 'kana/vim-textobj-entire'           " a: 全て (all, e -> environment)
NeoBundle 'osyo-manga/vim-textobj-multiblock' " b: 囲まれた範囲
NeoBundle 'kana/vim-textobj-fold'             " z: 折畳みの範囲
NeoBundle 'kana/vim-textobj-indent'           " i: 字下げの範囲
NeoBundle 'kana/vim-textobj-line'             " l: 行
NeoBundle 'h1mesuke/textobj-wiw'              " v: スネークケースの一部 (v+v=w)
NeoBundle 'mattn/vim-textobj-url'             " u: URL
NeoBundle 'thinca/vim-textobj-comment'        " /: コメント

" scripting {{{2
NeoBundle 'cohama/lexima.vim'         " 対括弧補完
NeoBundle 'LeafCage/vimhelpgenerator' " vimプラグインヘルプ生成
NeoBundle 'junegunn/vim-easy-align'   " 位置揃え
NeoBundle 'koron/codic-vim'           " プログラマ向け辞書
NeoBundle 'tpope/vim-commentary'      " quasi-operator gc: comment/uncomment line
NeoBundle 'tpope/vim-surround'        " quasi-textobj  s:  change/delete surroundings

NeoBundle 'thinca/vim-prettyprint'
NeoBundle 'tyru/capture.vim'

" external tools {{{2
" git
NeoBundle 'tpope/vim-fugitive' " vimからgit
NeoBundle 'cohama/agit.vim'    " commit履歴を可視化
NeoBundle 'mattn/gist-vim'     " gistにアクセス
NeoBundle 'mattn/webapi-vim'   " gist-vimのために必要


" language support {{{2
" markdown
NeoBundle 'plasticboy/vim-markdown'
" go
NeoBundle 'fatih/vim-go'
" tex
NeoBundle 'lervag/vimtex'
" NeoBundle 'termoshtt/unite-bibtex'

" memo {{{2
NeoBundle 'fuenor/qfixgrep'
NeoBundle 'fuenor/qfixhowm'
NeoBundle 'glidenote/memolist.vim'

" colorscheme {{{2
NeoBundle 'cocopon/iceberg.vim'        " 黒地青基調．
NeoBundle 'popkirby/lightline-iceberg' " lightlineのiceberg
" NeoBundle 'itchyny/landscape.vim'      " qf, quickrun, unite, vimfiler, vimshellの色設定
NeoBundle 'flazz/vim-colorschemes'

" others {{{2
NeoBundle 'leseixas/quantum_espresso-vim'
NeoBundle 'benjifisher/Vim-Plugin-for-Drupal'
NeoBundle 'mhaig/vim-blockdiag-series'
NeoBundle 'AndrewRadev/switch.vim'

" my plugins
NeoBundle 'ryotako/unite-latex-package',
      \{"base" : "~/.vim/plugins","type" : "nosync" }
NeoBundle "ryotako/vim-incline",
      \{"base" : "~/.vim/plugins","type" : "nosync" }

" neobundle end{{{2
call neobundle#end()
filetype plugin indent on
syntax on
NeoBundleCheck
"}}}1

" Basic {{{1

" 文字コード・日本語入力等
set encoding=utf-8
set fileencodings=cp932,sjis,euc-jp,utf-8
set fileformat=unix   " 改行コードを<LF>に
set spelllang=en,cjk  " アジア圏言語をスペルミス判定しない
set formatoptions=q   " 勝手に改行させない
set ambiwidth=double  " 文字幅が判別できない時は全角扱い
set display+=lastline " 長い行を省略しない

" 自動生成されるファイルの設定
set swapfile     " swpファイル(未保存の変更内容)の作成の有無
set backup       " ~ファイル(一世代前のファイル)の作成の有無
set undofile     " un~ファイル(undo履歴ファイル)の作成の有無
set directory-=. " その場に作るのはやめる
let &undodir   = &directory
let &backupdir = &directory

" パス関連
set shellslash              " Windowsでもパスの区切りを/とする
set runtimepath+=$HOME/.vim " ~/.vimにパスを通す

" 見た目の設定
set cmdheight=1       " コマンド行の行数
set cursorline        " 現在行のハイライト
set diffopt+=vertical " diffは左右に並べる
set foldcolumn=2      " fold情報表示列の幅
set foldlevel=99      " 勝手に閉じない
set foldlevelstart=99 " 編集開始時には全て開く
set laststatus=2      " 常にステータス行を表示
set lazyredraw        " 直接実行したコマンドでない場合再描画しない
set matchtime=1       " 対応括弧表示時間(サブ秒)
set nolist            " 不可視文字は不可視
set number            " 行番号を表示
set showmatch         " 対応括弧表示
set showtabline=2     " 常にタブ行を表示
set splitbelow        " ウィンドウは下に分割
set splitright        " ウィンドウは右に分割
set wildmenu          " ステータスラインに補完候補を並べる
set wrap              " 長い行の折り返し
set colorcolumn=+1
set textwidth=80
set listchars=tab:>-,trail:-

" インデントの設定
set expandtab         " タブを入力時に空白に展開
set tabstop=2         " タブの表示幅
set shiftwidth=2      " 自動インデントが挿入するタブ幅
set softtabstop=2     " 連続した空白をカーソルで移動する際の移動幅
set autoindent        " 改行時にインデントを継続
set smartindent       " 入力内容に合わせたインデントの増減
set breakindent       " wrapした文章もインデントして表示
set formatoptions-=ro " 改行時にコメントアウトしない設定 oによる挿入は別

" カーソル移動等
set backspace=indent,eol,start " 行をまたぐバックスペースを有効化
set mouse=a                    " すべてのモードでマウスを有効化
set ttymouse=xterm2            " マウスの種類
set clipboard=unnamed          " クリップボードを使用
set virtualedit=block          " 矩形選択で文字のない箇所にカーソル移動可

" 検索関連
set ignorecase " 大文字小文字を区別しない
set smartcase  " ただし大文字が入力された場合は区別する
set incsearch  " 検索文字列が入力途中の段階から検索
set hlsearch   " 検索文字列のハイライト

" カラースキーム & lightline
let s:cui_colorscheme = 'stonewashed-256'
let s:gui_colorscheme = 'stonewashed-gui'
let s:lightline_color = 'solarized'

let s:scheme = has('gui_running') && len(s:gui_colorscheme) 
      \ ? s:gui_colorscheme : s:cui_colorscheme
execute 'colorscheme '.s:scheme
execute 'autocmd vimrc GUIEnter * nested set t_Co=256 | colorscheme '.s:scheme
let g:lightline = {'colorscheme' : s:lightline_color}
let g:lightline.component = {'lineinfo': '%3l[%L]:%-2v'}

" その他
set modeline          " コメントでvimに指示を出す
set notimeout         " タイムアウトを無効
set hidden            " quit時にバッファを削除せず，隠す
" set confirm           " 変更されたバッファがあるとき，確認
set switchbuf=useopen " すでに開いているバッファがあれば，それを開く
set keywordprg=:help  " K は:! manではなく:help
" }}}

" Key Mapping {{{
" ホームポジションからコマンド開始
noremap : ;
noremap ; :

" D,Cとの整合性
nnoremap Y y$

" <C-s>で保存, <C-q>で閉じる
noremap  <C-s> :<C-u>w<CR>
inoremap <C-s> <ESC>:<C-u>w<CR>a
noremap  <C-q> :<C-u>quit<CR>
command! Q :q!

" エスケープ系
" jj, <C-j>の両方を<ESC>の代用に設定．<ESC>連打でnohlsearch
noremap  <C-j> <ESC>
inoremap <C-j> <ESC>
inoremap jj    <ESC>
nnoremap <ESC><ESC> :nohlsearch<CR>
nnoremap <C-j><C-j> :nohlsearch<CR>

" 表示行で移動
noremap  j      gj
noremap  k      gk
noremap  <DOWN> gj
noremap  <UP>   gk
inoremap <DOWN> <ESC>gja
inoremap <UP>   <ESC>gka

" インデント変更の連続実行
" ドットリピートでもできるが，これは選択された状態が持続する
vnoremap < <gv
vnoremap > >gv


" 行挿入
" nnoremap o o <C-u>
" nnoremap O O <C-u>




" Ctrlとの同時押しでノーマルモードで改行・削除
noremap  <C-CR> i<CR><ESC>
noremap  <C-BS> i<BS><ESC>

" 設定のトグル
nnoremap t <Nop>
nnoremap <expr> th <SID>ToggleOption('hlsearch', '', [])
nnoremap <expr> tl <SID>ToggleOption('list',     '', [])
nnoremap <expr> tn <SID>ToggleOption('number',   '', [])
nnoremap <expr> ts <SID>ToggleOption('spell',    '', [])
nnoremap <expr> tw <SID>ToggleOption('wrap',     '', [])
      \. (&wrap == 'wrap') ? '^' : ''
nnoremap <expr> tf <SID>ToggleOption('foldmethod','f'
      \,['manual','indent','expr','marker','syntax','diff'])
nnoremap tb :<C-u>BrightestToggle<CR>

" keyを指定すると最初の呼び出しで変更を行わず，key連打で変更を繰り返す．
function! s:ToggleOption(option,key,list) "{{{
  if strlen(a:key)
    execute 'setl '.a:option.'?'
    let input=nr2char(getchar())
  endif
  while strlen(a:key) == 0 || input ==# a:key
    if len(a:list)
      execute "let current = &".a:option
      let i = index(a:list,current)+1
      let i = i>=len(a:list) ? 0 : i
      execute 'setl '.a:option.'='.a:list[i]
    else
      execute 'setl '.a:option.'!'
    endif
    redraw
    execute 'setl '.a:option.'?'
    if strlen(a:key) == 0
      return ''
    endif
    let input=nr2char(getchar())
  endwhile
  echo ''
  return input
endfunction "}}}

" 全文置換
" 置換を即実行するものは，ジャンプリストでもとの場所に戻る．
noremap tr :%s//ge<left><left><left>
noremap tY :%s/\\/¥/ge<CR><C-o>
noremap t$ :%s/\v +$//ge<CR>:nohlsearch<CR><C-o>

" ヘルプ
command! -nargs=1 -complete=help H call <SID>my_help(<f-args>)
function! s:my_help(str)
  exe (expand('%') =~# '.vimrc' ? 'vert' : 'tab') . ' help '.a:str
endfunction
" :h が画面分割でヘルプを開くのに対して, :H で別タブでヘルプを開く
" ただし.vimrc編集中は縦分割で開く

" エンコード指定で開き直す
command! -nargs=1 -complete=customlist,<SID>myencoding
      \ Enc call <SID>reencode(<f-args>)
function! s:reencode(enc)
  execute 'edit ++enc='.a:enc
endfunction
function! s:myencoding(A,L,P)
  return filter(split(&fileencodings,','),'v:val =~? "'.a:A.'"' )
endfunction

" 誤使用防止
nnoremap q <Nop>
nnoremap Q q

" 設定ファイルへの簡易アクセス
noremap ,v :<C-u>tabedit $HOME/.vimrc<CR>
noremap ,g :<C-u>tabedit $HOME/.gitconfig<CR>
noremap ,s :<C-u>NeoSnippetEdit -split<CR>
noremap ,z :<C-u>tabedit $HOME/.zshrc<CR>

" 編集後に設定を反映 (nestedはlightlineのために必要)
autocmd vimrc BufWritePost *vimrc  nested source $MYVIMRC
autocmd vimrc BufWritePost *gvimrc nested source $MYGVIMRC

"}}}

" Plugin Setting {{{1
" unite {{{2
nnoremap [unite] <Nop>
nmap <Space>u [unite]
nnoremap <silent> [unite]r :<C-u>UniteResume <CR>
nnoremap <silent> [unite]f :<C-u>UniteWithBufferDir -silent -no-start-insert file <CR>
nnoremap <silent> [unite]b :<C-u>Unite -silent -no-start-insert buffer   file_mru      <CR>
nnoremap <silent> [unite]d :<C-u>Unite -silent -no-start-insert bookmark directory_mru <CR>
nnoremap <silent> [unite]c :<C-u>Unite -silent -start-insert codic   <CR>
nnoremap <silent> [unite]h :<C-u>Unite -silent -start-insert help    <CR>
nnoremap <silent> [unite]l :<C-u>Unite -silent -start-insert line    <CR>
nnoremap <silent> [unite]m :<C-u>Unite -silent -start-insert mapping <CR>
nnoremap <silent> [unite]u :<C-u>Unite -silent -start-insert source  <CR>
nnoremap <silent> [unite]q :<C-u>Unite -silent -start-insert qfixhowm/new qfixhowm <CR>
nnoremap <silent> [unite]n :<C-u>Unite -silent -start-insert memolist/new memolist/grep memolist<CR>
nnoremap <silent> [unite]N :<C-u>Unite -silent -start-insert memolist/new qfixhowm/new
nnoremap <silent> [unite]y :<C-u>Unite -silent -start-insert history/yank <CR>
nnoremap <silent> [unite]g :<C-u>Unite -silent -no-start-insert -vertical -winwidth=12 menu:git<CR>
nnoremap <silent> [unite]G :<C-u>call <SID>my_unite_giti()<CR>
nnoremap <silent> [unite]z :<C-u>Unite -silent -no-start-insert -vertical -winwidth=40 fold <CR>
nnoremap <silent> [unite]o :<C-u>Unite -silent -no-start-insert -vertical -winwidth=40 outline mark <CR>
nnoremap <silent><expr> [unite]C <SID>WanderUniteColorScheme()
nnoremap <silent> [unite]F :<C-u>Unite -auto-preview -vertical -winwidth=40 font <CR>

" カラースキーム一覧のランダムな位置に移動
function! s:WanderUniteColorScheme()
  " 乱数生成
  let max_num   = 735
  let match_end = matchend(reltimestr(reltime()), '\d\+\.') + 1
  let rand      = reltimestr(reltime())[match_end : ] % (max_num + 1)
  " Gを挟んで一度最後まで描画させる
  return ":\<C-u>Unite -auto-preview -no-start-insert 
        \ -vertical -winwidth=40  colorscheme\<CR>
        \G:".rand."\<CR>"
endfunction

cabbrev U Unite
" unite系変数の初期化
if !exists("g:unite_source_alias_aliases")
  let g:unite_source_alias_aliases = {}
endif
if !exists("g:unite_source_menu_menus")
  let g:unite_source_menu_menus = {}
endif

autocmd vimrc FileType unite call s:my_unite_setting()
function! s:my_unite_setting() "{{{
  call unite#custom#profile('default','context',{'prompt':'>'})
endfunction "}}}

" complete (neocomplete / neosnippet) {{{2
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_camel_case = 1
let g:neocomplete#enable_fuzzy_completion = 1
let g:neosnippet#snippets_directory = expand('~/.vim/snippets')
imap <C-k>  <Plug>(neosnippet_expand_or_jump)
smap <C-k>  <Plug>(neosnippet_expand_or_jump)
xmap <C-k>  <Plug>(neosnippet_expand_target)
smap <expr> <TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
if has ('conceal')
  set conceallevel=2 concealcursor=niv
endif
let g:neosnippet#enable_conceal_markers = 0

" utility (vimfiler / vimshell) {{{2
nnoremap <Space>f :<C-u>VimFilerBufferDir -explorer<CR>
nnoremap <Space>F :<C-u>VimFilerBufferDir<CR>
nnoremap <Space>; :<C-u>VimShellBufferDir -popup<CR>
nnoremap <Space>: :<C-u>VimShellBufferDir<CR>
let g:vimfiler_as_default_explorer  = 1
let g:vimfiler_safe_mode_by_default = 0
let g:vimshell_vimshrc_path = expand('~/.vimshrc')
" let g:vimshell_prompt_expr = 'escape(fnamemodify(getcwd(), ":~").">", "\\[]()?! ")." "'
" let g:vimshell_prompt_pattern = '^\%(\f\|\\.\)\+> '
" prompt from haya14busa's vimrc
let g:vimshell_prompt = "% "
let g:vimshell_secondary_prompt = "> "
let g:vimshell_user_prompt = 'getcwd()'

autocmd vimrc FileType vimshell call s:my_vimshell_setting()
function! s:my_vimshell_setting() "{{{
  call vimshell#set_alias('c','clear')
  call vimshell#set_alias('w','which')
  call vimshell#set_alias('t','type')
  call vimshell#set_alias('q','exit')
endfunction "}}}

autocmd vimrc FileType vimfiler call s:my_vimfiler_setting()
function! s:my_vimfiler_setting() "{{{
  nmap <buffer> i     <plug>(vimfiler_set_current_mask)
  nmap <buffer> <TAB> <plug>(vimfiler_choose_action)
  nnoremap <silent><buffer><expr> b vimfiler#do_action('bookmark')
endfunction "}}}

" align (easyalign) {{{2
vmap     <CR>    <Plug>(EasyAlign)*
vmap     <Space> <Plug>(EasyAlign)*
vnoremap <tab>   :sort<CR>

" search (incsearch / anzu / visualstar / over / brightest) {{{2
let g:incsearch#auto_nohlsearch = 1
nnoremap <Space>/ /
map  /  <Plug>(incsearch-forward)
map  ?  <Plug>(incsearch-backward)
map  g/ <Plug>(incsearch-stay)
nmap n  <Plug>(incsearch-nohl)<plug>(anzu-n-with-echo)
nmap N  <Plug>(incsearch-nohl)<plug>(anzu-N-with-echo)
map  *  <Plug>(incsearch-nohl-*)
map  #  <Plug>(incsearch-nohl-#)
map  g* <Plug>(incsearch-nohl-g*)
map  g# <Plug>(incsearch-nohl-g#)
vmap *  <plug>(visualstar-*)
nnoremap gs :<C-u>OverCommandLine<CR>%s/
xnoremap gs :OverCommandLine<CR>s/
let g:brightest_enable = 0

" window (s-mapping, submode) {{{2
" nnoremap <Up>    <C-w>-
" nnoremap <Down>  <C-w>+
" nnoremap <Right> <C-w>>
" nnoremap <Left>  <C-w><
nnoremap s  <C-w>
nnoremap se <C-w>=
nnoremap ss <C-w>s
nnoremap sv <C-w>v
nnoremap sQ :<C-u>bdelete<CR>
nnoremap st :<C-u>tabnew<CR>
nnoremap tt :<C-u>tabnew<CR>
let g:submode_keep_leaving_key    = 1
let g:submode_always_show_submode = 1
call submode#enter_with('winmove', 'n', '', 'sw', '<C-w>w')
call submode#enter_with('winmove', 'n', '', 'sW', '<C-w>W')
call submode#map       ('winmove', 'n', '', 'w',  '<C-w>w')
call submode#map       ('winmove', 'n', '', 'W',  '<C-w>W')
call submode#enter_with('winseze', 'n', '', 's>', '<c-w>>')
call submode#enter_with('winseze', 'n', '', 's<', '<c-w><')
call submode#enter_with('winseze', 'n', '', 's-', '<c-w>-')
call submode#enter_with('winseze', 'n', '', 's+', '<c-w>+')
call submode#map       ('winseze', 'n', '', '>',  '<c-w>>')
call submode#map       ('winseze', 'n', '', '<',  '<c-w><')
call submode#map       ('winseze', 'n', '', '-',  '<c-w>-')
call submode#map       ('winseze', 'n', '', '+',  '<c-w>+')
call submode#enter_with('tabmove', 'n', '', 'gt', 'gt')
call submode#enter_with('tabmove', 'n', '', 'gT', 'gT')
call submode#map       ('tabmove', 'n', '', 't',  'gt')
call submode#map       ('tabmove', 'n', '', 'T',  'gT')

" yank (flashy / yankround / replace) {{{2

" flashyにtextobj-user製のtextobjを渡すための小細工
let g:operator#flashy#group = 'Visual'
let g:operator#flashy#flash_time = 200
nnoremap <silent> <plug>(sleep) :<C-u>sleep 200m<CR>
nnoremap <expr> y operator#sequence#map("\<Plug>(operator-flashy)","\<plug>(sleep)")
nmap Y  <plug>(operator-flashy)$
nmap yy <plug>(operator-flashy)<Plug>(operator-flashy)

" p連打でyankround. ペーストを繰り返すときはドットリピートする
let g:yankround_use_region_hl = 1
let g:yankround_max_history   = 100
let g:yankround_region_hl_groupname = g:operator#flashy#group
nmap <expr> p  yankround#is_active() ? "\<Plug>(yankround-prev)" : "\<Plug>(yankround-p)"
nmap <expr> P  yankround#is_active() ? "\<Plug>(yankround-next)" : "\<Plug>(yankround-P)"
nmap <expr> gp yankround#is_active() ? "\<Plug>(yankround-prev)" : "\<Plug>(yankround-gp)"
nmap <expr> gP yankround#is_active() ? "\<Plug>(yankround-next)" : "\<Plug>(yankround-gP)"

" Sはccと機能が重複するので潰す
nmap S <Plug>(operator-replace)

" visual select (expand-region)
" v連打で選択範囲を拡大する．visualモードを抜けるときは<ESC>
" expandしていくうちに行単位選択モードになるので，Vを潰しても不便はない．
" <ESC>gvで待ち状態を解除して普通のvisualモードにする．
vmap v <Plug>(expand_region_expand)<Plug>(region_reselect)
vmap V <Plug>(expand_region_shrink)<Plug>(region_reselect)
noremap <expr><Plug>(region_reselect) mode() == 'n' ? '' : "\<ESC>gv"
let g:expand_region_text_objects = {'i]':1,'ib':1,'iB':1,'il':1,'ip':1,'ie':1,}

" undo (gundo) {{{2
let g:gundo_right = 1
let g:gundo_help = 1
let g:gundo_close_on_revert = 1
let g:gundo_preview_height = 10
nnoremap <silent> U :<C-u>GundoToggle<CR>

" fold (foldCC) {{{2
set foldtext=FoldCCtext()

" motion (easymotion) {{{2
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase  = 1
nmap <C-g> <Plug>(easymotion-overwin-f2)

" switch
let g:switch_mapping = ""
let g:switch_custom_definitions =
      \[
      \ { '\v^( *- *)([^ \[].*)$'  : '\1[ ] \2' },
      \ { '\v^( *- *)\[ \](.*)$'   : '\1[x]\2'  },
      \ { '\v^( *- *)\[x\] ?(.*)$' : '\1\2'     },
      \]
" <C-t>の元の機能はタグジャンプ．もっとよいキーはないか
nnoremap <C-t> :Switch<CR>

" operator
map _ <Plug>(operator-camelize-toggle)

" text object (multiblock / wiw / space / cline) {{{2
omap aq a'
omap iq i'
vmap aq a'
vmap iq i'
omap ad a"
omap id i"
vmap ad a"
vmap id i"
omap ib <Plug>(textobj-multiblock-i)
omap ab <Plug>(textobj-multiblock-a)
vmap ib <Plug>(textobj-multiblock-i)
vmap ab <Plug>(textobj-multiblock-a)
let g:textobj_comment_no_default_key_mappings = 1
omap i/ <Plug>(textobj-comment-i)
omap a/ <Plug>(textobj-comment-a)
vmap i/ <Plug>(textobj-comment-i)
vmap a/ <Plug>(textobj-comment-a)
let g:textobj_entire_no_default_key_mappings = 1
omap ia <Plug>(textobj-entire-i)
omap aa <Plug>(textobj-entire-a)
vmap ia <Plug>(textobj-entire-i)
vmap aa <Plug>(textobj-entire-a)
let g:textobj_wiw_no_default_key_mappings = 1
omap iv	<Plug>(textobj-wiw-i)
omap av	<Plug>(textobj-wiw-a)
vmap iv	<Plug>(textobj-wiw-i)
vmap av	<Plug>(textobj-wiw-a)


" git (fugitive, gitv, unite-giti,gist) {{{2
let g:unite_source_menu_menus.git = {"description" : "git command"}
let g:unite_source_menu_menus.git.candidates = [
      \["add/rec", "Git add ." ],
      \["blame",   "Gblame"    ],
      \["commit",  "Gcommit"   ],
      \["init",    "Git init"  ],
      \["diff",    "Git diff"  ],
      \["log",     "Glog"      ],
      \["move",    "Gmove"     ],
      \["read",    "Gread"     ],
      \["status",  "Gstatus"   ],
      \["view",    "Agit"      ],
      \["write",   "Gwrite"    ],
      \]
function! g:unite_source_menu_menus.git.map(key, value)
  let [word, value] = a:value
  return {"word":word,"description":value,
        \"kind":"command","action__command":value}
endfunction
function! s:my_unite_giti() "{{{
  lcd %:h
  if(isdirectory(expand('%:p:h').'/.git'))
    Unite giti/branch
          \ giti/branch/new
          \ giti/config
          \ giti/log
          \ giti/remote
          \ giti/status
  else
    echo 'Not a git repository'
  endif
endfunction "}}}
command! Ginit lcd %:h |
      \!git status 1>/dev/null 2>/dev/null || git init

" golang
exe "set rtp+=".globpath($GOPATH,"src/github.com/nsf/gocode/vim")

" latex (vimtex / unite-bibtex) {{{2
let g:tex_conceal=''
let g:tex_flavor='latex'
let g:vimtex_fold_enabled             = 1 " LaTeX文法による折りたたみを有効
let g:vimtex_fold_manual              = 1 " 自動折りたたみを無効
let g:vimtex_quickfix_open_on_warning = 0 " 警告のみの場合メッセージを表示しない
let g:vimtex_view_general_viewer
      \ = '/Applications/Skim.app/Contents/SharedSupport/displayline'
let g:vimtex_view_general_options = '@line @pdf @tex'

" " key mapping
autocmd vimrc FileType tex map <buffer> <Space> <localleader>
nnoremap <silent> <localleader>lt :<C-u>Unite vimtex_toc<CR>
nnoremap <silent> <localleader>ly :<C-u>Unite vimtex_labels<CR>
" text object (inline math)
omap am <plug>(vimtex-a$)
omap im <plug>(vimtex-i$)
vmap am <plug>(vimtex-a$)
vmap im <plug>(vimtex-i$)

" Howm {{{2
let QFixHowm_Folding     = 0
let HowmHtml_htmldir     = '~/howm_html'
let QFixHowm_Key         = ' '
let QFixWin_EnableMode   = 1
let QFix_UseLocationList = 1
let howm_dir             = '~/howm'
let howm_fileencoding    = 'utf-8'
let howm_fileformat      = 'unix'
let hown_filename        = '%Y/%m/%Y-%m-%d-%H%M%S.howm'

if has('win32') || has('win64')
  let mygrepprg = 'agrep.vim'
endif

" memolist {{{2
let g:memolist_path         = '~/memo'
let g:memolist_qfixgrep     = 1
let g:memolist_unite        = 1
let g:memolist_unite_option = '-auto-preview -vertical-preview'
" unite source memolist (alias)
let g:unite_source_alias_aliases.memolist = {
      \"source" : "file", "description" : "memolist",
      \"args"   : escape(substitute(g:memolist_path, '\\', '/', 'g'), ' ')
      \}
" unite source memolist/new
let s:memo_new = { "name":"memolist/new", "description":"memolist new" }
function! s:memo_new.gather_candidates(args,context)
  return [{
        \"word" : "[ new memo ]", "kind" : "command",
        \"action__command" : "MemoNew"
        \	}]
endfunction
call unite#define_source(s:memo_new)
unlet s:memo_new
" unite source memolist/new
let s:memo_grep = { "name":"memolist/grep", "description":"memolist grep" }
function! s:memo_grep.gather_candidates(args,context)
  return [{
        \"word" : "[ grep memo ]", "kind" : "command",
        \"action__command" : "MemoGrep"
        \	}]
endfunction
call unite#define_source(s:memo_grep)
unlet s:memo_grep

" Igor {{{2
augroup vimrc_igor
  autocmd!
  autocmd BufNewFile,BufRead *.ipf set filetype=igorpro
  autocmd filetype igorpro  setl noexpandtab
  autocmd filetype igorpro  setl foldmethod=marker
  autocmd filetype igorpro  setl commentstring=//%s
  autocmd filetype igorpro  inoremap <buffer> \ ¥
  autocmd filetype igorpro  command! Yen %s/\\/¥/g
augroup END

command! Igor :Unite file_rec
      \ -auto-preview -vertical-preview -create
      \ -input=.ipf
      \ -path=$HOME/OneDrive/Igor\ Pro\ User\ Files/User\ Procedures
" }}}2

" blockdiag {{{2
augroup vimrc_blockdiag
  autocmd!
  autocmd BufNewFile,BufRead *.diag set filetype=blockdiag
augroup END
" linewise increment {{{2
map ga <Plug>(incline-inc)
map gx <Plug>(incline-dec)
vmap <expr> <C-a>  mode() ==# "V" ? "\<Plug>(incline-inc)"          : "\<C-a>"
vmap <expr> <C-x>  mode() ==# "V" ? "\<Plug>(incline-dec)"          : "\<C-x>"
vmap <expr> g<C-a> mode() ==# "V" ? "\<Plug>(incline-inc-inclined)" : "g\<C-a>"
vmap <expr> g<C-x> mode() ==# "V" ? "\<Plug>(incline-dec-inclined)" : "g\<C-x>"

" experimental setting {{{1
command! ConvertToComma  :%s/、/，/ge
command! ConvertToPeriod :%s/。/．/ge

" my unite source: beamer theme  {{{
let s:beamer_themes_path="/usr/local/texlive/2016/texmf-dist/tex/latex/beamer/themes/theme"
let s:unite_source = {
      \ 'name': 'beamer_theme',
      \ 'description': 'built-in LaTeX beamer themes',
      \}
function! s:unite_source.gather_candidates(args, context)
  let s:files = filter(split(system('ls '.s:beamer_themes_path)),'v:val =~# "^beamertheme\.\*\\.sty$"')
  return map(s:files,'{
        \ "word": substitute(v:val[11:],"\.sty$","",""),
        \ "source": "beamer_theme",
        \ "kind": "word",
        \}')
endfunction
call unite#define_source(s:unite_source)
unlet s:unite_source
"}}}

" Weekly Note {{{
nnoremap <silent> [unite]w :<C-u>Unite
      \ -silent -no-start-insert -auto-preview
      \ weekly/current weekly/next weekly<CR>

let g:weekly_note_dir = '~/weekly'
command! WeeklyNote call s:weekly()
command! WeeklyNoteNext execute "edit ".s:weekly_next()
command! WeeklyNoteCurrent execute "edit ".s:weekly_current()
function! s:weekly()
  if(expand("%:p") ==# s:weekly_current())
    execute "split ".s:weekly_next()
  else
    execute "edit ".s:weekly_current()
  endif
endfunction
function! s:weekly_current()
  return expand(s:weekly_dir().(strftime('%W')+0).'th.md',':p') 
endfunction
function! s:weekly_next()
  return expand(s:weekly_dir().(strftime('%W')+1).'th.md',':p') 
endfunction
function! s:weekly_dir()
  if !isdirectory(g:weekly_note_dir)
    call mkdir(g:weekly_note_dir,'p')
  endif
  let dir=expand(g:weekly_note_dir . strftime('/%Y'),':p')
  if !isdirectory(dir)
    call mkdir(dir)
  endif
  return dir.'/'
endfunction

let g:unite_source_alias_aliases.weekly = {
      \"source" : "file", "description" : "weekly note",
      \"args"   : escape(substitute(g:weekly_note_dir.strftime('/%Y'), '\\', '/', 'g'), ' ')
      \}
let s:weekly_next = { "name":"weekly/next", "description":"next weekly note" }
function! s:weekly_next.gather_candidates(args,context)
  return [{
        \"word" : "[ next weekly note ]", "kind" : "command",
        \"action__command" : "WeeklyNoteNext"
        \	}]
endfunction
call unite#define_source(s:weekly_next)
unlet s:weekly_next
let s:weekly_current = { "name":"weekly/current", "description":"current weekly note" }
function! s:weekly_current.gather_candidates(args,context)
  return [{
        \"word" : "[ current weekly note ]", "kind" : "command",
        \"action__command" : "WeeklyNoteCurrent"
        \	}]
endfunction
call unite#define_source(s:weekly_current)
unlet s:weekly_current
"}}}

" vim: foldmethod=marker
