[Go Home](../README.md)

---

# Using new `remote-ssh` extension

The new `remote-ssh` extension fixes the kludges that you used to need to do true remote development.

The `remote-ssh` extension splits the work across the two machines.  One is the 'client' running the VS-Code UI. The other is the remote machine operating as the `ssh server`.  With the new extension architecture you get the full intellisense on the UI with data served from the 'ssh server'.

## Setup ##

First assure that you can connect to the 'ssh-server' without needing to enter a password.

Install the `remote` extension, which actually installs three extensions: `remote-ssh`, `remote-wsl` and `remote-containers`.

## Prepare Remote Workspace ##

Using `ssh`, login to the remote server. 

Populate the remote workspace with the source code that is needed for development.

## Connect ##

Run `code` on the local machine

Press `F1` to open the command pallet window

Enter `remote-ssh`

You should be prompted for the desired server to which you want to connect.  Enter the connect string, such as: `user@hostname:port`

Select the `Open Remote Folder` button from the `EXPLORER` pane.  Browse to the remote workspace you previously created.

You will see that VS-Code is installing certain extensions on the remote server.  Once it is complete you are ready for use.


---

[Go Home](../README.md)
