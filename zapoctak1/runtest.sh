#!/bin/sh
output=$(./test.sh ../studenti/gity/"$1"/"$2"/"$3".sh < ./"$2"/"$3".in)
errors=$(cmp -s "$output" ./"$2"/"$3".in)
if ! (cmp -s "$output" ./"$2"/"$3".in); then
        echo "Error in $3.sh." >> "./tmp/msg""$1";
        fi;
