# Setting up Msys2 for remote builds #

## 1. MSys2 changes ##

> This section assumes that your installation of MSys is
> located in  `C:\msys64`.

Add a `bin` directory in `$HOME`

Copy `ln-msys.sh` to that `bin` directory and rename to `ln`

Edit `C:\msys64\msys2.ini`

```sh
MSYS=winsymlinks:nativestrict
#MSYS=error_start:mingw64/bin/qtcreator.exe|-debug|<process-id>
#CHERE_INVOKING=1
#MSYS2_PATH_TYPE=inherit
MSYSTEM=MSYS
```
uncomment the line `#MSYS=winsymlinks...`

Close Msys window and reopen

## 2. Create your PC sandbox ##

To create your sandbox follow the standard instructions
for creating a new sandbox using the MSys window.

## 3. PC sandbox root ##

Copy `build.bat` to your sandbox root on your PC

Edit the `build.bat` file

```bat
set SANDBOXNAME=<directory-name-of-remote-sandbox>
set LINUXUSER=<remote-linux-username>
set LINUXHOME=/home
set SANDBOX=%LINUXHOME%/%LINUXUSER%/%SANDBOXNAME%
set MSYSDIR=C:/msys64
set BUILDSERVER=<remote-host-name>
```

for example:
```bat
set SANDBOXNAME=firebird
set LINUXUSER=george
set LINUXHOME=/home2
set SANDBOX=%LINUXHOME%/%LINUXUSER%/%SANDBOXNAME%
set MSYSDIR=C:/msys64
set BUILDSERVER=hsv-tor3.int.vertivco.com
```


## 4. Linux sandbox root ##

Copy `ssh-bash.rc` to your sandbox root on the Linux build machine.

## 5. Visual Studio Code ##

Add the following lines to your `.vscode/settings.json` file,
or if you are using a vscode workspace add them to your
`*.code-workspace` file(s).

```JSON
{
    "terminal.integrated.shell.windows": "C:\\Windows\\System32\\cmd.exe",
    "terminal.integrated.shellArgs.windows": [
        "/c %SANDBOX%\\build.bat"
    ],
    "terminal.integrated.env.windows": {
        "SANDBOX": "${workspaceFolder}"
    }
}
```
