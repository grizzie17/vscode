## Install `MSYS2` ##

Goto https://www.msys2.org and follow the instructions for downloading and setup of msys2-x86_64.  Once you have gotten that downloaded and setup then you can create your local sandbox.  MSYS2 does not correctly handle symbolic-links so we have provided a workaround/fix in the [msys2](msys2) directory of this repository.

To make sure that your copy of MSYS2 is up-to-date you can open the `MSYS2 MinGW 64-bit` app and enter the following:

```sh
pacman -Syuu
```

### Search Package Manager ###

```sh
pacman -Ss <package-name>
```


### Install Development Packages ###

There are some other required packages that we will need.

```sh
pacman -S git svn tar rsync
```


```sh
pacman -S base-devel
pacman -S mingw-w64-x86_64-toolchain
```

```sh
pacman -S mingw-w64-x86_64-boost
```

```sh
pacman -S mingw-w64-x86_64-python2
pacman -S mingw-w64-x86_64-python2-docutils
pacman -S mingw-w64-x86_64-python3
pacman -S mingw-w64-x86_64-python3-docutils
```

#### Autotools ####

```sh
pacman -S make pkgconfig autoconf automake libtool intltool
```

#### Libraries ####

```sh
pacman -S mingw-w64-x86_64-freetype
pacman -S mingw-w64-x86_64-physfs
pacman -S mingw-w64-x86_64-libvorbis
pacman -S mingw-w64-x86_64-flac
pacman -S mingw-w64-x86_64-dumb
pacman -S mingw-w64-x86_64-libtheora
pacman -S mingw-w64-x86_64-libjpeg-turbo
pacman -S mingw-w64-x86_64-gtk2
pacman -S mingw-w64-x86_64-gtk3
```


### Fix the symlink problem ###

```sh
cd
git clone https://ghe.int.vertivco.com/eng-core/tools-and-practices-wiki
mkdir bin
cp tools-and-practices-wiki/msys2/ln-msys.sh bin/ln
chmod +x bin/ln
```

Edit your `.bashrc` file to add `export PATH=$HOME/bin:$PATH` while within MSYS2

Edit `C:\msys64\msys2.ini` on the Windows side of things.

```sh
MSYS=winsymlinks:nativestrict
#MSYS=error_start:mingw64/bin/qtcreator.exe|-debug|<process-id>
#CHERE_INVOKING=1
#MSYS2_PATH_TYPE=inherit
MSYSTEM=MSYS
```
uncomment the line `#MSYS=winsymlinks...`

Close MSYS window and reopen


### Create symlinks in your home directory ###

One handy trick that I use is create a sub-directory in `Documents` for your new sandbox.
Which provides easy access on your PC.  Then create a symlink from the msys2 `/home/<yourname>` directory to /c/users/yourname/Documents/yoursandbox.
That way you can easily open msys and cd to yoursandbox.

## Create local (PC) sandbox ##

Open the `MSYS2 MinGW 64-bit` app.

```sh
# please note the directory is your 'Documents' directory on your PC
cd /c/Users/yourname/Documents

mkdir yoursandbox
cd yoursandbox
svn checkout https://dcssvncol.int.vertivco.com/svn/DCIMA/trunk content
./content/pull.sh
```

And if you have corrected the symlink problem using the instructions above, you might consider
```sh
ln -s $PWD ~/yoursandbox
```
> WARNING: do not do try to create a symbolic link if you have not fixed the MSYS2 problem 
> because MSYS2 will copy your entire sandbox to your home directory.
