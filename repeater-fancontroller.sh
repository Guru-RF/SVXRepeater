#!/bin/bash

until [ -f /sys/class/gpio/gpio16/value ]
do
     sleep 5
done

while [ 1 ]
do
    PTT=$(cat /sys/class/gpio/gpio16/value)
    if [ "${PTT}" == "1" ]; then
            echo 1 > /sys/class/gpio/gpio6/value
            sleep 60
    else
            echo 0 > /sys/class/gpio/gpio6/value
    fi
    sleep 1
done

