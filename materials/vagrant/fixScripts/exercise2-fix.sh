#!/bin/bash
cat /etc/hosts

sudo sed -i '/^127\.0\.0\.1[[:space:]]\+www\.ascii-art\.de/d' /etc/hosts


#add fix to exercise2 here
The problem was that domain www.ascii-art.de was configured to trnsalte to 127.0.0.1 instead the real ip of the site.

cat /etc/hosts
127.0.0.1       localhost

::1     ip6-localhost   ip6-loopback
fe00::0 ip6-localnet
ff00::0 ip6-mcastprefix
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters
ff02::3 ip6-allhosts
127.0.1.1       ubuntu-focal    ubuntu-focal

#domain www.ascii-art.de was configured to trnsalte to 127.0.0.1
127.0.2.1 server1 server1
127.0.0.1 www.ascii-art.de

Then I deleted the  127.0.0.1 www.ascii-art.de line with the command:
sudo sed -i '/^127\.0\.0\.1[[:space:]]\+www\.ascii-art\.de/d' /etc/hosts
