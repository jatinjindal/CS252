#!/bin/bash
crontab -l | { cat; echo "PATH=~/bin:/usr/bin/:/bin"; echo "*\5 * * * * /home/jatin/part2.sh"; } | crontab -
