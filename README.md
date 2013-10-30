ssh-tunnel-daemon
=================

Forwards ports to remote hosts using SSH tunnels

Requisites:
* autossh

Usage:

	./ssh-tunnel-daemon.sh <hosts_file>

Syntax of hosts file:

```
# Connect to HOST[X]:REMOTE_PORT[X] from localhost:LOCAL_PORT[X] using REMOTE_USER[X]
i=0
HOST[$i]="remotehost1"
REMOTE_PORT[$i]=5555
LOCAL_PORT[$i]=6000
REMOTE_USER[$i]="user1"

i=$i+1
HOST[$i]="remotehost2"
REMOTE_PORT[$i]=5555
LOCAL_PORT[$i]=6001
REMOTE_USER[$i]="user2"
```

Opens two tunnels:

```
=> Tunneling localhost:6000 to user1@remotehost1:5555
=> Tunneling localhost:6001 to user2@remotehost2:5555
```

Remember that the user executing the `ssh-tunnel-daemon.sh` must be able to connect via SSH to the remote host using the specified remote user without interactive password prompt (i.e. using certificates)!
