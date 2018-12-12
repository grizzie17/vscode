# `git` Aliases #

If you're using the `git` command line a lot, you might already have your own `$HOME/.gitconfig` file set up perfectly.
But just in case you didn't yet, and you don't want to input the whole command name and options, e.g. I put following alias into my `$HOME/.gitconfig` file:

```config
[alias]
        ci = commit
        st = status
        co = checkout
        br = branch
        oneline = log --pretty=oneline
        hist = log --pretty=format:\"%h %ad | %s%d [%an]\" --graph --date=short
        type = cat-file -t
        dump = cat-file -p
```

And it also applies on Windows if you're using GitBash.

> Thanks to Ice Liu for this neat `git` hint.