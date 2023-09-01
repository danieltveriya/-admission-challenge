#!/bin/bash

# Generate SSH keys for vagrant user on server1
echo yes | ssh-keygen -f /home/vagrant/.ssh/id_rsa -N ''
chown -R vagrant:vagrant /home/vagrant/.ssh/
cp /home/vagrant/.ssh/id_rsa.pub /vagrant/server1_vagrant_id_rsa.pub

# Generate SSH keys for vagrant user on server2
echo yes | ssh-keygen -f /home/vagrant/.ssh/server2_id_rsa -N ''
cp /home/vagrant/.ssh/server2_id_rsa /home/vagrant/.ssh/server2_id_rsa.pub /vagrant/

# Add server2's public key to vagrant user's authorized_keys
cat /home/vagrant/.ssh/server2_id_rsa.pub >> /home/vagrant/.ssh/authorized_keys

# Generate SSH keys for root user on server1
echo yes | ssh-keygen -f /root/.ssh/id_rsa -N ''
cp /root/.ssh/id_rsa.pub /vagrant/server1_root_id_rsa.pub

# Generate SSH keys for root user on server2
echo yes | ssh-keygen -f /root/.ssh/server2_root_id_rsa -N ''
cp /root/.ssh/server2_root_id_rsa /root/.ssh/server2_root_id_rsa.pub /vagrant/

# Add server2's public key to root user's authorized_keys
cat /root/.ssh/server2_root_id_rsa.pub >> /root/.ssh/authorized_keys

# Set permissions for SSH keys and directories
chmod 700 /root/.ssh
chmod 600 /root/.ssh/id_rsa
chmod 644 /root/.ssh/id_rsa.pub

chmod 700 /home/vagrant/.ssh
chmod 600 /home/vagrant/.ssh/id_rsa
chmod 644 /home/vagrant/.ssh/id_rsa.pub

# Configure SSH for vagrant and root users
cat <<EOF >/home/vagrant/.ssh/config
Host *
    StrictHostKeyChecking no
    UserKnownHostsFile /dev/null
EOF

cat <<EOF >/root/.ssh/config
Host *
    StrictHostKeyChecking no
    UserKnownHostsFile /dev/null
EOF

# Enable PubkeyAuthentication and disable direct root login
echo "PubkeyAuthentication yes" >> /etc/ssh/sshd_config
echo "PermitRootLogin prohibit-password" >> /etc/ssh/sshd_config

# Restart SSH service
systemctl restart sshd
