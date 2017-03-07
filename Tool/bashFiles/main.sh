#!/bin/bash
# Nombre: main.sh
# Description: Main Script
#############################

# Global Parameters
set -e # No errors allowed

#############################

whiptail --title "BashTool_GSerial" --msgbox "Setting USB OTG in G_Serial mode..." 10 60 0

echo "g_serial" >> /etc/modules
echo "ttyGS0" >> /etc/securetty
mkdir -p /etc/systemd/system/serial-getty@ttyGS0.service.d

echo "[Service]" > /etc/systemd/system/serial-getty@ttyGS0.service.d/10-switch-role.conf
echo 'ExecStartPre=-/bin/sh -c "echo 2 > /sys/bus/platform/devices/sunxi_usb_udc/otg_role"' >> /etc/systemd/system/serial-getty@ttyGS0.service.d/10-switch-role.conf

systemctl --no-reload enable serial-getty@ttyGS0.service

whiptail --title "BashTool_GSerial" --msgbox "Patch successfully apply. It is necessary reboot the system." 10 60 0

reboot