[Go Home](../README.md)

---

# VS-Code Building on Windows #

## Settings ##

```JSONC
{
  "terminal.integrated.shell.windows": "C:\\msys64\\usr\\bin\\bash.exe",
	"terminal.integrated.shellArgs.windows":[ "--login", "-i" ],
	"terminal.integrated.env.windows": {
		"MSYSTEM": "MINGW64",
		"CHERE_INVOKING": "1"
	},

}
```


## Configure C/C++ Extension ##


```JSONC
{
  "configurations": [
    {
      "name": "MSYS",
      "intelliSenseMode": "gcc-x64",
      "compilerPath": "C:\\msys64\\mingw64\\bin\\x86_64-w64-mingw32-g++.exe",
      "cStandard": "c11",
      "cppStandard": "c++17",
      "defines": [
        "_DEBUG",
        "WIN64",
        "__MINGW64__"
      ],
      "includePath": [
        ".",
        "${fileDirname}",
        "${workspaceFolder}",
        "${workspaceFolder}\\**",
        "${workspaceFolder}\\**\\**",
        "${workspaceFolder}\\**\\**\\**"
      ]
    },
  ],
  "version": 4
}

```


---

[Go Home](../README.md)
