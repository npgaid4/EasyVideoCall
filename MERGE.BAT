@ECHO OFF
REM 結合バッチファイル：div2.exe により生成

ECHO 分割されたファイルを復元します

IF NOT EXIST "GIT-21~1.001"  GOTO ERR1
IF NOT EXIST "GIT-21~1.002"  GOTO ERR1
IF     EXIST "Git-2.16.1.4-32-bit.exe"  GOTO ERR2

COPY "GIT-21~1.001" "GIT-21~1.EXE"
IF ERRORLEVEL 1 GOTO ERR3
COPY /B "GIT-21~1.EXE"+"GIT-21~1.002"
IF ERRORLEVEL 1 GOTO ERR3

DEL "GIT-21~1.001"
DEL "GIT-21~1.002"


REN "GIT-21~1.EXE" "Git-2.16.1.4-32-bit.exe"

ECHO このバッチファイルも消してください
GOTO END

:ERR1
ECHO ファイルが一部存在しません
ECHO 処理を中止します
GOTO END

:ERR2
ECHO 復元先のファイルが既に存在しています
ECHO 処理を中止します
GOTO END

:ERR3
ECHO 復元に失敗しました
ECHO 処理を中止します
GOTO END

:END
ECHO 終了するには、何かキーを押してください
PAUSE >NUL

