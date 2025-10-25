#!/bin/sh
echo "Fixing /etc/mtab..."
mkdir -p /etc
ln -sf /proc/self/mounts /etc/mtab
echo "/etc/mtab is ready!"
