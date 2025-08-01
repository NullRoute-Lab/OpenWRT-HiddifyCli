# Update opkg and install necessary packages
opkg update
opkg install coreutils-nohup curl wget jq

# Copy configuration and ALL helper scripts to /root
cp -f hiddify-conf.json /root/hiddify-conf.json
cp -f hiddify-openvpn-conf.json /root/hiddify-openvpn-conf.json
cp -f hiddify_watchdog.sh /root/hiddify_watchdog.sh
cp -f hiddify_openvpn_watchdog.sh /root/hiddify_openvpn_watchdog.sh
cp -f update_subscriptions.sh /root/update_subscriptions.sh
cp -f -R openvpn /root/openvpn

# Make the scripts in /root executable
chmod +x /root/hiddify_watchdog.sh
chmod +x /root/hiddify_openvpn_watchdog.sh
chmod +x /root/update_subscriptions.sh

# Copy the main service script to init.d and make it executable
cp -f service/hiddify /etc/init.d/hiddify
chmod +x /etc/init.d/hiddify

# Enable and start the service
/etc/init.d/hiddify enable
/etc/init.d/hiddify start
