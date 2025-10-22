#!/bin/sh

# Couleurs ANSI
GREEN="\033[1;32m"
CYAN="\033[1;36m"
RESET="\033[0m"

# Message d'accueil stylisé
echo -e "${CYAN}"
echo "====================================="
echo "     ⚰️  Welcome to ThanatOS ⚰️"
echo "====================================="
echo -e "${RESET}"

# Nettoyage des anciens TTYs
echo -e "${GREEN}>> Cleaning up old /dev/tty[1-4]...${RESET}"
rm -f /dev/tty1 /dev/tty2 /dev/tty3 /dev/tty4

# Création des TTY 1 à 4
echo -e "${GREEN}>> Creating /dev/tty1 to /dev/tty4...${RESET}"
for i in 1 2 3 4; do
    mknod -m 620 /dev/tty$i c 4 $i
    chown root:tty /dev/tty$i
done

# Création du TTY principal (/dev/tty)
if [ ! -e /dev/tty ]; then
    echo -e "${GREEN}>> Creating /dev/tty (controlling terminal)...${RESET}"
    mknod -m 666 /dev/tty c 5 0
fi

echo -e "${GREEN}>> TTY devices ready. ThanatOS is watching... 👁️${RESET}"

