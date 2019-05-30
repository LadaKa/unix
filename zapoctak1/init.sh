#!/bin/sh
# rootdir pocetukolu repozitare
mkdir "./$1/kontrolovac";
cd "./$1/kontrolovac";
mkdir "./ukoly" "./studenti";
for i in 1.."$2"; do
        mkdir "./ukoly/ukol_$i";
done;
touch "./ukoly/repozitare.txt";
cat "$3" > "./ukoly/repozitare.txt";
cd ../..;
