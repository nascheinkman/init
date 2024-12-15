# Linux

## Initialize gnupg Directories
This could be done at the same time as detecting if the yubikey is detected with
```sh
gpg --card-status
```

## Enable gpg ssh
```sh
echo "enable-ssh-support" > ~/.gnupg/gpg-agent.conf
```

## Setup gpg agent
Add the following to your `~/.bashrc`
```sh
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent
```

# Retrieving the SSH key on Linux

First, download the key from openpgp.org
```sh
gpg --keyserver hkps://keys.openpgp.org --search-keys KEY_ID
```

Then, export the ssh key

```sh
gpg --export-ssh-key KEY_ID
```

# Qubes Split GPG SSH
Commands from here:
https://privsec.dev/posts/qubes/using-split-gpg-and-split-ssh-on-qubes-os/

## In `ssh_client` AppVM

Add the following to `/rw/config/rc.local`:
```
SSH_VAULT_VM="vmname"

export SSH_SOCK="/home/user/.SSH_AGENT_$SSH_VAULT_VM"
rm -f "$SSH_SOCK"
sudo -u user /bin/sh -c "umask 177 && exec socat 'UNIX-LISTEN:$SSH_SOCK,fork' 'EXEC:qrexec-client-vm $SSH_VAULT_VM qubes.SshAgent'" &
```

Add the following to the end of `~/bash.rc`:
```
SSH_VAULT_VM="vmname"
export SSH_AUTH_SOCK="/home/user/.SSH_AGENT_$SSH_VAULT_VM"
```

Restart `ssh-client` and confirm it's working with `ssh-add -L`
