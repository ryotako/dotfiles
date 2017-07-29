" Setting {{{
set cmdheight=1
set guioptions-=m
set guioptions-=T
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
set guicursor=a:blinkon0
" inoremap \ \
" ¥ マークと別に\があるキーボードのため．
"}}}

" Font {{{
set antialias
if has("win32") || has("win64")
  set renderoptions=type:directx
  set guifontwide=MeiryoKe_Console:h11
  set guifont=MeiryoKe_Console:h11
  set linespace=4
elseif has("mac")
  set guifontwide=ricty:h14
  set guifont=ricty:h14
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
