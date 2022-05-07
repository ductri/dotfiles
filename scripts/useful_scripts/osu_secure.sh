# nmcli con add type wifi ifname wlan0 con-name CONNECTION_NAME ssid SSID
# nmcli con edit id CONNECTION_NAME
nmcli> set ipv4.method auto
nmcli> set 802-1x.eap peap
nmcli> set 802-1x.phase2-auth mschapv2
nmcli> set 802-1x.identity USERNAME
nmcli> set 802-1x.password PASSWORD
nmcli> set 802-1x.anonymous-identity ANONYMOUS-IDENTITY
nmcli> set wifi-sec.key-mgmt wpa-eap
nmcli> save
nmcli> activate
# https://askubuntu.com/questions/262491/connect-to-a-wpa2-enterprise-connection-via-cli-no-desktop
