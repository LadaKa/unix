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
mkdir "./studenti/gity";
mkdir "./ukoly/kontroly" "./ukoly/tmp";
mkdir $(printf "./ukoly/ukol_%02i " $(seq -s ' ' $2));
mkdir $(printf "./ukoly/kontroly/ukol_%02i " $(seq -s ' ' $2));
touch "./ukoly/repozitare.txt";
cd $wd;
cat "$3" > "$1/kontrolovac/ukoly/repozitare.txt";
while IFS=" " read -r name mail repo;
do
        dir="$1/kontrolovac/ukoly/kontroly/$name"
        mkdir "$dir";
        mkdir $(printf "$dir/ukol_%02i " $(seq -s ' ' $2));
done < "$1/kontrolovac/ukoly/repozitare.txt";    
