#!/bin/sh
echo "RUN:"$1"x"$2"x"$3"x";
input=$3".in";
output=$(./test.sh "../studenti/gity/$1/$3.sh" < $input);
echo "OUTPUT:$output";
out="$3.out";
echo "OUT:$out";
if ! (cmp -s "$output" "$out"); then
        echo "Error in $3.sh." >> "./tmp/msg_$1";
        fi;
