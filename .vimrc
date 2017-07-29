" First of All {{{1
" for Japanese comments
set encoding=utf-8
scriptencoding utf-8
" vimrc専用augroupの作成と初期化
augroup vimrc
  autocmd!
augroup END
" }}}1

" プラグイン {{{1
set runtimepath+=$HOME/.vim
call plug#begin('~/.vim/plugged')

" 絞込 {{{2
Plug 'Shougo/vimproc.vim', {'do': 'make'} " 非同期
Plug 'Shougo/unite.vim'           " 本体
Plug 'Shougo/neomru.vim'          " 最近使ったファイル
Plug 'Shougo/unite-outline'       " アウトライン表示．主にRmarkdown用
Plug 'osyo-manga/unite-fold'      " 折りたたみ階層表示
Plug 'osyo-manga/unite-highlight' " 現在のハイライトのカラーコード一覧
Plug 'ujihisa/unite-colorscheme'  " カラースキーム一覧
Plug 'ujihisa/unite-font'         " フォント一覧

" 補完 {{{2
Plug 'Shougo/neocomplete.vim' " 本体
Plug 'Shougo/neco-syntax'     " 補完のソース
Plug 'Shougo/neco-vim'        " Vim script補完のソース
Plug 'ujihisa/neco-look'      " lookコマンドで英単語収集
Plug 'Konfekt/FastFold'       " neocompleteで折畳みするために必要

" 既存の機能を拡張するもの {{{2
Plug 'LeafCage/foldCC.vim'       " 拡張版折りたたみ
Plug 'LeafCage/yankround.vim'    " 拡張版ヤンク履歴管理
Plug 'cocopon/vaffle.vim'        " 拡張版ファイラ: cocopon製
Plug 'easymotion/vim-easymotion' " 拡張版カーソル移動: 見えている場所に素早く
Plug 'haya14busa/incsearch.vim'  " 拡張版検索 検索対象をハイライト
Plug 'itchyny/lightline.vim'     " 拡張版ステータスライン
Plug 'kana/vim-niceblock'        " 拡張版範囲選択: visualのI,Aの挙動を矩形選択に
Plug 'kana/vim-submode'          " 拡張版キーバインド: 連打を便利に
Plug 'osyo-manga/vim-anzu'       " 拡張版検索: 一致件数を取得
Plug 'osyo-manga/vim-brightest'  " 拡張版検索: カーソル下と同じ単語をハイライト
Plug 'osyo-manga/vim-over'       " 拡張版置換: 置換対象をハイライト
Plug 'rhysd/clever-f.vim'        " 拡張版カーソル移動: f連打で次の一致箇所へ
Plug 'sjl/gundo.vim'             " 拡張版undo履歴: 履歴の可視化
Plug 'terryma/vim-expand-region' " 拡張版選択範囲: 範囲の拡大・縮小
Plug 'thinca/vim-visualstar'     " 拡張版検索: ビジュアル選択した文字列を検索
Plug 'tpope/vim-repeat'          " 拡張版リピート: プラグインで使用可能な機構
Plug 'vim-jp/vimdoc-ja'          " 拡張版ヘルプ: 日本語訳

" 入れたものの...系
Plug 'haya14busa/vim-metarepeat' "メタリピート！
Plug 'haya14busa/vim-asterisk'
Plug 'thinca/vim-quickrun'

" オペレータ {{{2
Plug 'kana/vim-operator-user'         "operator自作のための機構
Plug 'thinca/vim-operator-sequence'   "複数operatorの統合
Plug 'haya14busa/vim-operator-flashy' "y:ヤンクを可視化
Plug 'kana/vim-operator-replace'      "S:レジスタから貼付け
Plug 'tyru/operator-camelize.vim'     "_:camel-snake入れ替え

" オブジェクト {{{2
" builtin w, W, s, p, [, ], (,, <, >, {, }, ",  ', `
" replace q, (, ', d, ("
" vimtex  e, d, c, $, m(math, m=$
Plug 'kana/vim-textobj-user'             "textobj自作のための機構
Plug 'kana/vim-textobj-entire'           "a:全て(all,e->environment)
Plug 'osyo-manga/vim-textobj-multiblock' "b:囲まれた範囲
Plug 'kana/vim-textobj-fold'             "z:折畳みの範囲
Plug 'kana/vim-textobj-indent'           "i:字下げの範囲
Plug 'kana/vim-textobj-line'             "l:行
Plug 'h1mesuke/textobj-wiw'              "v:snake caseの一部(v+v=w)
Plug 'mattn/vim-textobj-url'             "u:URL
Plug 'thinca/vim-textobj-comment'        "/:コメント

" コーディング補助 {{{2
Plug 'AndrewRadev/switch.vim'         " 指定したパターンで文字を切り替える
Plug 'LeafCage/vimhelpgenerator'      " vimプラグインヘルプ生成
Plug 'cohama/lexima.vim'              " 対括弧補完．古いvimだとIMEに干渉？
Plug 'junegunn/vim-easy-align'        " 簡単位置揃え
Plug 'kien/rainbow_parentheses.vim'   " 対応()を色付け．主にlisp系のために
Plug 'ntpeters/vim-better-whitespace' " 行末スペース可視化
Plug 'thinca/vim-prettyprint'         " vimの変数のprettyprint
Plug 'tpope/vim-commentary'           " 疑似operator,  gc:comment/uncomment
Plug 'tpope/vim-surround'             " 疑似textobj,  s:surroundingの変更・削除
Plug 'tyru/capture.vim'               " unite outputと異なり素バッファに出力
Plug 'ryotako/vim-incline'            " 自作．行単位インクリメント

" Git {{{2
Plug 'tpope/vim-fugitive' "vimからgit
Plug 'cohama/agit.vim'    "commit履歴を可視化
Plug 'mattn/gist-vim'     "gistにアクセス
Plug 'mattn/webapi-vim'   "gist-vimのために必要

" 特定言語のサポート {{{2
Plug 'cespare/vim-toml'              " TOML
Plug 'dag/vim-fish'                  " fish (そのうち改良したい)
Plug 'egison/vim-egison'             " egison
Plug 'fatih/vim-go'                  " GO
Plug 'gnuplot.vim'                   " アレ
Plug 'leseixas/quantum_espresso-vim' " 量子計算パッケージ
Plug 'mhaig/vim-blockdiag-series'    " blockdiag
Plug 'zplug/vim-zplug'               " zplug

" カラースキーム {{{2
Plug 'anekos/colocolo.vim'        " 色がコロコロ変わる
Plug 'cocopon/iceberg.vim'        " 黒地青基調．lightline対応
Plug 'flazz/vim-colorschemes'     " カラースキームカタログ

" 設定待ち {{{2
" Plug 'kakkyz81/evervim'     " Evernote
" Plug 'davidhalter/jedi-vim' " python
" Plug 'lervag/vimtex'        " LaTeX

call plug#end()

filetype plugin indent on
syntax enable
"}}}1

" 基本設定 {{{1
set noshellslash " WindowsのものはWindowsへ

" 言語 {{{2
set fileformat=unix   " 改行コードを<LF>に
set spelllang=en,cjk  " アジア圏言語をスペルミス判定しない
set ambiwidth=double  " 文字幅が判別できない時は全角扱い
set helplang=ja,en    " ヘルプは日本語を優先
set imdisable         " MacVim Kaoriya の自動IME切り替え無効

" 自動生成ファイル {{{2
set swapfile                         " swpファイル(未保存の変更内容)の作成の有無
set backup                           " ~ファイル(一世代前のファイル)の作成の有無
set undofile                         " un~ファイル(undo履歴ファイル)の作成の有無
set directory-=.                     " その場に作るのはやめる
let &undodir=&directory              " 同上
let &backupdir=&directory            " 同上
set backupskip=/tmp/*,/private/tmp/* " ここにbackupを作るとcronに干渉する

" 見た目 {{{2
set display+=lastline " 長い行を省略しない
set cmdheight=1       " コマンド行の行数
set cursorline        " 現在行のハイライト
set diffopt+=vertical " diffは左右に並べる
set foldcolumn=2      " fold情報表示列の幅
set foldlevel=99      " foldを勝手に閉じない
set foldlevelstart=99 " foldを編集開始時に全て開く
set laststatus=2      " 常にステータス行を表示
set lazyredraw        " 直接実行したコマンドでない場合再描画しない
set matchtime=1       " 対応括弧表示時間(サブ秒)
set nolist            " 不可視文字は不可視(必要ならトグる)
set listchars=tab:^\ ,trail:_,extends:>,precedes:< " 可視な不可視文字

set number            " 行番号を表示
set pumheight=12      " 補完ポップアップの最大数
set showmatch         " 対応括弧表示
set showtabline=2     " 常にタブ行を表示
set splitbelow        " ウィンドウは下に分割
set splitright        " ウィンドウは右に分割
set textwidth=80      " この文字数以降は折り返す
set wildmenu          " ステータスラインに補完候補を並べる
setglobal wrap        " 長い行の折り返し

" conceal無効．
autocmd vimrc BufNewFile,BufRead * setlocal conceallevel=0
" textwidthより右を塗りつぶす(邪魔なときはトグる)
execute "set colorcolumn=".join(range(&textwidth+1, 999), ',')

" Indent {{{2
set expandtab         " タブを入力時に空白に展開
set tabstop=2         " タブの表示幅
set shiftwidth=2      " 自動インデントが挿入するタブ幅
set softtabstop=2     " 連続した空白をカーソルで移動する際の移動幅
set autoindent        " 改行時にインデントを継続
set smartindent       " 入力内容に合わせたインデントの増減
set breakindent       " wrapした文章もインデントして表示
set formatoptions=    " 自動フォーマットしない


" Cursor Moving {{{2
set backspace=indent,eol,start    " 行をまたぐバックスペースを有効化
set mouse=a                       " すべてのモードでマウスを有効化
set ttymouse=xterm2               " マウスの種類
set virtualedit=block             " 矩形選択で文字のない箇所にカーソル移動可
set clipboard=unnamed,unnamedplus " クリップボードを使用

" Search {{{2
set ignorecase " 大文字小文字を区別しない
set smartcase  " ただし大文字が入力された場合は区別する
set incsearch  " 検索文字列が入力途中の段階から検索
set hlsearch   " 検索文字列のハイライト

" Colorscheme {{{2
" let s:cui_colorscheme = 'stonewashed-256'
" let s:gui_colorscheme = 'stonewashed-gui'
" let s:lightline_color = 'solarized'
let s:cui_colorscheme = 'iceberg'
let s:gui_colorscheme = 'iceberg'
let s:lightline_color = 'iceberg'

" 上で色設定しておくと，後はよしなにする
let g:lightline = {}
let g:lightline.component = {'lineinfo': '%3l[%L]:%-2v'}
execute 'autocmd vimrc VimEnter * nested colorscheme '.s:cui_colorscheme
execute 'autocmd vimrc GUIEnter * nested let g:lightline.colorscheme="'
      \.s:gui_colorscheme.'"'

if has('gui_running') 
  execute 'autocmd vimrc GUIEnter * nested set t_Co=256'
  execute 'autocmd vimrc GUIEnter * nested colorscheme '.s:gui_colorscheme

  " let g:lightline.colorscheme = s:lightline_color
endif


" カラースキームをランダムに変更
let g:i_am_not_pika_beast=1 " すぐにはコロコロしない
command! -nargs=0 Colo highlight clear | ColoColo | redraw | colorscheme

" Others {{{2
set belloff=all       " 沈黙
set modeline          " コメントでvimに指示を出す
set notimeout         " タイムアウトを無効
set hidden            " quit時にバッファを削除せず，隠す
set confirm           " 変更されたバッファがあるとき，確認
set switchbuf=useopen " すでに開いているバッファがあれば，それを開く
set keywordprg=:help  " K は:! manではなく:help
" }}}

" 最後にカーソルが合った場所に移動
" 元ネタ (http://advweb.seesaa.net/article/13443981.HowmHtml_htmldir)
augroup vimrc
  au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "normal g`\"" | endif
augroup END


" Key Mapping {{{1
" Insert Mode {{{2

" 上下左右キーがABCDになるアレの解決
" 問題は本当に<Esc>OAしたい場合．気になるようなら対処．問題なければ放置.
" inoremap OA <Down>
" inoremap OB <Down>
" inoremap OC <Right>
" inoremap OD <Left>


" undo履歴を分断しない前後移動 Backward, Forward
inoremap <C-b> <C-g>U<Left>
inoremap <C-f> <C-g>U<Right>
" 行頭行末移動(undo履歴分断) A, End
inoremap <C-a> <C-o>^
inoremap <C-e> <C-o>$

" 一文字先を消す．試験的に
inoremap <C-l> <C-g>U<Right><BS>

" Command Mode {{{2
" emacs風(というか，シェル風)に入れ替え

" 前後移動 Backward, Forward
" <space><BS>は補完を抜ける儀式
cnoremap <C-b> <space><BS><left>
cnoremap <C-f> <space><BS><right>
cnoremap <C-x> <C-f>

" 行頭行末移動 A, End
" <C-e>はもともと行末移動
cnoremap <C-a> <C-b>


" Others {{{2

" 直前のexコマンドを繰り返す (Hack97)
nnoremap <C-H> q:k<CR>

" tab移動
nnoremap <C-J> gt
nnoremap <C-K> gT

" D,Cとの整合性
nnoremap Y y$

" 行頭行末移動
noremap H ^
noremap L $

" エスケープ系
nmap <ESC><ESC> :nohlsearch<CR>

" 表示行で移動
noremap  j      gj
noremap  k      gk
noremap  <DOWN> gj
noremap  <UP>   gk


" 設定をトグる
nnoremap t <Nop>
nnoremap <expr> tc <SID>ToggleOption('conceallevel', '', [0, 2])
nnoremap <expr> th <SID>ToggleOption('hlsearch',     '', [])
nnoremap <expr> tl <SID>ToggleOption('list',         '', [])
nnoremap <expr> tn <SID>ToggleOption('number',       '', [])
nnoremap <expr> ts <SID>ToggleOption('spell',        '', [])
nnoremap <expr> tw <SID>ToggleOption('wrap',         '', [])
      \. (&wrap == 'wrap') ? '^' : ''
nnoremap <expr> tf <SID>ToggleOption('foldmethod','f'
      \,['manual','indent','expr','marker','syntax','diff'])
nnoremap tb :<C-u>BrightestToggle<CR>
nnoremap t_ :<C-u>ToggleWhitespace<CR>
nnoremap tm :call <SID>ToggleMargin()<CR>
nnoremap tr :<C-u>RainbowParenthesesToggle<CR>

" keyを指定すると最初の呼び出しで変更を行わず，key連打で変更を繰り返す．
function! s:ToggleOption(option,key,list) "{{{
  if strlen(a:key)
    execute 'setlocal '.a:option.'?'
    let input=nr2char(getchar())
  endif
  while strlen(a:key) == 0 || input ==# a:key
    if len(a:list)
      execute "let l:current = &".a:option
      let i = index(a:list,l:current)+1
      let i = i>=len(a:list) ? 0 : i
      execute 'setlocal '.a:option.'='.a:list[i]
    else
      execute 'setlocal '.a:option.'!'
    endif
    redraw
    execute 'setlocal '.a:option.'?'
    if strlen(a:key) == 0
      return ''
    endif
    let input=nr2char(getchar())
  endwhile
  echo ''
  return input
endfunction "}}}

" 折り返し範囲外塗りつぶしのオンオフ
function! s:ToggleMargin()
  let value = &colorcolumn
  if strlen(value)
    set colorcolumn=""
    set colorcolumn?
  else
    execute "set colorcolumn=".join(range(&textwidth+1, 999), ',')
    echo "  colorcolumn=81..."
  endif
endfunction

" ヘルプ
" :h が画面分割でヘルプを開くのに対して, :H で別タブでヘルプを開く
" ただし.vimrc編集中は縦分割で開く
command! -nargs=1 -complete=help H call <SID>my_help(<f-args>)
function! s:my_help(str)
  execute (expand('%') =~# '.vimrc' ? 'vert' : 'tab') . ' help '.a:str
endfunction

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
nnoremap <silent> [unite]h :<C-u>Unite -silent -start-insert help    <CR>
nnoremap <silent> [unite]l :<C-u>Unite -silent -start-insert line    <CR>
nnoremap <silent> [unite]m :<C-u>Unite -silent -start-insert mapping <CR>
nnoremap <silent> [unite]u :<C-u>Unite -silent -start-insert source  <CR>
nnoremap <silent> [unite]y :<C-u>Unite -silent -start-insert history/yank <CR>
nnoremap <silent> [unite]g :<C-u>Unite -silent -no-start-insert -vertical -winwidth=12 menu:git<CR>
nnoremap <silent> [unite]G :<C-u>call <SID>my_unite_giti()<CR>
nnoremap <silent> [unite]z :<C-u>Unite -silent -no-start-insert -vertical -winwidth=40 fold <CR>
nnoremap <silent> [unite]o :<C-u>Unite -silent -no-start-insert -vertical -winwidth=40 outline mark <CR>

cabbrev U Unite

" unite系変数の初期化
if !exists("g:unite_source_alias_aliases")
  let g:unite_source_alias_aliases = {}
endif
if !exists("g:unite_source_menu_menus")
  let g:unite_source_menu_menus = {}
endif

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

" align (easyalign) {{{2
vmap     <CR>    <Plug>(EasyAlign)*
vmap     <Space> <Plug>(EasyAlign)*
vnoremap <tab>   :sort<CR>

" search (incsearch / anzu / visualstar / over / brightest) {{{2
" let g:incsearch#auto_nohlsearch = 1
" incsearch
" 日本語検索のために標準の/を残しておく
nnoremap <Space>/ / 
map  /  <Plug>(incsearch-forward)
map  ?  <Plug>(incsearch-backward)
map  g/ <Plug>(incsearch-stay)
" incsearch + anzu
map  n <Plug>(incsearch-nohl-n)
map  N <Plug>(incsearch-nohl-N)
nmap n <Plug>(incsearch-nohl)<Plug>(anzu-n-with-echo)
nmap N <Plug>(incsearch-nohl)<Plug>(anzu-N-with-echo)

" incsearch + asterisk
map *  <Plug>(incsearch-nohl)<Plug>(asterisk-*)
map g* <Plug>(incsearch-nohl)<Plug>(asterisk-g*)
map #  <Plug>(incsearch-nohl)<Plug>(asterisk-#)
map g# <Plug>(incsearch-nohl)<Plug>(asterisk-g#)
" over
nnoremap gs :<C-u>OverCommandLine<CR>%s/
xnoremap gs :OverCommandLine<CR>s/
let g:brightest_enable = 0

" window (s-mapping, submode) {{{2
nnoremap s  <C-w>
nnoremap se <C-w>=
nnoremap ss <C-w>s
nnoremap sv <C-w>v
nnoremap sQ :<C-u>bdelete<CR>
nnoremap st :<C-u>tabnew<CR>
nnoremap tt :<C-u>tabnew<CR>
let g:submode_keep_leaving_key    = 1
let g:submode_always_show_submode = 1
call submode#enter_with('tabmove', 'n', '', 'gt', 'gt')
call submode#enter_with('tabmove', 'n', '', 'gT', 'gT')
call submode#map       ('tabmove', 'n', '', 't',  'gt')
call submode#map       ('tabmove', 'n', '', 'T',  'gT')

" g;;;
call submode#enter_with('g;', 'n', '', 'g;', 'g;')
call submode#map       ('g;', 'n', '', ';','g;')

" yank (flashy / yankround / replace) {{{2
" flashyにtextobj-user製のtextobjを渡すための小細工
" let g:operator#flashy#group = 'Visual' " 背景色によっては変更が必要
let g:operator#flashy#flash_time = 200
nnoremap <expr><silent> <plug>(sleep)
      \ ":<C-u>sleep ".g:operator#flashy#flash_time."m<CR>"
nnoremap <expr> y operator#sequence#map
      \("\<Plug>(operator-flashy)","\<plug>(sleep)")
nmap Y  <plug>(operator-flashy)$
nmap yy <plug>(operator-flashy)<Plug>(operator-flashy)

" p連打でyankround. ペーストを繰り返すときはドットリピートする
let g:yankround_use_region_hl = 1
let g:yankround_max_history   = 100
let g:yankround_region_hl_groupname = g:operator#flashy#group
nmap <expr> p  yankround#is_active() ?
      \ "\<Plug>(yankround-prev)" : "\<Plug>(yankround-p)"
nmap <expr> P  yankround#is_active() ?
      \ "\<Plug>(yankround-next)" : "\<Plug>(yankround-P)"
nmap <expr> gp yankround#is_active() ?
      \ "\<Plug>(yankround-prev)" : "\<Plug>(yankround-gp)"
nmap <expr> gP yankround#is_active() ?
      \ "\<Plug>(yankround-next)" : "\<Plug>(yankround-gP)"

" x連打でレジスタを汚さない消去 ＆ まとめてundo履歴に登録
call submode#enter_with('x', 'n', '', 'x', '"_x')
call submode#map('x', 'n', '', 'x', ":<C-u>undojoin <bar> normal! \"_x<CR>")

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
nnoremap <silent> g<C-r> :<C-u>GundoToggle<CR>

" fold (foldCC) {{{2
set foldtext=FoldCCtext()

" a function for folding freaks
" http://leafcage.hateblo.jp/entry/2013/04/24/053113
nnoremap z{ :<C-u>call <SID>put_foldmarker(0)<CR>
nnoremap z} :<C-u>call <SID>put_foldmarker(1)<CR>
function! s:put_foldmarker(foldclose_p) "{{{
  let crrstr = getline('.')
  let padding = crrstr=='' ? '' : crrstr=~'\s$' ? '' : ' '
  let [cms_start, cms_end] = ['', '']
  let outside_a_comment_p 
        \= synIDattr(synID(line('.'), col('$')-1, 1), 'name') !~? 'comment'
  if outside_a_comment_p
    let cms_start = matchstr(&cms,'\V\s\*\zs\.\+\ze%s')
    let cms_end = matchstr(&cms,'\V%s\zs\.\+')
  endif
  let fmr = split(&fmr, ',')[a:foldclose_p]. (v:count ? v:count : '')
  exe 'norm! A'. padding. cms_start. fmr. cms_end
endfunction
"}}}

" motion (easymotion) {{{2
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
nmap <C-g> <Plug>(easymotion-overwin-f2)

" switch (switch)
" markdownのチェックボックスを入れ替える
let g:switch_mapping = ""
let g:switch_custom_definitions =
      \[
      \ { '\v^( *- *)([^ \[].*)$'  : '\1[ ] \2' },
      \ { '\v^( *- *)\[ \](.*)$'   : '\1[x]\2'  },
      \ { '\v^( *- *)\[x\] ?(.*)$' : '\1\2'     },
      \]
" <C-t>の元の機能はタグジャンプ．もっとよい割り当て先はないか
nnoremap <C-t> :Switch<CR>

" operator
map _ <Plug>(operator-camelize-toggle)

" text object (multiblock / comment / entire/ wiw) {{{2
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
execute "set rtp+=".globpath($GOPATH,"src/github.com/nsf/gocode/vim")

" latex (vimtex / unite-bibtex) {{{2
let g:tex_conceal=''
let g:tex_flavor='latex'
let g:vimtex_fold_enabled             = 1 " LaTeX文法による折りたたみを有効
let g:vimtex_fold_manual              = 1 " 自動折りたたみを無効
let g:vimtex_quickfix_open_on_warning = 0 " 警告のみの場合メッセージを表示しない
if has('win64') || has('win32')
  let g:vimtex_view_general_viewer='SumatraPDF'
else
  let g:vimtex_view_general_viewer
        \ = '/Applications/Skim.app/Contents/SharedSupport/displayline'
endif
let g:vimtex_view_general_options = '@line @pdf @tex'

" bibtex
let g:vimtex_complete_recursive_bib=1 
" tex編集中に，neocomplete以外の補完で欲しいのはbibtexのcite補完
autocmd vimrc filetype tex inoremap <C-x> <C-x><C-o>

" key mapping
autocmd vimrc filetype tex map <buffer> <Space> <localleader>
nnoremap <silent> <localleader>lt :<C-u>Unite vimtex_toc<CR>
nnoremap <silent> <localleader>ly :<C-u>Unite vimtex_labels<CR>
" text object (inline math)
omap am <plug>(vimtex-a$)
omap im <plug>(vimtex-i$)
vmap am <plug>(vimtex-a$)
vmap im <plug>(vimtex-i$)

" memolist {{{2
let g:memolist_path         = '~/.memo'
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

" fish
if $SHELL =~ '/fish$'
  set shell=fish
  compiler fish
endif
augroup vimrc_fish
  autocmd!
  autocmd filetype fish setlocal tabstop=4
  autocmd filetype fish setlocal shiftwidth=4
  autocmd filetype fish setlocal softtabstop=4
  autocmd filetype fish setlocal foldmethod=expr
  autocmd filetype fish syntax sync minlines=1000
augroup END

" Igor Pro {{{2
augroup vimrc_igor
  autocmd!
  autocmd BufNewFile,BufRead *.ipf set filetype=igorpro
  autocmd filetype igorpro  setlocal fileencodings=cp932
  autocmd filetype igorpro  setlocal noexpandtab
  autocmd filetype igorpro  setlocal foldmethod=marker
  autocmd filetype igorpro  setlocal commentstring=//%s
augroup END

" Language Support {{{2
augroup vimrc_gnuplot
  autocmd!
  autocmd BufNewFile,BufRead *.plt set filetype=gnuplot
augroup END

" blockdiag {{{2
augroup vimrc_blockdiag
  autocmd!
  autocmd BufNewFile,BufRead *.diag set filetype=blockdiag
augroup END

" linewise increment {{{2
vmap <expr> <C-a>  mode() ==# "V" ? "\<Plug>(incline-inc)"          : "\<C-a>"
vmap <expr> <C-x>  mode() ==# "V" ? "\<Plug>(incline-dec)"          : "\<C-x>"
vmap <expr> g<C-a> mode() ==# "V" ? "\<Plug>(incline-inc-inclined)" : "g\<C-a>"
vmap <expr> g<C-x> mode() ==# "V" ? "\<Plug>(incline-dec-inclined)" : "g\<C-x>"

" Experimental {{{2
" 句読点 -> カンマピリオド変換
command! ConvertToComma  :%s/、/，/ge
command! ConvertToPeriod :%s/。/．/ge

" vim: foldmethod=marker
