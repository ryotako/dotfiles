
REM このファイルが存在する場所にある．で始まるファイルのシンボリックリンクを
REM ホームディレクトリ配下に作成する．

FOR %%F IN (.*) DO @mklink %HOMEPATH%"\"%%F %%~fF

