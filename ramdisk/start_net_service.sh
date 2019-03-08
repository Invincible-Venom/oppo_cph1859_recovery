#!/sbin/sh

toybox chcon u:object_r:netd_exec:s0 /sbin/netd
toybox start netd
mount /dev/block/platform/bootdevice/by-name/nvdata /vendor/nvdata
sleep 1
echo 1 > /dev/wmtWifi
busybox ifconfig -a > /tmp/ifconfig.txt
sleep 3
mkdir -p /data/misc/wifi/sockets
busybox chown 1010:1010 /data/misc/wifi/sockets
busybox chmod 0770 /data/misc/wifi/sockets
toybox chcon u:object_r:wpa_socket:s0 /data/misc/wifi/sockets
touch /data/misc/wifi/wpa_supplicant.conf
busybox chown 1010:1010 /data/misc/wifi/wpa_supplicant.conf
busybox chmod 0770 /data/misc/wifi/wpa_supplicant.conf
sleep 3
toybox start wpa_supplicant
