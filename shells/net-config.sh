#!/bin/sh

echo "=== ThanatOS Network Configuration ==="

# Ask for network interface
echo -n "Enter network interface name (e.g. eth0): "
read IFACE

# Ask for static IP address
echo -n "Enter static IP address for $IFACE (e.g. 192.168.0.42): "
read IPADDR

# Ask for gateway IP
echo -n "Enter gateway IP address (e.g. 192.168.0.254): "
read GATEWAY

# Default DNS
DNS="1.1.1.1"

# Apply configuration
echo "[+] Bringing up interface $IFACE..."
ip link set "$IFACE" up

echo "[+] Assigning IP address $IPADDR..."
ip addr flush dev "$IFACE"
ip addr add "$IPADDR/24" dev "$IFACE"

echo "[+] Adding default route via $GATEWAY..."
ip route add default via "$GATEWAY"

echo "[+] Setting DNS to $DNS..."
echo "nameserver $DNS" > /etc/resolv.conf

echo "[✓] Network configured. Testing connectivity:"
ping -c 3 "$GATEWAY"
