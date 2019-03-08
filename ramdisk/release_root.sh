#!/bin/sh
mount -o remount rw /system
default_prop=/system/etc/prop.default
if [ "$1" = "execute_root" ] ; then
    sed -i 's/ro.secure=1/ro.secure=0/g' $default_prop
    sed -i 's/ro.adb.secure=1/ro.adb.secure=0/g' $default_prop
    sed -i 's/ro.debuggable=0/ro.debuggable=1/g' $default_prop
    chmod 600 $default_prop
    sync

elif [ "$1" = "cancel_root" ] ; then
    sed -i 's/ro.secure=0/ro.secure=1/g' $default_prop
    sed -i 's/ro.adb.secure=0/ro.adb.secure=1/g' $default_prop
    sed -i 's/ro.debuggable=1/ro.debuggable=0/g' $default_prop
    chmod 600 $default_prop
    sync
fi