#!/bin/sh
SSH_VAULT_VM=$1
SCRIPT_NAME=$0
if [ "$SCRIPT_NAME" != "-bash" ]; then
    echo "Make sure to run this script using 'source' instead of executing it as is"
    exit 1
fi

if [ "$SSH_VAULT_VM" != "" ]; then
    export SSH_SOCK="/home/user/.SSH_AGENT_$SSH_VAULT_VM"
    rm -f "$SSH_SOCK"
    sudo -u user /bin/sh -c "umask 177 && exec socat 'UNIX-LISTEN:$SSH_SOCK,fork' 'EXEC:qrexec-client-vm $SSH_VAULT_VM qubes.SshAgent'" &
    export SSH_AUTH_SOCK="/home/user/.SSH_AGENT_$SSH_VAULT_VM"
else
    echo "Missing VMNAME in argument"
fi
