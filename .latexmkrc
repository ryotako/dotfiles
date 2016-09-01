#!/usr/bin/env perl
# %S ソースファイル
# %O オプション
# %D 出力ファイル
# %B 拡張子なしソースファイル

if ($^O eq 'MSWin32') {
  $latex     = 'uplatex  %O -synctex=1 -interaction=nonstopmode -kanji=utf8 -no-guess-input-enc %S';
  # $pdflatex  = 'lualatex %O -synctex=1 -interaction=nonstopmode %S';
  $biber     = 'biber %O --bblencoding=utf8 -u -U --output_safechars %B';
  $bibtex    = 'upbibtex %O %B';
  $makeindex = 'upmendex %O -o %D %S';
  $dvipdf    = 'dvipdfmx %O -o %D %S';
  $dvips     = 'dvips %O -z -f %S | convbkmk -u > %D';
  $ps2pdf    = 'ps2pdf.exe %O %S %D';
  $pdf_mode  = 3;
  if (-f 'C:/Program Files/SumatraPDF/SumatraPDF.exe') {
    $pdf_previewer = '"C:/Program Files/SumatraPDF/SumatraPDF.exe" -reuse-instance';
  } elsif (-f 'C:/Program Files (x86)/SumatraPDF/SumatraPDF.exe') {
    $pdf_previewer = '"C:/Program Files (x86)/SumatraPDF/SumatraPDF.exe" -reuse-instance';
  } else {
    $pdf_previewer = 'texworks';
  }
}

if ($^O eq 'darwin') {
  $latex     = 'uplatex -interaction=nonstopmode %S';
  $pdflatex  = 'ptex2pdf -l -u -ot \'-interaction=nonstopmode\' %S';
  $biber     = 'biber %O --bblencoding=utf8 -u -U --output_safechars %B';
  $bibtex    = 'upbibtex %O %B';
  $makeindex = 'upmendex %O -o %D %S';
  $dvipdf    = 'dvipdfmx %O -o %D %S';
  $pdf_mode  = 3; # use dvipdf
  $max_repeat = 10;
  $pvc_view_file_via_temporary = 0; # pdfを破棄せず上書き & ビューアで更新確認
  $pdf_previewer = 'open -ga /Applications/Skim.app';
}
