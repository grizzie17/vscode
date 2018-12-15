# `C/C++ Advanced Lint` Extension #

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