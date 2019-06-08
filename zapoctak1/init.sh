#!/bin/sh
#
# init.sh --help
# init.sh [ADRESAR] [POCET UKOLU] [SOUBOR SE JMENY, E-MAILY A GIT REPOZITARI STUDENTU]

if [ "$1" = "--help" ];then
        echo "init.sh [ADRESAR] [POCET UKOLU] [SOUBOR SE JMENY, E-MAILY A GIT REPOZITARI STUDENTU]";
        echo "Vytvori nasledujici adresare v ADRESAR:";
        echo "          kontrolovac (pokud uz existuje [ADRESAR]/kontrolovac, vypise se chybove hlaseni)";
        echo "          kontrolovac/ukoly";
        echo "          kontrolovac/ukoly_01, ..., kontrolovac/ukoly_[POCET UKOLU]";
        echo "          kontrolovac/ukoly/tmp";
        echo "          kontrolovac/studenti/gity";
        echo "Zkopiruje do kontrolovac/ukoly/repozitare.txt [SOUBOR SE JMENY, E-MAILY A GIT REPOZITARI STUDENTU].";
        exit;
fi;
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
