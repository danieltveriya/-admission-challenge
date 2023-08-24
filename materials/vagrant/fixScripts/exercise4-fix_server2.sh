#!/bin/bash
#Add to /etc/hosts ip and record for server2
echo "192.168.60.10 server1" | sudo tee -a /etc/hosts


#add fix to exercise4-server1 here
/etc/hosts is a text file used by operating systems including windows to map IP addresses to host names/domain names.
I added server1 namd and ip, after this change i can connect to server1 via ssh with the name I configure at /etc/hosts