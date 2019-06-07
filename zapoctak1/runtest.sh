#!/bin/sh
echo "RUN:"$1"x"$2"x"$3"x";
output=$(./test.sh "../studenti/gity/$1/$3.sh" < "$3");
#errors=$(cmp -s "$output" ./"$2"/"$3".in);
if ! (cmp -s "$output" ./"$2"/"$3".out); then
        echo "Error in $3.sh." >> "./tmp/msg""$1";
        fi;
