#!/bin/bash

# Check if tun0 interface exists (VPN connected)
if ip link show tun0 >/dev/null 2>&1; then
    # Get public IP address
    PUBLIC_IP=$(curl -s --max-time 2 https://ipinfo.io/ip 2>/dev/null || echo "N/A")
    echo "{\"text\": \" $PUBLIC_IP\", \"class\": \"connected\", \"tooltip\": \"VPN Connected - IP: $PUBLIC_IP\"}"
else
    echo "{\"text\": \"\", \"class\": \"disconnected\", \"tooltip\": \"VPN Disconnected\"}"
fi