[Go Home](../README.md)

---

# Remote Workflows with VS-Code #

Any time you are editing Linux files using VS-Code for Windows you are going to need use some sort of remote workflow.

## ftp-sync ##

This workflow creates a local sandbox on Windows that basically mirrors a specific sandbox on the remote. Then uses the `ftp-sync` extension to sync between the two.  You can easily setup `ftp-sync` to automatically sync when you save a file, or sync bulk directories.  `ftp-sync` works best when your local sandbox is setup as a "directory" to VS-Code.

### Creating your PC-Local sandbox ###

> This workflow assumes that you have [MSYS2](VS-Code-MSYS2) installed on your PC.

Create a new folder (most likely in your Documents folder).
Open MSYS2 and `cd /c/Users/your-name/Documents/your-sandbox`

```sh
cd /c/Users/your-name/Documents/your-sandbox
git clone https://ghe.int.vertivco.com/renaissance-code/firebird content
./content/pull.sh
```

> This takes a bit longer to run than on one of the build-servers.

Do a similar operation on the build-server to setup a remote sandbox.  We will be hooking these two sandboxes shortly.

### Configure `ftp-sync` ###

Please see the [`ftp-sync`](VS-Code-Extensions#ftp-sync) sub-section on the Extensions page.


## Remote Workspace ##

If you would prefer having all of your files on the remote server you can use the `Remote Workspace` extension.  This extension adds a set of protocols to vs-code's built-in "workspace".

So, as an example you create a sandbox on `hsv-tor3`, your workspace settings might look something like:

```json
{
    "folders": [
        {
            "uri": "sftp://your-name@hsv-tor3.int.vertivco.com/home/your-name/your-sandbox?key=id_rsa.ppk"
        }
    ]
}
```

And after you select from the menu "File->Open Workspace" and select your workspace file; you will have a vs-code file explorer that behaves correctly but is actually referencing the remote file-system.

> The primary disadvantage is the lack of integrated git tools.


---

[Go Home](../README.md)



