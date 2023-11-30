#!/bin/bash 

while ! mysqladmin ping -h db -u ragnarok --password=ragnarok --silent; do
    sleep 1
done

./login-server &
./char-server &
./map-server & 
wsproxy -p 5999 -a localhost:6900,localhost:6121,localhost:5121

while [ 1 ]; do
    /bin/bash
done