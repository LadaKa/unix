#!/bin/sh
#
# kontrolovac/ukoly/add_ukol.sh 
#       add_ukol.sh             Vytvori novy adresar.
#       add_ukol.sh [N]         Vytvori N novych adresaru.

min=$(ls |grep -c "ukol_");
min=$(( $min + 1 ));
if [ $# = 0 ];then
        max=$min;
elif ! [[ $1 =~ ^[0-9]+$ ]]; then
   echo "Chyba: zadany parametr neni cislo." >&2; exit 1;
else
        max=$(( $min + $1 - 1));
fi;
mkdir $(printf "ukol_%02i " $(seq -s ' ' $min $max));
