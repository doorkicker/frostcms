moonc -t ./src ./src
copy .\src\src ..\frost\main /Y

REM run the game instead of testing with console
cd..
cd frost
start ..\frost\lovec.exe "main"
cd..
cd project