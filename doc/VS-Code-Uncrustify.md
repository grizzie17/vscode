# `Uncrustify` Extension #

This extension is really handy as it will allow you to quickly change your code to adhere to our coding standards.

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
"uncrustify.configPath": "uncrustify.cfg"
```


Then all you need to do is right mouse on an open document and select "Format Document"... Tada! formatted document.

