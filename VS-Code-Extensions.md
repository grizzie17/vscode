The following is a list of some favorite extensions for VSCode.

* [`autoconf`](#autoconf) - syntax highlighting for autoconf, M4, and automake files (autotools)
* [`bitbakers-dozen`](#bitbakers-dozen) - syntax highlighting for bitbake recipes and configuration files.
* [`Bracket Pair Colorizer 2`](#bracket-pair-colorizer) - alternate colors for nested brackets/parenthesis.
* [**`C/C++`**](#cc) - IntelliSense, debugging, code browser, support for loadable header file paths, etc
* [`C/C++ Advanced Lint`](#cc-advanced-lint) - advanced, modern, static analysis extension that supports a number of back-end analyzer programs
* `Code Spell Checker` - highlight words (including camel-case) that are unknown
* `Doxygen` - keyword highlighting and IntelliSense for adding doxygen commentary
* [`EditorConfig for VS Code`](#editorconfig-for-vs-code) - process `.editorconfig` and apply settings to vs-code
* [**`ftp-sync`**](#ftp-sync) - autosync your work to/from remote ftp/sftp servers
* [`GitHub Issues and PRs`](#github-issues-and-prs) - View the issues and PRs assigned to you
* [`GitHub Pull Requests`](#github-pull-requests) - Review Pull Requests from your favorite editor
* [`GitLens`](#gitlens) - Integration into the editor and the explorer of various git information.  Think: git blame supercharged
* [`indent-rainbow`](#indent-rainbow) - Make your indention clearly standout.
* `Live HTML Previewer` - Edit and preview HTML documents
* [`Markdown All in One`](#markdown-all-in-one) - Markdown linting and style checking along with syntax highlighting.  This also provides a live preview
* [`Material Icon Theme`](material-icon-theme) - Great set of icons and looks really great in dark mode.
* [`Python`](#python) - Linting, Debugging (multi-threaded, remote), code formatting, refactoring, unit tests, and more
* [`Remote Workspace`](#remote-workspace) - multi-protocol support (like, Azure, S3, FTP(S), SFTP...) for handling remote files like local ones.
* [`Sort Lines`](#sort-lines) - various sorting routines
* [`SVN`](#svn) - integrated subversion
* [`Uncrustify`](#uncrustify) - nicely handles the coding standards for the Renaissance products
* `Visual Studio Keymap` - popular visual studio keybindings

-------------------

## autoconf ##

[![autoconf ](icons/autoconf_icon.png)  
By: maelvalais](https://marketplace.visualstudio.com/items?itemName=maelvalais.autoconf)

-------------------

## bitbakers-dozen ##

[![bitbakers-dozen ](icons/bitbakers-dozen.png)  
By: Bernard Bergan](https://marketplace.visualstudio.com/items?itemName=bbergan.bitbakers-dozen)

-------------------

## Bracket Pair Colorizer 2 ##

[![Bracket Pair Colorizer 2](icons/bracket-pair-colorizer_icon.png)  
By: CoenraadS](https://marketplace.visualstudio.com/items?itemName=CoenraadS.bracket-pair-colorizer-2)

-------------------

## C/C++ ##

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

### Install `C/C++` extension ###

Click on the squarish icon on the left-hand side of the workspace.  In the search bar bar at the top enter "C/C++".  You should see purple circle with a white bar across the middle with C/C++ emblazoned.  Click on the "install" button.  Then click on the "Refresh to Load" button.  

### Configure `C/C++` extension ###

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
        "${workspaceFolder}\\**\\**\\**\\**\\**",
        "C:/msys64/usr/lib/gcc/x86_64-pc-msys/7.3.0/include/c++",
        "C:/msys64/usr/lib/gcc/x86_64-pc-msys/7.3.0/include/c++/x86_64-pc-msys",
        "C:/msys64/usr/lib/gcc/x86_64-pc-msys/7.3.0/include/c++/backward",
        "C:/msys64/usr/lib/gcc/x86_64-pc-msys/7.3.0/include",
        "C:/msys64/usr/lib/gcc/x86_64-pc-msys/7.3.0/include-fixed",
        "C:/msys64/usr/include",
        "C:/msys64/usr/include/w32api"
      ]
    },
  ],
  "version": 4
}
```

The previous is an example that can be used.  An even better example includes the header files from the product (such as UMG, Firebird, or whatever).

### Configuring launch.json for debugging ###

For help configuring the debugger see [Configuring launch.json for C/C++ debugging](https://github.com/Microsoft/vscode-cpptools/blob/master/launch.md)

-----------------------

## C/C++ Advanced Lint ##

[![C/C++ Advanced Lint](icons/C-Cpp-FlyLint_icon.png)  
By: Joseph Benden](https://marketplace.visualstudio.com/items?itemName=jbenden.c-cpp-flylint)

This extension can be used to accomplish the same as `cppcheck` on the Linux side.  For that matter this extension can use several different checkers/linters including `cppcheck`.

```JSON
{
    "c-cpp-flylint.cppcheck.enable": true,
    "c-cpp-flylint.cppcheck.executable": "C:/path/to/cppcheck.exe",
    "c-cpp-flylint.cppcheck.includePaths": [
        "list of include paths (usually from msys64)"
    ],
    "c-cpp-flylint.run": "onType"
}
```

-----------------------

## EditorConfig for VS Code ##

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

### install `EditorConfig for VS Code` extension ###

Select the squarish icon on the left and enter "editorconfig" into the search box at the top. You are looking for the extension by "EditorConfig".  Click "Install" and then click "Refresh" button.


------------------------------

## ftp-sync ##

[![ftp-sync ](icons/ftp-sync_icon.png)  
By: Lukasz Wronski](https://marketplace.visualstudio.com/items?itemName=lukasz-wronski.ftp-sync)

### install `ftp-sync` extension ###

Select the squarish icon on the left of the workspace and enter "ftp-sync" in the search box at the top.  You are looking for the extension by "Lukasz Wronski".  Click "Install" and then click "Refresh to Load" button.

See the section below for configuring the `ftp-sync` extension for your sandbox.

### configure `ftp-sync` extension ###

Open `vscode` in your new sandbox.
Press the `F1` key and enter "ftp-sync" and select the "ftp-sync: Init" command.

**`.vscode/ftp-sync.json`**
```JSON
{
    "remotePath": "<your-sandbox-on-build-server>",
    "host": "<build-server-name>",
    "username": "<your-username-on-build-server>",
    "port": 22,
    "secure": true,
    "protocol": "sftp",
    "uploadOnSave": true,
    "passive": false,
    "debug": false,
    "privateKeyPath": "<path-to-id_rsa-on-pc>",
    "passphrase": null,
    "ignore": [
        "\\.vscode",
        "\\.git",
        "\\.svn",
        "\\.DS_Store",
        "build.bat",
        "[A-Za-z0-9._-]*.code-workspace"
    ],
    "generatedFiles": {
        "uploadOnSave": false,
        "extensionsToInclude": [],
        "path": ""
    }
}
```

------------------------------

## GitHub Issues and PRs ##

[![GitHub Issues and PRs](icons/github-issues_icon.png)  
By: Microsoft](https://marketplace.visualstudio.com/items?itemName=ms-vscode.github-issues-prs)

```JSON
{
  "github.repositories": [
    "renaissance-code/firebird"
  ],
  "github.host": "ghe.int.vertivco.com",
  "github.username": "your-user-name"
}
```

------------------------------

## GitHub Pull Requests ##

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

## GitLens ##

[![GitLens ](icons/gitlens-icon.png)  
By: Eric Amodio](https://marketplace.visualstudio.com/items?itemName=eamodio.gitlens)

```JSON
{
  "gitlens.advanced.messages": {
    "suppressShowKeyBindingsNotice": true
  },
  "gitlens.views.fileHistory.enabled": true,
  "gitlens.views.lineHistory.enabled": true,
  "gitlens.defaultDateStyle": "absolute",
}
```

------------------------------

## indent-rainbow ##

[![indent-rainbow ](icons/indent-rainbow.png)  
By: oderwat](https://marketplace.visualstudio.com/items?itemName=oderwat.indent-rainbow)


------------------------------

## Markdown All in One ##

[![Markdown All in One](icons/Markdown-mark.png)  
By: Yu Zhang](https://marketplace.visualstudio.com/items?itemName=yzhang.markdown-all-in-one)

------------------------------

## Material Icon Theme ##

[![Material Icon Theme](icons/Material-Icon-Theme.png)  
By: Philipp Kief](https://marketplace.visualstudio.com/items?itemName=PKief.material-icon-theme)

------------------------------

## Python ##

[![Python ](icons/python_icon.png)  
By: Microsoft](https://marketplace.visualstudio.com/items?itemName=ms-python.python)

```JSON
{
  "python.autoComplete.addBrackets": true,
  "python.linting.enabled": true,
  "python.linting.lintOnSave": true,
  "[python]": {
    "editor.tabSize": 4,
    "editor.insertSpaces": true
  },
}
```

------------------------------

## RECORE ##

[![RECORE ](icons/recore_icon.png)  
By: Alibaba XUX](https://marketplace.visualstudio.com/items?itemName=alixux.recore)

------------------------------

## Remote Workspace ##

[![Remote Workspace](icons/remote-workspac_icon.png)  
By: Marcel J. Kloubert](https://marketplace.visualstudio.com/items?itemName=mkloubert.vscode-remote-workspace)

Adds functionality to the built-in capabilities of `vscode` regarding workspaces.

--------------------------------

## SVG ##

[![SVG Viewer](icons/svg-viewer_icon.png)  
By: cssho](https://marketplace.visualstudio.com/items?itemName=cssho.vscode-svgviewer)

--------------------------------

## SVN ##

[![Subversion ](icons/subversion.png)  
By: Chris Johnston](https://marketplace.visualstudio.com/items?itemName=johnstoncode.svn-scm)

```JSON
{
  "svn.enabled": true,
  "svn.path": "C:\\Program Files\\TortoiseSVN\\bin\\svn.exe",

}
```

--------------------------------

## Uncrustify ##

[![Uncrustify ](icons/uncrustify.png)  
By: LaurentTreguier](https://marketplace.visualstudio.com/items?itemName=LaurentTreguier.uncrustify)


This extension is really handy as it will allow you to quickly change your code to adhere to coding standards.

First install the `uncrustify` program on you PC (for the following examples we will assume that it is
installed in `C:\uncrustify`).

Then install the `Uncrustify` extension into vscode.

Now add the following into either your "USER SETTINGS" or your "WORKSPACE SETTINGS".

```JSON-with-comments
{
  // disable the default formatting provided by the C/CPP extension
  "C_CPP.formatting": "Disabled",
  // identify the correct location of the executable
  "uncrustify.executablePath": "C:\\uncrustify\\uncrustify.exe"
}
```

Then add the following to your "WORKSPACE SETTINGS"

```JSON
{
  "uncrustify.configPath": "refs/beautify/conf/uncrustify.cfg"
}
```

> This is assuming that you are using the standard sandbox.  If not correct for the location of the downloaded `beautify` repository.

Then all you need to do is right mouse on an open document and select "Format Document"... Tada! formatted document.
