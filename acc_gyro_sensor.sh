#!/bin/bash

dir=/sys/bus/iio/devices/

dev_count=`ls $dir | wc -l`
echo "$dev_count devices"

dev_count0=$(echo "(($dev_count))" | bc)
echo "$dev_count0"

zero0=0
if [ "$dev_count0" == "$zero0" ]; then
echo "$dev_count0 devices" , fail
exit
fi

dev_count1=$(echo "(($dev_count-1))" | bc)
echo "$dev_count1"

g=0;
while [ $g -ne $dev_count1 ]
do
name0=`cat /sys/bus/iio/devices/iio:device$g/name`

if [ $name0!=bmi160 ]; then
echo $((g++))
name0=`cat /sys/bus/iio/devices/iio:device$g/name`
echo "/sys/bus/iio/devices/iio:device$g/name=$name0"
rawx=`cat /sys/bus/iio/devices/iio:device$g/in_accel_x_raw`
echo "/sys/bus/iio/devices/iio:device$g/in_accel_x_raw=$rawx"
rawy=`cat /sys/bus/iio/devices/iio:device$g/in_accel_y_raw`
echo "/sys/bus/iio/devices/iio:device$g/in_accel_y_raw=$rawy"
rawz=`cat /sys/bus/iio/devices/iio:device$g/in_accel_z_raw`
echo "/sys/bus/iio/devices/iio:device$g/in_accel_z_raw=$rawz"

echo "/sys/bus/iio/devices/iio:device$g/name=$name0"
rawx1=`cat /sys/bus/iio/devices/iio:device$g/in_anglvel_x_raw`
echo "/sys/bus/iio/devices/iio:device$g/in_anglvel_x_raw=$rawx1"
rawy1=`cat /sys/bus/iio/devices/iio:device$g/in_anglvel_y_raw`
echo "/sys/bus/iio/devices/iio:device$g/in_anglvel_y_raw=$rawy1"
rawz1=`cat /sys/bus/iio/devices/iio:device$g/in_anglvel_z_raw`
echo "/sys/bus/iio/devices/iio:device$g/in_anglvel_z_raw=$rawz1"

zerox=0
if [ "$rawx" != "$zerox" ]; then
echo "in_accel_x_raw is $rawx,  rawx pass"
fi
zeroy=0
if [ "$rawy" != "$zeroy" ]; then
echo "in_accel_y_raw is $rawy,  rawy pass"
fi
zeroz=0
if [ "$rawz" != "$zeroz" ]; then
echo "in_accel_z_raw is $rawz,  rawz pass"
fi

zerox1=0
if [ "$rawx1" != "$zerox1" ]; then
echo "in_anglvel_x_raw is $rawx1,  rawx1 pass"
fi
zeroy1=0
if [ "$rawy1" != "$zeroy1" ]; then
echo "in_anglvel_y_raw is $rawy1,  rawy1 pass"
fi
zeroz1=0
if [ "$rawz1" != "$zeroz1" ]; then
echo "in_anglvel_z_raw is $rawz1,  rawz1 pass"
fi

fi

done
exit 