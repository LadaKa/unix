#!/bin/sh
#
# kontrolovac/ukoly/test_all.sh 
#       Provadi klonovani a aktualizaci repozitaru a testovani reseni, ktera byla nove odevzdana do gitu.
#       Udaje o studentech cte z kontrolovac/ukoly/repozitare.txt.
#       Pro testovani jednotlivych studentu a odeslani e-mailu se pouziva funkce test_updated().


# test_updated() [NAME] [MAIL] [LOCALREPO]
#       Testuje reseni, ktera student nove odevzdal do  gitu (jsou nove v LOCALREPO). 
#       Cas posledni kontroly jednotlivych ukolu reprezentuji soubory:
#               kontrolovac/ukoly/kontroly/NAME/ukol_01, ..., kontrolovac/ukoly/kontroly/NAME/ukol_N.
#       Vytvori docasny soubor msg_NAME v kontrolovac/ukoly/tmp pro zapis pripadnych chyb a informace 
#       o chybach odesle na na MAIL.
test_updated()
{
        for dir in ./ukol*/; do
                dirname=$(basename "$dir");
                if [ "$3/$dirname" -nt "./kontroly/$1/$dirname" ]; then
                        for ukol in $dir*".in"; do
                                jmeno_ukolu=`echo $ukol|sed "s/.in$//"|sed "s/^.\\///"`;
                                ./runtest.sh $name $jmeno_ukolu;
                        done;
                        touch "./kontroly/$name/$dirname";
                        errorfile="./tmp/msg_""$1"
                        if [ -e "$errorfile" ]; then
                               mail -s "Chyby v domacich ulohach" "$2" < "$errorfile";
                               rm "$errorfile";
                        fi;
                fi;
        done;
}

# kontrolovac/ukoly/test_all.sh

while IFS=" " read -r name mail repo
do
        localrepo="../studenti/gity/$name";
        if [ ! -d "$localrepo" ]; then
                git clone $repo $localrepo;
        else
                cd "$localrepo";
                git pull $repo;
                cd "../../../ukoly";
        fi;
        test_updated $name $mail $localrepo;
done < repozitare.txt
