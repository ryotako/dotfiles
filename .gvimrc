" Setting {{{
" cd $HOME
set cmdheight=1
set guioptions-=mTlL
set guicursor=a:blinkon0
" inoremap \ \
" ¥ マークと別に\があるキーボードのため．
"}}}

" Font {{{
set antialias
if has("win32") || has("win64")
  set guifontwide=MeiryoKe_Console:h10
  set guifont=MeiryoKe_Console:h10
  set linespace=5
elseif has("mac")
  set guifontwide=ricty:h13
  set guifont=ricty:h13
  set linespace=2
endif
"}}}

" Transparency {{{
" if has("win32") || has("win64")
"   autocmd GUIEnter * set transparency=250
" elseif has("mac")
"  set transparency=8
" endif
"}}}


" vim: foldmethod=marker
