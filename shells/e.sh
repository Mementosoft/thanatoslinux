#!/bin/sh

# Message de bienvenue avec couleur rouge pour "ThanatOS"
RED='\033[0;31m'
NC='\033[0m' # No Color

clear

echo ""
echo "========================================"
echo -e "     Welcome to ${RED}ThanatOS${NC} - Minimal Linux"
echo "========================================"
echo ""

# Créer les TTY manquants avec les bons droits
mknod -m 620 /dev/tty2 c 4 2
mknod -m 620 /dev/tty3 c 4 3
mknod -m 620 /dev/tty4 c 4 4

echo "If you see errors about missing /dev/tty*, don't worry, they have been created now."
echo "You want internet? Just run ./net-config.sh You have to know your network details."