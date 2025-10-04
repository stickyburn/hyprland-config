#!/bin/bash

# Check if tun0 interface exists (VPN connected)
if ip link show tun0 >/dev/null 2>&1; then
    echo "{\"text\": \"\", \"class\": \"connected\", \"tooltip\": \"VPN Connected\"}"
else
    echo "{\"text\": \"\", \"class\": \"disconnected\", \"tooltip\": \"VPN Disconnected\"}"
fi