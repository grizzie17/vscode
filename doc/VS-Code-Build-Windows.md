# VS-Code Building on Windows #


## Configure C/C++ Extension ##


```JSON
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
