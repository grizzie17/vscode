[Go Home](../README.md)

---

# Settings #

Settings in VS-Code is hierarchical with three tiers.  There are **User Settings** which apply to all *Workspaces* (sandboxes) for the user. There are **Workspace Settings** that apply to the current sandbox.  Then there are **Folder Settings**.  Settings are stored in JSON files or JSON-with-comments files.  Many of the more common settings have a nice set of configuration pages that allow you to select settings without editing the JSON directly.  For brevity and consistency, I will be using the JSON to represent the settings (unless it involves an extension

Settings for editors are very personal.  But hopefully, these settings may inspire you as you decide on your settings.

## Dark Theme ##

I like a dark theme, but good contrast (for older eyes).

**User Settings**
```jsonc
{
  // built-in color-theme (just select File->Preferences->Color Theme)
  "workbench.colorTheme": "Visual Studio Dark",
  // This is a very clean icon-theme which is great in dark-mode
  // There are plenty more for you to try if you wish.
  "workbench.iconTheme": "vscode-icons",
  // This will change the title-bar of the workspace to also be dark.
  //  The menus also move into the title bar.
  "window.titleBarStyle": "custom",
}
```

## Fonts, Linespacing, Whitespace ##

**User Settings**
```jsonc
{
  "editor.fontSize": 18,               // I like a larger font
  "editor.fontWeight": "500",          // with slightly more thickness
  "editor.lineHeight": 19,             // and a little tighter than the default

  "editor.renderWhitespace": "none",   // no dots or arrows to clutter up things
  "editor.renderIndentGuides": true,   // help show the indentation
  "editor.lineNumbers": "on",          // yes I like line numbers
  "editor.wordWrap": "on",             // word wrap long lines
  "editor.tabSize": 4,                 // number of spaces for a tab
  "editor.minimap.enabled": false,     // your choice
  "editor.minimap.renderCharacters": false,  // lots faster
}
```

For a really great programmer's font download 
[FiraCode](https://github.com/tonsky/FiraCode) and install it.
Then add the following to your **User Settings**

```jsonc
{
  "editor.fontLigatures": true,
  "editor.fontFamily": "'Fira Code', Consolas, 'Courier New', monospace",
}
```

To get the real benefits from this font you must enable `fontLigatures`.

## Key Maps ##

There are lots of different key maps to keep you happy.  I was raised with Microsoft's Visual Studio so I installed their "Visual Studio Keymap" by Microsoft.  But to let you know just a few of the available key-maps (no particular order):

* Vim
* Atom
* Visual Studio
* Sublime
* IntelliJ IDEA
* Eclipse
* Eclipse/PyDev
* Notepad++
* Emacs
* Delphi
* JetBrains IDE
* Netbeans
* ...

To be real honest, I don't know which keymap is the "default".  I don't think that it is one of the listed.

## Language Specific Settings ##

**User Settings**
```jsonc
{
  "editor.tabSize": 4,
  "editor.insertSpaces": true,
  "editor.trimAutoWhitespace": true,
  "files.trimFinalNewlines": true,
  "files.trimTrailingWhitespace": true,
  "[markdown]": {
    "editor.trimAutoWhitespace": false,
    "editor.insertSpaces": true,
    "editor.tabSize": 2,
    "files.trimTrailingWhitespace": false
  },
  "[php]": {
    // default word-separators minus '$'
    // allow the '$' to be included when you double-click a php variable
    "editor.wordSeparators": "`~!@#%^*()-=+[{]}\\|;:'\",.<>/?",
    "editor.insertSpaces": false
  },
  "[makefile]": {
    "editor.insertSpaces": false
  },
  "[python]": {
    "editor.insertSpaces": true
  },
}
```

## Files and Such ##

```jsonc
{
  // very handy: even lets you traverse through functions and the like
  "breadcrumbs.enabled": true,
  "breadcrumbs.symbolSortOrder": "name",

  "files.exclude": {
    // don't process this "Windows" specific file
    "desktop.ini": true
  }
}
```


---

[Go Home](../README.md)
