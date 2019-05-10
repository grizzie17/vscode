[Go Home](../README.md)

---

# Using new `remote-ssh` extension

The new `remote-ssh` extension fixes the kludges that you used to need to do true remote development.

The `remote-ssh` extension splits the work across the two machines.  One is the 'client' running the VS-Code UI. The other is the remote machine operating as the 'ssh server'.  With the new extension architecture you get the full intellisense on the UI with data served from the 'ssh server'.

## Setup ##

First assure that you can connect to the 'ssh-server' without needing to enter a password.

For now... install the `insiders` addition of VS-Code (which is required for the `remote-ssh` extension).

Install the `remote` extension, which actually installs three extensions: `remote-ssh`, `remote-wsl` and `remote-containers`.

## Prepare Remote Workspace ##

Using `ssh`, login to the remote server. 

Populate the remote workspace with the source code that is needed for development.

## Connect ##

Run `code-insiders` on the local machine

Press `F1` to open the command pallet window

Enter `remote-ssh`

You should be prompted for the desired server to which you want to connect.  Enter the connect string, such as: `user@hostname:port`

Select the `Open Remote Folder` button from the `EXPLORER` pane.  Browse to the remote workspace you previously created.

You will see that VS-Code is installing certain extensions on the remote server.  Once it is complete you are ready for use.

---

# Remote Workflows with VS-Code #

Any time you are editing Linux files using VS-Code for Windows you are going to need use some sort of remote workflow.

## sftp ##

This workflow creates a local sandbox on Windows that basically mirrors a specific sandbox on the remote. Then uses the `sftp` extension to sync between the two.  You can easily setup `sftp` to automatically sync when you save a file, or sync bulk directories.  `sftp` works best when your local sandbox is setup as a "directory" to VS-Code.

### Creating your PC-Local sandbox ###

> This workflow assumes that you have [MSYS2](VS-Code-MSYS2.md) installed on your PC.

Create a new folder (most likely in your Documents folder).
Open MSYS2 and `cd /c/Users/your-name/Documents/your-sandbox`

```sh
cd /c/Users/your-name/Documents/your-sandbox
git clone https://github.com/group/repository.git content
./content/pull.sh
```

> This takes a bit longer to run than on one of the build-servers.

Do a similar operation on the build-server to setup a remote sandbox.  We will be hooking these two sandboxes shortly.

### Configure `sftp` ###

Please see the [`sftp`](VS-Code-Extensions.md#sftp) sub-section on the Extensions page.


## Remote Workspace ##

If you would prefer having all of your files on the remote server you can use the `Remote Workspace` extension.  This extension adds a set of protocols to vs-code's built-in "workspace".

So, as an example you create a sandbox on `bobs-server`, your workspace settings might look something like:

```json
{
    "folders": [
        {
            "uri": "sftp://your-name@bobs-server/home/your-name/your-sandbox?key=id_rsa.ppk"
        }
    ]
}
```

And after you select from the menu "File->Open Workspace" and select your workspace file; you will have a vs-code file explorer that behaves correctly but is actually referencing the remote file-system.

> The primary disadvantage is the lack of integrated git tools.


---

[Go Home](../README.md)
