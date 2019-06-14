#!/bin/sh
#
# kontrolovac/ukoly/test_all.sh 
#       Provadi klonovani a aktualizaci repozitaru a testovani reseni, ktera 
#       byla nove odevzdana do gitu.
#       Udaje o studentech cte z kontrolovac/ukoly/repozitare.txt, vysledky se
#       zapisuji do kontrolovac/ukoly/vysledky.txt
#       Pro testovani jednotlivych studentu a odeslani e-mailu se pouzivaji
#       funkce test_updated() a run_test().


# test_updated [NAME] [MAIL] [LOCALREPO]
#       Testuje reseni, ktera student nove odevzdal do  gitu (jsou nove v LOCALREPO). 
#       Cas posledni kontroly jednotlivych ukolu reprezentuji soubory:
#               kontrolovac/ukoly/kontroly/NAME/ukol_01, ..., kontrolovac/ukoly/kontroly/NAME/ukol_N.
#       Vytvori docasny soubor msg_NAME v kontrolovac/ukoly/tmp pro zapis pripadnych chyb a informace 
#       o chybach odesle na na MAIL.

test_updated()
{
        vysledek="$name\t";
        soucet=0;
        for dir in $(find ./ukol_* -prune); do
                body=0;
                dirname=$(basename "$dir");
                
                if [ "$3/$dirname" -nt "./kontroly/$1/$dirname" ]; then
                        for ukol in $(find $dir -name "*.in"); do
                                jmeno_ukolu=`echo "$ukol"|sed "s/.in$//"|sed "s/^.\\///"`;
                                run_test $name "$jmeno_ukolu";
                        done;
                        touch "./kontroly/$1/$dirname";
                        soucet=$(( $soucet + $body ));
                        vysledek="$vysledek\t\t$body";
                else
                        vysledek="$vysledek\t\t-";
                fi;
        done;
        errorfile="./tmp/msg_""$1";
        if [ -e "$errorfile" ]; then
                mail -s "Chyby v domacich ulohach" "$2" < "$errorfile";
                rm "$errorfile";
        fi;
        echo -e "$vysledek\t\t$soucet" >> vysledky.txt;
}


# run_test [NAME] [UKOL_N/JMENO_UKOLU]
#       Provede spusteni skriptu
#               "kontrolovac/studenti/gity/[NAME]/[UKOL_N/JMENO_UKOLU].sh"
#       se vstupem 
#               "kontrolovac/ukoly/[UKOL_N/JMENO_UKOLU].in"
#       (pomoci kontrolovac/ukoly/test.sh)
#       a porovna ho s 
#               "kontrolovac/ukoly/[UKOL_N/JMENO_UKOLU].out"

run_test()
{
        input="$2.in";
        ./test.sh "../studenti/gity/$1/$2.sh" < $input > "./tmp/output";
        out="$2.out";
        if ! (cmp -s "./tmp/output" "$out"); then
                echo "Error in $2.sh." >> "./tmp/msg_$1";
        else
                pricti_body "$2.points"; 
        fi;
}


# pricti_body [JMENO_UKOLU.points]
#       Pricte k bodum hodnotu uvedenou v souboru JMENO_UKOLU.points, 
#       nebo pricte jednicku, pokud soubor neexistuje.

pricti_body()
{
        if [ -e "$1" ];then
                read -r x<"$1";
                        body=$(( $x + $body ));
                else
                        body=$(( 1 + $body ));
                fi;  
}

# kontrolovac/ukoly/test_all.sh
touch vysledky.txt;
text="jmeno\t";
points="maximum\t";
soucet=0;
for ukol in ./ukol*; do
        text="$text\t$ukol";
        body=0;
        for podukol in $ukol/*".points"; do
                pricti_body "$podukol";
        done;
        soucet=$(( $soucet + $body ));
        points="$points\t\t$body";
done;
text="$text\tsoucet";
points="$points\t\t$soucet";
echo -e "$text" > vysledky.txt;
echo -e "$points" >> vysledky.txt;
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
done < repozitare.txt;
touch "./tmp/output";
rm "./tmp/output";
