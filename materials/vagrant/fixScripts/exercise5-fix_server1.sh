#!/bin/bash

#Create ssh certificate
ssh-keygen -t rsa

#Print id_rsa.pub content for copy to server2 
cat .ssh/id_rsa.pub

#Edit the SSH configuration file to disable strict host key checking.
echo -e "Host server2\n\tStrictHostKeyChecking no" >> ~/.ssh/config



#add fix to exercise5-server1 here
I created a ssh certificate usgin the keygen.
Then I print the content for id_rsa.pub for copy to the server2.
There a command to copy directly from server1 to server2 but according to the ex we dont have the user password for the server2.
Then I disable the strict host key check.