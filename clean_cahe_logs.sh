#!/bin/bash

# Clean PM2 logs
sudo rm -rf ~/.pm2/logs/*

# Clean APT cache
sudo apt-get clean

# Clean cached package files
sudo apt-get autoclean

# Clear temporary files
sudo rm -rf /tmp/*

# Clean systemd journal logs
sudo journalctl --vacuum-size=100M

# Clear cached memory
sudo sh -c "echo 3 > /proc/sys/vm/drop_caches"

