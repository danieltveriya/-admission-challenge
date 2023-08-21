#!/bin/bash
#add fix to exercise1 here
sudo ip route del 208.86.224.90/32 dev enp0s8


#What went wrong
The issue  was likely caused by a routing problem related to the route entry "208.86.224.90 dev enp0s8 scope link src 192.168.60.10" in routing table.
This route might have been causing network traffic intended for the host "208.86.224.90" to be directed through the interface "enp0s8" with source IP "192.168.60.10." 
Since this route entry seemed out of place, it could have been interfering with  system's ability to connect to external hosts on the internet, leading to the "No route to host" error when trying to use curl.