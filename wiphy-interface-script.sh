#!/bin/bash

# Disable managed mode for wlan0
sudo nmcli dev set wlan0 managed false

# Take wlan0 down
sudo ifconfig wlan0 down

# Set wlan0 MAC address
sudo ifconfig wlan0 hw ether 70:B3:D5:7D:80:01

# Bring wlan0 up
sudo ifconfig wlan0 up

# Set bitrates for wlan0
sudo iw wlan0 set bitrates legacy-2.4 6 9 12 18 24 48 54

# Add monitor interface
sudo iw dev wlan0 interface add mon0 type monitor

# Bring up monitor interface
sudo ifconfig mon0 up

# Configure wlan0 IP address
sudo ifconfig wlan0 10.0.0.1

# Set wlan0 down
sudo ip link set wlan0 down

# Set wlan0 type to monitor
sudo iw dev wlan0 set type monitor

# Set frequency for wlan0
sudo iw dev wlan0 set freq 5825

# Bring wlan0 up
sudo ip link set wlan0 up

# Configure wlan0 IP address again
sudo ifconfig wlan0 10.0.0.1

# Restart isc-dhcp-server service
sudo service isc-dhcp-server restart
