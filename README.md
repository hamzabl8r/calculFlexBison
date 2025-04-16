# calculFlexBison
1 . Download WinFlexBison from: https://github.com/lexxmark/winflexbison/releases

2 . the zip file

3 . Add the folder to your PATH environment variable

4 . Rename the executables:

5 . win_flex.exe → flex.exe

6 . win_bison.exe → bison.exe

7 . Option 2: Use WSL (Windows Subsystem for Linux)
      * wsl --install
8 . Open a WSL terminal (Ubuntu)
9 . Install the tools: 
      * sudo apt update
      * sudo apt install flex bison gcc
10 . Run your commands in the WSL environment
Option 3: Using MSYS2
      * Install MSYS2 from https://www.msys2.org/
      * In the MSYS2 terminal:
      * pacman -Syu
      * pacman -S flex bison gcc

Once you have either option set up, try these commands again:
      * bison -d calc.y
      * flex calc.l
      * gcc calc.tab.c lex.yy.c -o calc -lm
