#!/bin/bash
# startup.sh

sudo sed -i '/dhcp/s/^/#/' /etc/network/interfaces

sudo shutdown -r now

