#!/bin/sh
# rootdir pocetukolu repozitare
wd=$(pwd);
cd "$1";
mkdir "kontrolovac" 2>/dev/null || 
        {
        echo "Nelze inicializovat: V adresari $1 existuje adresar \"kontrolovac\"";
        exit;
        }
cd kontrolovac;
mkdir "./ukoly" "./studenti";
mkdir "./ukoly/kontroly" "./ukoly/tmp"
mkdir $(printf "./ukoly/ukol_%02i " $(seq -s ' ' $2));
mkdir $(printf "./ukoly/kontroly/ukol_%02i " $(seq -s ' ' $2));
touch "./ukoly/repozitare.txt";
cd $wd;
cat "$3" > "$1/kontrolovac/ukoly/repozitare.txt";
