# Remote Debugging #

We are talking generally about remote debugging and also specifically
about debugging on the *UMG*.  Our initial focus will be on C/C++
debugging but these basic techniques should work with any language that
**`gdb`** supports.

## What we can/can't do ##

### CAN ###

* Launch a remote program.
* Attach to an already running remote program.
* Line by line code stepping
* Breakpoints (including conditional and function breakpoints)
* Set watches
* Evaluate the stack
* Variable inspection (just hover over them or look in the variables view-port)
* Multi-threaded debugging support
* Core dump debugging support
* Multiple simultaneous debug sessions
* and much more...

### CAN'T ###

* Currently there is a problem debugging forked processes.

## What you need to get started ##

> The details of each will follow in their own section

* Install and configure [Visual Studio Code](#visual-studio-code) (vscode)
  * install and configure `vscode C/C++` extension
  * install and configure `vscode ftp-sync` extension
* Install and configure [MSYS2](VS-Code-MSYS2)
* Enable native Windows `ssh` support
* create a local (on your PC) sandbox
* create a sandbox on the build server
  * make sure that you can ssh from your PC to the build server without entering password
  * connect the two using vscode's `ftp-sync` extension
* configure your build server sandbox to build debug using `bbdebug yes`
* configure your `launch.json` file for remote debugging
* let the debugging begin

## Visual Studio Code ##

To install Visual Studio Code on your PC simply visit the [website](https://code.visualstudio.com) and select the "Download for Windows" button on the homepage.  For a better description please see [Getting Started](VS-Code#getting-started).

When you run `vscode` for the first time take a few minutes to setup your favorite 
color themes and the like.  For more info, please see [VS Code Settings](VS-Code-Settings) 
and [VS Code Extensions](VS-Code-Extensions)

### Install needed extensions ###

* The `C/C++` extension provides the interfaces for the debugger.  In addition it is used to 
  help resolve headers and thus variables so things like intellisense work.  
  For installation instructions please see the [Install C/C++ extension](VS-Code-Extensions#install-cc-extension) 
  subsection on the [Extensions](VS-Code-Extensions) page.
* The `ftp-sync` extension is used to transfer files to the build-server that have been edited on your PC.
  For installation instructions please see the [Install ftp-sync extension](VS-Code-Extensions#install-ftp-sync-extension)
  subsection on the [Extensions](VS-Code-Extensions) page.

You will need to configure each of these for each PC sandbox that you create (which is largely copy/paste).

## Install `MSYS2` ##

MSYS2 is used to create a local (PC) sandbox, and provide headers for intellisense.

Please see the [MSYS2](VS-Code-MSYS2) page.

## Create local (PC) sandbox ##

Open the `MSYS2 MinGW 64-bit` app.

```sh
# please note the directory is in your 'Documents' directory on your PC
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

### Configure `C/C++` and `ftp-sync` extensions ###

Please see [Configure C/C++ extension](VS-Code-Extensions#cc) subsection on the Extensions page.

Please see [Configure ftp-sync extension](VS-Code-Extensions#ftp-sync) subsection on the Extensions page.



## Create sandbox on the build server ##

Use ssh to connect to the build server.  If you cannot do this without using a password you need to resolve this first.

> This is important because the build scripts (when in debug mode) will
> pickup your known_hosts and authorized_keys files and transfer them to
> your appliance.

```sh
mkdir yoursandbox
cd yoursandbox
svn checkout https://dcssvncol.int.vertivco.com/svn/DCIMA/trunk content
./content/pull.sh
```


## Building for Debug ##

If you are using the 'bbenter' build environment you should enable debugging by using the following command.

```bash
bbdebug yes
```
Then build your sandbox accordingly.

When **debug** is enabled there is more happening than just passing flags 
to the compiler.  There are special tools and files that will be delivered and installed to the target device.
Modification of the UMG cli, menu and app_dispatch commands.

## Debugging Workflow ##


**`.vscode/launch.json`**
```JSON-with-comments
{
    "version": "0.2.0",
    "configurations": [
        {
            // It is strongly recommended that you create a meaningful name
            // for what you are actually debugging
            "name": "Pipe Attach",
            "type": "cppdbg",       // type provided by the C/C++ extension
            "request": "attach",
            "program": "/usr/bin/<programname>",
            //"processId": "12345",
            "processId": "${command:pickRemoteProcess}",
            "pipeTransport": {
                "debuggerPath": "/usr/bin/gdb",
                "pipeProgram": "C:\\Windows\\System32\\OpenSSH\\ssh.exe",
                "pipeArgs": [
                    "-T",
                    "admin@<your-umg-ip>",
                    "gdb"        // the 'gdb' argument on the 'UMG' is critical as it bypasses the menu
                ],
                "pipeCwd": "${workspaceFolder}"
            },
            "setupCommands": [
                {
                    "text": "handle SIGSEGV stop"
                },
                // specify directories for files that should be resolved
                // please note these are relative to the build server
                {
                    "text": "directory /home/your-name/umg/content/c/dispatcher"
                },
                {
                    "text": "directory /home/your-name/umg/content/c/menu"
                },
                {
                    "text": "directory /home/your-name/umg/content/c/dispatcher"
                },
                {
                    "text": "directory /home/your-name/umg/content/c/cli/source"
                },
                {
                    "text": "cd /home/your-name/umg/content/c/menu"
                },
                {
                    "description": "Enable pretty-printing for gdb",
                    "text": "set print pretty on",
                    "ignoreFailures": true
                }
            ],
            "sourceFileMap": {
                // map the build path to your PC path.
                "/home/your-name/umg/content/c": "${workspacePath}\\content\\c"
            }
            // "logging": {
            // 	"engineLogging": true
            // }
        },
        //=====================================================================================
        {
            // It is strongly recommended that you create a meaningful name
            // for what you are actually debugging
            "name": "Pipe Launch",
            "type": "cppdbg",
            "request": "launch",
            //"logging": {
            //    "engineLogging": true
            //},
            "program": "/usr/bin/<programname>",
            "cwd": "/home/your-name/umg/content/c/dispatcher",
            "targetArchitecture": "x64",
            "MIMode": "gdb",
            "sourceFileMap": {
                "/home/your-name/umg/content/c": "${workspacePath}\\content\\c"
            },
            "setupCommands": [
                {
                    "text": "set print pretty on"
                },
                // specify directories for files that should be resolved
                // please note these are relative to the build server
                {
                    "text": "directory /home/your-name/umg/content/c/dispatcher"
                },
                {
                    "text": "directory /home/your-name/umg/content/c/dlog"
                },
                {
                    "text": "directory /home/your-name/umg/content/c/message-bus"
                }
            ],
            "pipeTransport": {
                "pipeCwd": "${workspaceFolder}",
                "pipeProgram": "C:\\Windows\\System32\\OpenSSH\\ssh.exe",
                "pipeArgs": [
                    "-T",
                    "admin@<your-umg-ip>",
                    "gdb"
                ],
                "debuggerPath": "/usr/bin/gdb",
            }
        }
    ]
}
```

Need to login to UMG **`admin`** account without using password (in other words using the .ssh/id_rsa key).

