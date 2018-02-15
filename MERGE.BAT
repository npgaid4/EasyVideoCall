@ECHO OFF
REM 結合バッチファイル：div2.exe により生成

ECHO 分割されたファイルを復元します

IF NOT EXIST "cmder.001"  GOTO ERR1
IF NOT EXIST "cmder.002"  GOTO ERR1
IF NOT EXIST "cmder.003"  GOTO ERR1
IF     EXIST "cmder.7z"  GOTO ERR2

COPY "cmder.001" "cmder.7z"
IF ERRORLEVEL 1 GOTO ERR3
COPY /B "cmder.7z"+"cmder.002"+"cmder.003"
IF ERRORLEVEL 1 GOTO ERR3

DEL "cmder.001"
DEL "cmder.002"
DEL "cmder.003"


REN "cmder.7z" "cmder.7z"

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

