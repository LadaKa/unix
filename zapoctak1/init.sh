#!/bin/sh
# rootdir pocetukolu repozitare
mkdir "./$1/kontrolovac";
cd "./$1/kontrolovac";
mkdir "./ukoly" "./studenti";
mkdir "./ukoly/ukol_{1..$2}";
mkdir "./ukoly/tmp";
touch "./ukoly/repozitare.txt";
cd ../..;
cat "$3" > "./$1/kontrolovac/ukoly/repozitare.txt";
