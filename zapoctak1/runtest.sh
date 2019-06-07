#!/bin/sh
#
# kontrolovac/ukoly/runtest.sh [NAME] [UKOL_N/JMENO_UKOLU]
#       Provede spusteni skriptu
#               "kontrolovac/studenti/gity/[NAME]/[UKOL_N/JMENO_UKOLU].sh"
#       se vstupem 
#               "kontrolovac/ukoly/[UKOL_N/JMENO_UKOLU].in"
#       (pomoci kontrolovac/ukolytest.sh)
#       a porovna ho s 
#               "kontrolovac/ukoly/[UKOL_N/JMENO_UKOLU].out"

input=$2".in";
output=$(./test.sh "../studenti/gity/$1/$2.sh" < $input);
out="$2.out";
if ! (cmp -s "$output" "$out"); then
        echo "Error in $2.sh." >> "./tmp/msg_$1";
        fi;
