# Install `MSYS2` #

Goto https://www.msys2.org and follow the instructions for downloading and setup of msys2-x86_64.  Once you have gotten that downloaded and setup then you can create your local sandbox.  MSYS2 does not correctly handle symbolic-links so we have provided a workaround/fix in the [msys2](../msys2/README.md) directory of this repository.

## Fix the symlink problem ##

```sh
mkdir bin
cp ln-msys.sh bin/ln
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

## PACMAN ##

**pac**kage **man**ager


## Assure Msys is Up-to-Date ##

To make sure that your copy of MSYS2 is up-to-date you can open the `MSYS2 MinGW 64-bit` app and enter the following:

```sh
pacman -Syuu
```

## Search for Packages using `pacman` ##

Msys provides an extradorinary list of already available packages.  Use `pacman` to search if the package that you want is already available.

```sh
pacman -Ss <package-name>
```


## Install Packages using `pacman` ##

```sh
pacman -S <package-list>
```

There are some packages that we will need.

* git
* rsync
* svn
* tar
* unzip
* wget


```sh
pacman -S git svn tar rsync
```

## Install Development Packages ##


* base-devel
* mingw-w64-x86_64-toolchain

---

* mingw-w64-x86_64-boost

---


* mingw-w64-x86_64-python2
* mingw-w64-x86_64-python2-docutils
* mingw-w64-x86_64-python3-docutils

### Autotools ###

* autoconf
* autoconf-archive
* automake
* intltool
* libtool
* make
* pkgconfig

### Libraries ###

* mingw-w64-x86_64-freetype
* mingw-w64-x86_64-physfs
* mingw-w64-x86_64-libvorbis
* mingw-w64-x86_64-flac
* mingw-w64-x86_64-dumb
* mingw-w64-x86_64-libtheora
* mingw-w64-x86_64-libjpeg-turbo
* mingw-w64-x86_64-gtk2
* mingw-w64-x86_64-gtk3


## Create symlinks in your home directory ##

One handy trick that I use is create a sub-directory in `Documents` for your new sandbox.
Which provides easy access on your PC.  Then create a symlink from the msys2 `/home/<yourname>` directory to /c/users/yourname/Documents/yoursandbox.
That way you can easily open msys and cd to yoursandbox.

## Ready to go ##

At this point your copy of Msys should be ready to use to build for Windows PC.  There are still more settings that need to set before you can use it with VSCode.

