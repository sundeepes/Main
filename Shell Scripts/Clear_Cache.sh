#!/bin/bash

# Clear package manager cache
sudo apt clean
sudo dnf clean all
sudo yum clean all

# Clear user-specific cache
rm -rf ~/.cache/*

# Clear system logs
sudo journalctl --vacuum-time=1d

echo "Caches have been cleared."
