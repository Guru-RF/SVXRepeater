#!/bin/bash

until [ -f /sys/class/gpio/gpio16/value ]
do
     sleep 5
done

PTT=$(cat /sys/class/gpio/gpio5/value)
if [ "${PTT}" == "1" ]; then
        print "Repeater PA down"
        echo 0 > /sys/class/gpio/gpio5/value
else
        echo 1 > /sys/class/gpio/gpio5/value
fi

