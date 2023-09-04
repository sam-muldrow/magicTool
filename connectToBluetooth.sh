#!/usr/bin/bash

#Set magic keyboard and magic mouse addresses
MAGIC_MOUSE_MAC="<MAGIC_MOUSE_MAC_ADDRESS>"
MAGIC_KEYBOARD_MAC="<MAGIC_KEYBOARD_MAC_ADDRESS>"

# Start up the blueooth daemon incase it is not running
echo "Starting bluetooth daemon"
systemctl start bluetooth
sleep 5
BTSTATUS=$(systemctl status bluetooth)

# Show start up result
echo "Bluetooth dameon status: ${BTSTATUS}"

# Remove mouse and keyboard to ensure clean connection
bluetoothctl remove $MAGIC_MOUSE_MAC
sleep 5

bluetoothctl remove $MAGIC_KEYBOARD_MAC
sleep 5

# Scan for 10 seconds to find keyboard and mouse
bluetoothctl --timeout 10 scan on


# Connect to keyboard and mouse
bluetoothctl trust $MAGIC_MOUSE_MAC
sleep 5
bluetoothctl disconnect $MAGIC_MOUSE_MAC
sleep 5
bluetoothctl connect $MAGIC_MOUSE_MAC
sleep 5

bluetoothctl trust $MAGIC_KEYBOARD_MAC
sleep 5
bluetoothctl disconnect $MAGIC_KEYBOARD_MAC
sleep 5
bluetoothctl connect $MAGIC_KEYBOARD_MAC
sleep 5

# Show connected bluetooth devices
BTDEVICES=$(bluetoothctl devices)
echo="${BTDEVICES}"

# Disable middle click on magic mouse because it was giving me issues
rmmod hid_magicmouse
modprobe hid_magicmouse emulate_3button=0
