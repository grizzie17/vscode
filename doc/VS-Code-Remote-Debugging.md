[Go Home](../README.md)

---


# Remote Debugging #

We are talking generally about remote debugging.  Our initial focus will be on C/C++
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

- [Remote Debugging](#remote-debugging)
  - [What we can/can't do](#what-we-cancant-do)
    - [CAN](#can)
    - [CAN'T](#cant)
  - [What you need to get started](#what-you-need-to-get-started)
  - [Visual Studio Code](#visual-studio-code)
    - [Install needed extensions](#install-needed-extensions)
    - [Fix Bug in C/C++ extension](#fix-bug-in-cc-extension)
  - [Install `MSYS2`](#install-msys2)
  - [Create local (PC) sandbox](#create-local-pc-sandbox)
    - [Configure `C/C++` and `ftp-sync` extensions](#configure-cc-and-ftp-sync-extensions)
  - [Create sandbox on the build server](#create-sandbox-on-the-build-server)
  - [Building for Debug](#building-for-debug)
  - [Debugging Workflow](#debugging-workflow)

## Visual Studio Code ##

To install Visual Studio Code on your PC simply visit the 
[website](https://code.visualstudio.com) and select the 
"Download for Windows" button on the homepage.  For a better 
description please see [Getting Started](VS-Code.md#getting-started).

When you run `vscode` for the first time take a few minutes to setup your favorite 
color themes and the like.  For more info, please see [VS Code Settings](VS-Code-Settings.md) 
and [VS Code Extensions](VS-Code-Extensions.md)

### Install needed extensions ###

* The `C/C++` extension provides the interfaces for the debugger.  In addition it is used to 
  help resolve headers and thus variables so things like intellisense work.  
  For installation instructions please see the [Install C/C++ extension](VS-Code-Extensions.md#install-cc-extension) 
  subsection on the [Extensions](VS-Code-Extensions.md) page.
* The `sftp` extension is used to transfer files to the build-server that have been edited on your PC.
  For installation instructions please see the [Install sftp extension](VS-Code-Extensions.md#install-sftp-extension)
  subsection on the [Extensions](VS-Code-Extensions.md) page.

You will need to configure each of these for each PC sandbox that you create (which is largely copy/paste).

### Fix Bug in C/C++ extension ###

On Windows edit the file `C:\Users\<yourusername>\.vscode\extensions\ms-vscode.cpptools-<versionnumber>\out\src\Debugger\attachToProcess.js`.

* Find the `getRemoteOSAndProcesses` function.
* On the first line of that function (on or around line 92) remove the double quotes around `Linux` and `Darwin`.
* Two lines below, you should find a `'${command}'`, change the single quotes to double quotes.
* Save the file.

The resulting lines should look like:

```javascript
getRemoteOSAndProcesses(pipeCmd) {
  const command = `sh -c 'uname && if [ $(uname) = Linux ] ; then ${nativeAttach_1.PsProcessParser.psLinuxCommand} ; elif [ $(uname) = Darwin ] ; ` +
    `then ${nativeAttach_1.PsProcessParser.psDarwinCommand}; fi'`;
  return common_1.execChildProcess(`${pipeCmd} "${command}"`, null, this._channel).then(output => {
```

## Install `MSYS2` ##

MSYS2 is used to create a local (PC) sandbox, and provide headers for intellisense.

Please see the [MSYS2](VS-Code-MSYS2.md) page.

## Create local (PC) sandbox ##

Open the `MSYS2 MinGW 64-bit` app.

```sh
# please note the directory is in your 'Documents' directory on your PC
cd /c/Users/yourname/Documents

mkdir yoursandbox
cd yoursandbox
git clone https://github.com/group/your-repo content
./content/pull.sh
```

And if you have corrected the symlink problem using the instructions above, you might consider
```sh
ln -s $PWD ~/yoursandbox
```
> WARNING: do not do try to create a symbolic link if you have not fixed the MSYS2 problem 
> because MSYS2 will copy your entire sandbox to your home directory.

### Configure `C/C++` and `ftp-sync` extensions ###

Please see [Configure C/C++ extension](VS-Code-Extensions.md#cc) subsection on the Extensions page.

Please see [Configure ftp-sync extension](VS-Code-Extensions.md#ftp-sync) subsection on the Extensions page.



## Create sandbox on the build server ##

Use ssh to connect to the build server.  If you cannot do this without using a password you need to resolve this first.

> This is important because the build scripts (when in debug mode) will
> pickup your known_hosts and authorized_keys files and transfer them to
> your appliance.

```sh
mkdir yoursandbox
cd yoursandbox
git clone https://github.com/group/your-repo content
./content/pull.sh
```


## Building for Debug ##

If you are using the 'bbenter' build environment you should enable debugging by using the following command.

```bash
bbdebug yes
```
Then build your sandbox accordingly.


## Debugging Workflow ##


**`.vscode/launch.json`**
```JSONC
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
      "processId": "${command:pickRemoteProcess}",
      "pipeTransport": {
        "debuggerPath": "/usr/bin/gdb",
        "pipeProgram": "C:\\Windows\\System32\\OpenSSH\\ssh.exe",
        "pipeArgs": [
          "-T",
          "admin@<your-device-ip>"
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
          "text": "directory /home/your-name/sandbox/source1"
        },
        {
          "text": "directory /home/your-name/sandbox/source2"
        },
        {
          "text": "directory /home/your-name/sandbox/source3"
        },
        {
          "description": "Enable pretty-printing for gdb",
          "text": "set print pretty on",
          "ignoreFailures": true
        }
    ],
      "sourceFileMap": {
        // map the build path to your PC path.
        "/home/your-name/sandbox": "${workspacePath}"
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
      "program": "/usr/bin/<programname>",
      "cwd": "/home/your-name/sandbox",
      "targetArchitecture": "x64",
      "MIMode": "gdb",
      "sourceFileMap": {
        "/home/your-name/sandbox": "${workspacePath}"
      },
      "setupCommands": [
        {
          "text": "set print pretty on"
        },
        // specify directories for files that should be resolved
        // please note these are relative to the build server
        {
          "text": "directory /home/your-name/sandbox/source1"
        },
        {
          "text": "directory /home/your-name/sandbox/source2"
        },
        {
          "text": "directory /home/your-name/sandbox/source3"
        }
      ],
      "pipeTransport": {
        "pipeCwd": "${workspaceFolder}",
        "pipeProgram": "C:\\Windows\\System32\\OpenSSH\\ssh.exe",
        "pipeArgs": [
          "-T",
          "admin@<your-device-ip>",
          "gdb"
        ],
        "debuggerPath": "/usr/bin/gdb",
      }
      //"logging": {
      //    "engineLogging": true
      //}
    }
  ]
}
```

Need to login to the device **`admin`** account without using password (in other words using the .ssh/id_rsa key).


---

[Go Home](../README.md)
