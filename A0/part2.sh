#!/bin/bash
rm ~/apod/*.jpg ~/apod/*.html ~/apod/*.txt
user=$(whoami)
cd ~/apod
wget https://apod.nasa.gov/apod/ap180709.html
a='http://apod.nasa.gov/apod/'
grep 'href="i' ap180709.html > temp.txt
wget https://apod.nasa.gov/apod/ap180724.html
grep 'href="i' ap180724.html >> temp.txt

b=$(shuf -n 1 temp.txt|awk -F "\"" '{print $2}') 
c=$a$b
IFS='/' read -r -a array <<< "$b"

d=${array[-1]}
wget $c
imname=$(ls $d)
/usr/bin/gsettings set org.gnome.desktop.background picture-uri file:///$(pwd)/$imname
