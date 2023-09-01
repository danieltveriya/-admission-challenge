#!/bin/bash

# Copy SSH keys and authorized_keys for vagrant user
cp /vagrant/server2_id_rsa /home/vagrant/.ssh/id_rsa
cp /vagrant/server2_id_rsa.pub /home/vagrant/.ssh/id_rsa.pub
cat /vagrant/server1_vagrant_id_rsa.pub >> /home/vagrant/.ssh/authorized_keys
chown -R vagrant:vagrant /home/vagrant/.ssh/
chmod 700 /home/vagrant/.ssh
chmod 600 /home/vagrant/.ssh/id_rsa
chmod 644 /home/vagrant/.ssh/id_rsa.pub

# Copy SSH keys and authorized_keys for root user
cp /vagrant/server2_root_id_rsa /root/.ssh/id_rsa
cp /vagrant/server2_root_id_rsa.pub /root/.ssh/id_rsa.pub
cat /vagrant/server1_root_id_rsa.pub >> /root/.ssh/authorized_keys
chmod 700 /root/.ssh
chmod 600 /root/.ssh/id_rsa
chmod 644 /root/.ssh/id_rsa.pub

# Configure SSH for vagrant user
cat <<EOF >/home/vagrant/.ssh/config
Host *
    StrictHostKeyChecking no
    UserKnownHostsFile /dev/null
EOF

# Configure SSH for root user
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
