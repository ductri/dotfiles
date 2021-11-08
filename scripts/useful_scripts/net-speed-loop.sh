#!/bin/bash

while : 
do
    ./net-speed.sh >> net-speed-log.txt
    tail -n 1 net-speed-log.txt
done
