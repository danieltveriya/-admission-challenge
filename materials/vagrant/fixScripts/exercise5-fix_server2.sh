#!/bin/bash
#Write id_rsa.pub content from server1 
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQChlu/30zJaWOYRf5qADamophC53shSrGWFaCcBXuNl0TE5hGBnYa/aAhFC1Kv/+9rboaOwicu8cf9ajcJAxggXZWLmj856SMuTKTWPaOkYSl0WYPIsJmnNrV0ATYtrNWnd+N2PU0Axa78TuKsSO3r+ugNMdS41pfwx2sSKFcpaHZaUi5OpOrBdv0zk3EgNPiC6PFvQbbdnIkuy81UtUT4y4DthTUPeBdVXFlMkv6oI/2cRND4wcGYhastj/G8lXyMOSTjEtRzUl+RfvAlUuvs43VLEjKFPO4uq5TKy+538HlhoIgoow9S8iIK9e4hUInuctv9l5cDGHuWYPtTSgluyMmfvIj2MSuXUs0WjQSSjNy9q0VnOmK0menkBbwMxzJ1N/o58kXykUIFjPzDIz4JDwblAVoF6SVZ2RKCxrS+KBALaU/24WZhUoDhIjcPR3orGkHXm7sMqf+7iT2+757FHTy6OtJtg3aSTRL1tPN5mumEm/leKt5N85ktgjt2W0is= vagrant@server1" >> ~/.ssh/authorized_keys

#Disable StrictHostKeyChecking
echo "StrictHostKeyChecking no" | sudo tee -a /etc/ssh/ssh_config

#Restart ssh service
sudo service ssh restart

#add fix to exercise5-server2 here
Add rsa_pub contect from server1 to authorized_keys file on server2

Disable hostkey checking on server2

restart ssh service for changes will take effect.