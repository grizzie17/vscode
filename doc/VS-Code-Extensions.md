[Go Home](../README.md)
# Extensions #

The following is a list of some favorite extensions for VSCode.

* [Appearance](#appearance)
* [Development](#development)
* [Files](#files)
* [Repositories](#repositories)
* [Utilities](#utilities)

## Install an Extension ##

Click on the squarish icon on the left-hand side of the workspace.  In the search bar bar at the top enter the name of the desired extension.  Pick the desired extension and then click on the "install" button.  Then click on the "Refresh to Load" button.  


---

# Appearance #


### Better Comments ###

[![Better Comments](icons/better-comments_icon.png)  
By: Aaron Bond](https://marketplace.visualstudio.com/items?itemName=aaron-bond.better-comments)

![sample better-comments screen-shot](icons/better-comments_example.png)

#### Configure `Better Comments` extension ####

For a slightly different configuration from the default that matches well with C++ and other development that includes the use of `Doxygen` comments, `issue` numbers, `TODO` commentary and others use the following.

```JSON
{
  "better-comments.tags": [
    {
      "tag": "?",
      "color": "#3498DB",
      "strikethrough": false,
      "backgroundColor": "transparent"
    },
    {
      "tag": "note",
      "color": "#66AA66",
      "strikethrough": false,
      "backgroundColor": "transparent"
    },
    {
      "tag": "warning",
      "color": "#FF8C00",
      "strikethrough": false,
      "backgroundColor": "transparent"
    },
    {
      "tag": "todo",
      "color": "#FF6600",
      "strikethrough": false,
      "backgroundColor": "transparent"
    },
    {
      "tag": "needs_work",
      "color": "#FF6600",
      "strikethrough": false,
      "backgroundColor": "transparent"
    },
    {
        "tag": "#",
        "color": "#339999",
        "strikethrough": false,
        "backgroundColor": "transparent"
    },
    {
      "tag": "@",
      "color": "#66CC66",
      "strikethrough": false,
      "backgroundColor": "transparent"
    },
    {
      "tag": "!",
      "color": "#66CC66",
      "strikethrough": false,
      "backgroundColor": "transparent"
    },
    {
      "tag": "\\",
      "color": "#66CC66",
      "strikethrough": false,
      "backgroundColor": "transparent"
    },
    {
      "tag": "/",
      "color": "#66CC66",
      "strikethrough": false,
      "backgroundColor": "transparent"
    },
    {
      "tag": "*",
      "color": "#66CC66",
      "strikethrough": false,
      "backgroundColor": "transparent"
    },
    {
      "tag": "//",
      "color": "#474747",
      "strikethrough": true,
      "backgroundColor": "transparent"
    }
  ]
}
```

-------------------

### Bracket Pair Colorizer 2 ###

[![Bracket Pair Colorizer 2](icons/bracket-pair-colorizer_icon.png)  
By: CoenraadS](https://marketplace.visualstudio.com/items?itemName=CoenraadS.bracket-pair-colorizer-2)

Alternate colors for nested brackets/parenthesis.

-------------------

## indent-rainbow ##

[![indent-rainbow ](icons/indent-rainbow.png)  
By: oderwat](https://marketplace.visualstudio.com/items?itemName=oderwat.indent-rainbow)

Make your indention clearly standout.

-------------------

### vscode icons ###

[![vscode icons](icons/vscode-icons_icon.png)  
By: Reberto Huertas](https://marketplace.visualstudio.com/items?itemName=robertohuertasm.vscode-icons)



---

# Development #


### Arduino ###

[![Arduino ](icons/arduino.png)  
By: Microsoft](https://marketplace.visualstudio.com/items?itemName=vsciot-vscode.vscode-arduino)


------------------


### Auto Close Tag ###

[![auto close tag](icons/auto-close-tag_icon.png)  
By: Jun Han](https://marketplace.visualstudio.com/items?itemName=formulahendry.auto-close-tag)

-------------------

### autoconf ###

[![autoconf ](icons/autoconf_icon.png)  
By: maelvalais](https://marketplace.visualstudio.com/items?itemName=maelvalais.autoconf)

Syntax highlighting for autoconf, M4, and automake files (autotools)

-------------------

### bitbakers-dozen ###

[![bitbakers dozen](icons/bitbakers-dozen.png)  
By: Bernard Bergan](https://marketplace.visualstudio.com/items?itemName=bbergan.bitbakers-dozen)

Syntax highlighting for bitbake recipes and configuration files.

-------------------


### C/C++ ###

[![C/C++ ](icons/C_Cpp_icon.png)  
By: Microsoft](https://marketplace.visualstudio.com/items?itemName=ms-vscode.cpptools)

The `C/C++` extension enables a host of services:

* Language service
  * Code formatting (but we use `Uncrustify`
  * Auto-completion
  * Symbol Searching
  * Go to Definition/Declaration
  * Peek Definition/Declaration
  * Class/Method Navigation
  * Signature Help
  * Quick Info (hover)
  * Error Squiggles
* Debugging
  * Support for debugging Windows (PDB, MinGW/Cygwin), Linux, macOS and remote Linux
  * Line by line code stepping
  * Breakpoints (including conditional and function breakpoints)
  * Variable inspection
  * Multi-threaded debugging support
  * Core dump debugging support
  * Executing GDB or MI commands directly when using 'C++ (GDB/LLDB)' debugging environment


#### Configure `C/C++` extension ####

From within your sandbox in `vscode`, press the "F1" key and enter "C/CPP" and select "C/Cpp: Add Configuration" or "C/Cpp: Edit Configurations"

**`.vscode/c_cpp_properties.json`**  
```JSON
{
  "configurations": [
    {
      "name": "MSYS-linux",
      "intelliSenseMode": "gcc-x64",
      "compilerPath": "C:\\msys64\\usr\\bin\\x86_64-pc-msys-gcc.exe",
      "cStandard": "c11",
      "cppStandard": "c++17",
      "defines": [
        "CONFNAME=MSYS",
        "_DEBUG",
        "UNICODE",
        "LINUX"
      ],
      "includePath": [
        ".",
        "${fileDirname}",
        "${workspaceFolder}",
        "${workspaceFolder}\\**",
        "${workspaceFolder}\\**\\**",
        "${workspaceFolder}\\**\\**\\**",
        "${workspaceFolder}\\**\\**\\**\\**",
        "${workspaceFolder}\\**\\**\\**\\**\\**"
      ]
    }
  ],
  "version": 4
}
```

The previous is an example that can be used.  An even better example includes the header files from the product being worked.

Add the following to your `vscode-workspace` file or add it to the `User` settings:

```JSONC
{
  "settings":{
    // C++
    "C_Cpp.clang_format_path": "C:/Program Files/LLVM/bin/clang-format.exe",
    "C_Cpp.clang_format_style": "file",
    "C_Cpp.formatting": "Default",
  }
}
```

#### Configuring launch.json for debugging ####

For help configuring the debugger see [Configuring launch.json for C/C++ debugging](https://github.com/Microsoft/vscode-cpptools/blob/master/launch.md)


-----------------------

### CMake ###

[![CMake ](icons/CMake_icon.png)  
By: twxs](https://marketplace.visualstudio.com/items?itemName=twxs.cmake)

Provides linting and intellisense for `CMake` configuration files.

-----------------------

### CMake Tools ###

[![CMake Tools](icons/cmake-tools-logo.png)  
By: Microsoft](https://marketplace.visualstudio.com/items?itemName=ms-vscode.cmake-tools)

Provides an integrated experience for `CMake` development in vs-code.

-----------------------

### Code Spell Checker ###

-----------------------

### Insert GUID ###

-----------------------

### Markdown All in One ###

[![Markdown All in One](icons/Markdown-mark.png)  
By: Yu Zhang](https://marketplace.visualstudio.com/items?itemName=yzhang.markdown-all-in-one)

Markdown linting and style checking along with syntax highlighting.  This also provides a live preview.

------------------------------

### PHP Debug ###

[![PHP Debug](icons/php-debug_icon.png)  
By: Felix Becker](https://marketplace.visualstudio.com/items?itemName=felixfbecker.php-debug)

> Add description for setting up php-debug in VS-Code.

```json
{
  "version": "2.0.0",
  "tasks": 
  [
    {
      "label": "localhost:8000/current-file",
      "type": "shell",
      "command": "explorer",
      "args": [
        "http://localhost:8000/${relativeFile}"
      ],
      "problemMatcher": []
    },
    {
      "label": "localhost:8000",
      "type": "shell",
      "command": "explorer",
      "args": [
        "http://localhost:8000"
      ],
      "problemMatcher": []
    }
  ]
}
```

------------------------------

### Python ###

[![Python ](icons/python_icon.png)  
By: Microsoft](https://marketplace.visualstudio.com/items?itemName=ms-python.python)

Linting, Debugging (multi-threaded, remote), code formatting, refactoring, unit tests, and more...

```JSON
{
  "python.autoComplete.addBrackets": true,
  "python.linting.enabled": true,
  "python.linting.lintOnSave": true,
  "[python]": {
    "editor.tabSize": 4,
    "editor.insertSpaces": true
  }
}
```

------------------------------

### Sort Lines by Selection ###
[![Sort Lines by Selection](icons/sort-lines-by-selection_icon.png)  
By: earshinov](https://marketplace.visualstudio.com/items?itemName=earshinov.sort-lines-by-selection)

------------------------------

### TSLint ###

[![typescript tslint](icons/tslint_icon.png)  
By: Microsoft](ms-vscode.vscode-typescript-tslint-plugin)

Linting for Typescript files.

---

# Files #


### EditorConfig for VS Code ###

[![EditorConfig for VS Code](icons/EditorConfig_icon.png)  
By: EditorConfig](https://marketplace.visualstudio.com/items?itemName=EditorConfig.EditorConfig)

This extension is used to process the `.editorconfig` files and apply the contained rules to `vscode`.  The Supported properties are:

* indent_style
* indent_size
* tab_width
* end_of_line
* insert_final_newline
* trim_trailing_whitespace

For more information on `.editorconfig` files see [EditorConfig site](https://editorconfig.org/)


------------------------------

### Remote Development ###
[![Remote Development](icons/RemoteDevelopment_icon.png)  
By: Microsoft](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.vscode-remote-extensionpack)

Extension Pack that adds the `Remote Development` tools for VS-Code.  These include:

* Remote - SSH
* Remote - WSL
* Remote - Containers (Docker)

------------------------------

### Remote Workspace (suggest Remote Development instead) ###

[![Remote Workspace](icons/remote-workspac_icon.png)  
By: Marcel J. Kloubert](https://marketplace.visualstudio.com/items?itemName=mkloubert.vscode-remote-workspace)

Adds functionality to the built-in capabilities of `vscode` regarding workspaces. Multi-protocol support (e.g., Azure, S3, FTP(s), SFTP, ...) for handling remote files like local files.


------------------------------

### sftp ###

[![sftp ](icons/sftp-icon.png)  
By: liximomo](https://marketplace.visualstudio.com/items?itemName=liximomo.sftp)

#### Configure `sftp` extension ####

Open `vscode` in your new sandbox.
Press the `F1` key and enter "sftp" and select the "SFTP: Config" command.

**`.vscode/sftp.json`**


```json
{
  "name": "Descriptive Name",
  "host": "your-host-site.com",
  "remotePath": "/http",
  "protocol": "ftp",
  "port": 21,
  "username": "your-username",
  "password": "your-password",
  "uploadOnSave": false,
  "ignore": [
    ".vscode",
    ".git",
    ".gitignore",
    ".DS_Store",
    ".editorconfig",
    ".user.ini",
    "Thumbs.db",
    "phpinfo.php"
  ]
}
```

---------------------------

### vscode-pdf ###

[![sftp ](icons/vscode-pdf.png)   
By: tomoki1207](https://marketplace.visualstudio.com/items?itemName=tomoki1207.pdf)

View PDF files in your workspace.


---

# Repositories #


### GitHub Issues ###

[![GitHub Issues and PRs](icons/github-issues_icon.png)  
By: Microsoft](https://marketplace.visualstudio.com/items?itemName=ms-vscode.github-issues-prs)

View the issues assigned to you

```JSON
{
  "github.repositories": [
    "group/repo"
  ],
  "github.host": "github.com",
  "github.username": "your-user-name"
}
```

------------------------------

### GitHub Pull Requests ###

[![GitHub Pull Requests](icons/github-pull-requests_icon.png)  
By: GitHub](https://marketplace.visualstudio.com/items?itemName=GitHub.vscode-pull-request-github)

Unbelievably great extension that allows you to do thorough *Pull Request* reviews right from VSCode.

```JSON
{
  "githubPullRequests.hosts": [
    {
      "host": "https://github.com",
      "username": "your-user-name"
    }
  ]
}
```

------------------------------

### GitLens ###

[![GitLens ](icons/gitlens-icon.png)  
By: Eric Amodio](https://marketplace.visualstudio.com/items?itemName=eamodio.gitlens)

Integration into the editor and the explorer of various git information.  Think: git blame supercharged.

```JSON
{
  "gitlens.advanced.messages": {
    "suppressShowKeyBindingsNotice": true
  },
  "gitlens.views.fileHistory.enabled": true,
  "gitlens.views.lineHistory.enabled": true,
  "gitlens.defaultDateStyle": "absolute"
}
```

------------------------------

### gi ###

Git Ignore file generation

------------------------------

### SVN ###

[![Subversion ](icons/subversion.png)  
By: Chris Johnston](https://marketplace.visualstudio.com/items?itemName=johnstoncode.svn-scm)

Integrated `subversion`.

```JSON
{
  "svn.enabled": true,
  "svn.path": "C:\\Program Files\\TortoiseSVN\\bin\\svn.exe",

}
```


---

# Utilities #


### Doxygen ###

Keyword highlighting and intellisense for adding doxygen commentary.

-----------------------


### Sort Lines by Selection ###
[![Sort Lines by Selection](icons/sort-lines-by-selection_icon.png)  
By: earshinov](https://marketplace.visualstudio.com/items?itemName=earshinov.sort-lines-by-selection)


--------------------------------

### SVG ###

[![SVG Viewer](icons/svg-viewer_icon.png)  
By: cssho](https://marketplace.visualstudio.com/items?itemName=cssho.vscode-svgviewer)

Support for Scaled Vector Graphic files/data.

--------------------------------

### Uncrustify ###

[![Uncrustify ](icons/uncrustify.png)  
By: LaurentTreguier](https://marketplace.visualstudio.com/items?itemName=LaurentTreguier.uncrustify)


This extension is really handy as it will allow you to quickly change your code to adhere to coding standards.

First install the `uncrustify` program on you PC (for the following examples we will assume that it is
installed in `C:\uncrustify`).

Then install the `Uncrustify` extension into vscode.

Now add the following into either your "USER SETTINGS" or your "WORKSPACE SETTINGS".

```JSONC
{
  // disable default formatting by the C/CPP extension
  "C_CPP.formatting": "Disabled",
  // identify the correct location of the executable
  "uncrustify.executablePath": "C:\\uncrustify\\uncrustify.exe"
}
```

Then add the following to your "WORKSPACE SETTINGS"

```JSON
{
  "uncrustify.configPath": "path/to/uncrustify.cfg"
}
```

Then all you need to do is right mouse on an open document and select "Format Document"... Tada! formatted document.

-----
---
[Go Home](../README.md)
