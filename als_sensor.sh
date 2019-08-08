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

if [ $name0!=isl29035 ]; then
echo $((g++))
name0=`cat /sys/bus/iio/devices/iio:device$g/name`
echo "/sys/bus/iio/devices/iio:device$g/name=$name0"

if [ $name0!=isl29035 ]; then
raw1=`cat /sys/bus/iio/devices/iio:device$g/in_intensity_ir_raw`
echo "/sys/bus/iio/devices/iio:device$g/in_intensity_ir_raw=$raw1 "

null=""
if [ "$raw1" == "$null" ]; then
echo "in_intensity_ir_raw is $null, fail"
fi
exit

zero=0
if [ "$raw1" != "$zero" ]; then
echo "in_intensity_ir_raw is $raw1, pass"
fi

fi


fi

done
exit 